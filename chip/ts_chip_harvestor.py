"""
Generate stacked image chips for timesync



TODO:
	this script took about 25 minutes to get a single pixels ready. After discussing with Ian,
	it seems that an export task might give some advantage as multiple tasks can run simultaneously.
	Currently, the chips are created using horizontal stacking. Evaluate turning this into a export 
	batch job using vertical stacking.

"""

import ee
from ee.batch import Export

import json
import oauth2client.client
import os
import urllib
import datetime
import shutil
from time import sleep
import sys

###################################################################################

#Mininum values were truncated to 0 for raw spectral bands
VIS_BGW = {"bands": ["B", "G", "W"], "min": [604, 49, -2245], "max": [5592, 3147, 843]}
VIS_743 = {"bands": ["B7", "B4", "B3"], "min": [0, 912, 0], "max": [3075, 3880, 1962]}
VIS_432 = {"bands": ["B4", "B3", "B2"], "min": [912, 0, 0], "max": [3880, 1962, 1571]}

VIS_SET = {'tc': VIS_BGW, 'b743': VIS_743, 'b432': VIS_432}

def getImageCollection(year, point):
	"""construct LT5 and LE7 image collection for a given location.

	Args:
		year (int): image year
		point (ee.Geometry.Point): pixel sample

	Returns:
		an image collection
	"""
	le7_collection = ee.ImageCollection('LANDSAT/LE7_SR') \
						.filterBounds(point) \
						.filter(ee.Filter.calendarRange(year, year, 'year'))

	lt5_collection = ee.ImageCollection('LANDSAT/LT5_SR') \
						.filterBounds(point) \
						.filter(ee.Filter.calendarRange(year, year, 'year'))

	return lt5_collection.merge(le7_collection).sort('system:time_start')

def makeThumbURL(id):
	"""construct image url.

	'https://earthengine.googleapis.com/api/thumb?thumbid=' + id['thumbid'] + '&token=' + id['token']

	Args:
		id (object): object with thumbnail information. It has the following properties:
			- thumbid
			- token

	Returns:
		image url
	"""
	return 'https://earthengine.googleapis.com/api/thumb?thumbid=%s&token=%s' % (id['thumbid'], id['token'])

def getChips(collection, vis, point, size):
	"""retrieve image chips.

	Args:
		collection (ee.ImageCollection): a image colleciton to extract chips.
		vis (dictionary): visualization parameters.
		point (ee.Geometry.Point): pixel sample.
		size (int): image chip dimension in pixels.

	Returns:
		image chip url
	"""
	result = collection.map(lambda img: ee.Image(img).visualize(**vis).unmask())

	box = point.buffer(size / 2.0 * 30, 5).bounds(5)

	# print box.getInfo()['coordinates']

	thumbID = ee.data.getThumbId({'image': result.serialize(),
			  'dimensions': size,
			  'region': box.getInfo()['coordinates'],
			  'format': 'png'})

	return ee.data.makeThumbUrl(thumbID)


def tcTransform(image):
	b = ee.Image(image).select(["B1", "B2", "B3", "B4", "B5", "B7"])
	brt_coeffs = ee.Image([0.2043, 0.4158, 0.5524, 0.5741, 0.3124, 0.2303])
	grn_coeffs = ee.Image([-0.1603, -0.2819, -0.4934, 0.7940, -0.0002, -0.1446])
	wet_coeffs = ee.Image([0.0315, 0.2021, 0.3102, 0.1594, -0.6806, -0.6109])

	sum = ee.call("Reducer.sum")
	brightness = b.multiply(brt_coeffs).reduce(sum)
	greenness = b.multiply(grn_coeffs).reduce(sum)
	wetness = b.multiply(wet_coeffs).reduce(sum)

	return ee.Image(brightness).addBands(greenness).addBands(wetness).select([0,1,2], ['B','G','W'])

def harvestChips(projectid, plotid, lnglat, outdir, **kwargs):

	pixel = ee.Geometry.Point(lnglat)

	chip_img = 'plot_%d_chip_strip_%d_%s.png'
	chip_info = 'plot_%d_chip_strip_%d.info'

	def createChips(collection, name, vis):
		this_chip = os.path.join(outdir, chip_img % (plotid, year, name))
		# this_info = os.path.join(outdir, chip_info % (plotid, year, name))

		# with open(this_info, 'w') as oufh:
		# 	oufh.writelines('\n'.join(images))

		url = getChips(collection, vis, pixel, 255)
		urllib.urlretrieve(url, this_chip)

	def extractSpectral(collection, point):
		refls = ee.ImageCollection(collection)\
			.select(["B1", "B2", "B3", "B4", "B5", "B7", 'cfmask'])\
			.getRegion(point, 30).getInfo()

		results = []
		#the first elements is always the metadata
		if len(refls) > 1:
			for refl in refls[1:]:
				id = refl[0]
				sensor = id[2:5]
				ppprrr = str(int(id[5:11]))
				imgyear = id[11:15]
				imgday = id[15:18]
				spectrals = refl[4:]

				if None in spectrals:
					continue

				this_row = [sensor, str(projectid), str(plotid), ppprrr, imgyear, imgday] + map(str, spectrals)
				results.append(','.join(this_row))

		return results

	results = []
	for year in range(1984, datetime.date.today().year):
		print projectid, plotid, 'processing', year

		collection = getImageCollection(year, pixel)
		ids = collection.getInfo()['features']

		#no images available for this location
		if len(ids) == 0:
			print '\t\tno images for', projectid, plotid
			continue

		images = []
		for id in ids:
			images.append(id['id'])

		this_info = os.path.join(outdir, chip_info % (plotid, year))
		with open(this_info, 'w') as oufh:
			oufh.writelines('\n'.join(images))

		refls = extractSpectral(collection, pixel)
		results += refls
		for cs in VIS_SET.keys():
			if cs in kwargs.keys() and kwargs[cs]:
				if cs == 'tc':
					tc_collection = collection.map(tcTransform)
					createChips(tc_collection, cs, VIS_SET[cs])
				else:
					createChips(collection, cs, VIS_SET[cs])

	return results

def processPlots(plot_file, out_dir, spectral_file, **kwargs):

	# to avoid accidental overwrite, make copy of existing spectral file
	if os.path.exists(spectral_file):
		bak = spectral_file + '.' + datetime.datetime.now().strftime('%Y%m%d%H%M')
		shutil.move(spectral_file, bak)

	with open(plot_file) as infh, open(spectral_file, 'a') as oufh:
		infh.readline()

		#projectid,plotid,longitude,latitude
		for line in infh:
			items = line.strip().split(',')
			project_id = int(items[0])
			plot_id = int(items[1])
			lng = float(items[2])
			lat = float(items[3])

			lnglat = (lng, lat)

			#setup chip directory
			this_dir = 'prj_%d/plot_%d' % (project_id, plot_id)
			this_dir = os.path.join(out_dir, this_dir)
			if not os.path.exists(this_dir):
				os.makedirs(this_dir)

			success = False
			tries = 1
			idle = 1

			while not success:
				try:
					print '\t\t trial', tries

					spectrals = harvestChips(project_id, plot_id, lnglat, this_dir, **kwargs)
					oufh.writelines('\n'.join(spectrals))
					oufh.writelines('\n')
					oufh.flush()

					success = True
				except Exception as e:
					success = False
					tries += 1
					idle += 1
					if idle > 30:
						idle = 1
					sleep(idle)
					print('\t\t' + e.message)
