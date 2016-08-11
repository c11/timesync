"""
Generate stacked image chips for timesync


This script differs from ts_chip_harvestor in that it use export task to
create chips.

ToDo:
	add configuration for export location. Currently hard coded to google drive


"""
import ee
from ee.batch import Export

import json
import oauth2client.client
import os
from time import sleep


#Mininum values were truncated to 0 for raw spectral bands
VIS_BGW = {"bands": ["B", "G", "W"], "min": [604, 49, -2245], "max": [5592, 3147, 843]}
VIS_743 = {"bands": ["B7", "B4", "B3"], "min": [0, 912, 0], "max": [3075, 3880, 1962]}
VIS_432 = {"bands": ["B4", "B3", "B2"], "min": [912, 0, 0], "max": [3880, 1962, 1571]}

VIS_SET = {'tc': VIS_BGW, 'b743': VIS_743, 'b432': VIS_432}

BAND_NAMES = ["B1", "B2", "B3", "B4", "B5", "B7", 'cfmask']
SR_SET = {'LT5': 'LANDSAT/LT5_SR', 'LE7': 'LANDSAT/LE7_SR', 'LC8': 'LANDSAT/LC8_SR'}
BAND_SET = {'LT5': [0, 1, 2, 3, 4, 5, 6], 'LE7': [0, 1, 2, 3, 4, 5, 6], 'LC8': [1, 2, 3, 4, 5, 6, 7]}

def getImageCollection(sensor, point):
	"""construct LT5 and LE7 image collection for a given location.

	Args:
		sensor (string): sensor name
		point (ee.Geometry.Point): pixel sample

	Returns:
		an image collection
	"""
	collection = ee.ImageCollection(SR_SET[sensor])\
		.filterBounds(point)\
		.select(BAND_SET[sensor], BAND_NAMES)
		# .map(lambda img: img.set('YD', ee.Date(img.get('system:time_start')).format('YD'))) \
		# .distinct('YD')

	return collection.sort('system:time_start')


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

def getChips(sr, project_id, plotid, collection, chip_name, vis, poly, crs):
	"""retrieve image chips.

	Args:
		collection (ee.ImageCollection): a image colleciton to extract chips.
		vis (dictionary): visualization parameters.
		point (ee.Geometry.Point): pixel sample.
		size (int): image chip dimension in pixels.
`
	Returns:
		none
	"""
	print '\t\t', 'chipping', sr, project_id, plotid, chip_name

	first = ee.Image(collection.first()).visualize(**vis).unmask()
	result = collection.iterate(lambda img, prev: ee.Image(prev).addBands(ee.Image(img).visualize(**vis).unmask()), first)

	this_job = '%s_project_%d_plot_%d_%s' % (sr, project_id, plotid, chip_name)
	this_folder = 'prj_%s' % project_id

	task = Export.image.toDrive(ee.Image(result), this_job, this_folder, this_job, None, poly.transform(None, 5).getInfo()['coordinates'], 30, crs, None, 1e13)
	task.start()

def getPlotBox(image, point, chipSize):
	"""create a polygon snapped to the image"""
	base = ee.Image(image)
	crs = base.projection().crs().getInfo()

	ps = 30
	halfx = ps * chipSize / 2.0

	geometry = point.transform(crs, 5)

	cor = geometry.coordinates()
	cx = ee.Number(cor.get(0)).add(15).divide(30).floor().multiply(30).getInfo()
	cy = ee.Number(cor.get(1)).add(15).divide(30).floor().multiply(30).getInfo()
	coords = [[[cx - halfx, cy - halfx + 30],
			   [cx - halfx, cy + halfx],
			   [cx + halfx - 30, cy + halfx],
			   [cx + halfx - 30, cy - halfx + 30],
			   [cx - halfx, cy - halfx + 30]]]

	return crs, ee.Geometry.Polygon(coords, crs, False)

def exportSpectrals(sr, project_id, plotid, collection, pixel):
	print '\t\textract spectral values:', sr
	final = ee.ImageCollection(collection).map(lambda image: image.reduceRegions(ee.FeatureCollection([pixel]), 'first', scale=30, tileScale=16), False)

	this_job = 'spectrals_%s_project_%d_plot_%d' % (sr, project_id, plotid)
	this_folder = 'prj_%s' % project_id

	print '\t\texport spectral information:', sr
	task = Export.table(final.flatten().select(['.*'], None, False), this_job, {'driveFolder': this_folder})
	task.start()

def harvestChips(projectid, plotid, lnglat, **kwargs):
	pixel = ee.Geometry.Point(lnglat)
	poly = None

	for sr in SR_SET.keys():

		collection = getImageCollection(sr, pixel)

		N = collection.size().getInfo()
		print '\t total number of image: %d' % N
		if N == 0:
			return

		exportSpectrals(sr, projectid, plotid, collection, pixel)

		crs, box = getPlotBox(collection.first(), pixel, 255)

		for cs in VIS_SET.keys():
			if cs in kwargs.keys() and kwargs[cs]:
				if cs == 'tc':
					tc_collection = collection.map(tcTransform)
					getChips(sr, projectid, plotid, tc_collection, cs, VIS_SET[cs], box, crs)
				else:
					getChips(sr, projectid, plotid, collection, cs, VIS_SET[cs], box, crs)

def processPlots(plot_file, **kwargs):
	with open(plot_file) as infh:
		infh.readline()

		#projectid,plotid,longitude,latitude
		for line in infh:
			items = line.strip().split(',')
			project_id = int(items[0])
			plot_id = int(items[1])
			lng = float(items[2])
			lat = float(items[3])

			lnglat = (lng, lat)

			success = False
			tries = 1
			idle = 1

			while not success:
				try:
					print 'project: %d, plot: %d, trial: %d' % (project_id, plot_id, tries)

					harvestChips(project_id, plot_id, lnglat, **kwargs)

					success = True
				except Exception as e:
					success = False
					tries += 1
					idle += 1
					if idle > 30:
						idle = 1
					sleep(idle)
					print('\t\t' + e.message)
