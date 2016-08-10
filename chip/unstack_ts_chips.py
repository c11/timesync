"""
Unstack timesynch chip from GEE export task

The chips created with ts_chip_harvestor_task.py is a multi-bands images. 
Every three bands in that image corresponds to a Landsat image. There are three
set of chips and one spectral file for each plot, e.g:

	project_1027_plot_249806_b743.tif
	project_1027_plot_249806_b432.tif
	project_1027_plot_249806_tc.tif
	spectrals_project_1027_plot_249826.csv

This script assumes all these four files exists and currently does not do error checking
on these files.

The main function is unstack(), which first parse the spectral file and grab all the images id
that are used to generate the chips. Then based on the above naming convention, each of the stacked
file is processed using gdal_translate. 

Due to the large number of bands, using gdal_translate to unstack the file is a very slow process.
This script should be wrapped in multiprocessing pool when it is called to unstack a set of plots.

Updated to remove gdal_translate step

Note:
	Even though the stacked image is faster in generation, the current unstacking process make it 
takes maybe longer time than ts_chip_harvestor.py. More evaluation is needed for this.


Single Thread Example:

	stack_dir = 'DIRECTORY_OF_STACKED_CHIP_FILES'
	unstack_dir = 'DIRECTORY_OF_UNSTACKED_CHIP_FILES'

	for f in os.listdir(stack_dir):
		if f.startswith('spectrals') and f.endswith('.csv'):
			unstack(os.path.join(stack_dir, f), unstack_dir)

"""

import os
from PIL import Image
from osgeo import gdal
import numpy as np

def unstack(spectral_file, root_dir):
	"""It is assumed that the file name pattern are

	spectrals_project_x_plot_y.csv
	project_x_plot_y_b743.tif
	project_x_plot_y_b432.tif
	project_x_plot_y_tc.tif

	@param spectral_file: the csv file created from the chip harvestor
	@root_dir: unstacked chip output root directory
	"""
	if not os.path.exists(root_dir):
		os.makedirs(root_dir)

	basename = os.path.basename(spectral_file).replace('spectrals_', '').replace('.csv', '')

	items = basename.split('_')
	projectid = items[1]
	plotid = items[-1]

	#first parse the spectral file and in the same time create list of images
	spectral_output = os.path.join(root_dir, 'parsed_%s.csv' % basename)

	ids = []
	spectrals = []

	with open(spectral_file) as infh, open(spectral_output, 'w') as oufh:
		infh.readline()

		for line in infh:
			items = line.strip().split(',')
			fid = items[0].split('_')[-2]
			sensor = fid[0:3]
			yyyy = fid[-7:-3]
			ddd = fid[-3:]

			this_id = [sensor, projectid, plotid, yyyy, ddd]
			ids.append(this_id)

			#missing spectral data for this location
			if items[1] != '' and items[2] != '':
				this_spectrals = items[1:]

				spectrals.append(','.join(this_id+this_spectrals))

		oufh.writelines('\n'.join(spectrals))
		spectrals = None

	#always put a log file in the output root directory
	this_log = os.path.join(root_dir, 'unstack.log')

	spectral_dir = os.path.dirname(spectral_file)

	def unstackThis(bands, prjid, file_handle):
		this_file = os.path.join(spectral_dir, '%s_%s.tif' % (basename, bands))
		try:
			if not os.path.exists(this_file):
				file_handle.writelines('%s: does not exists!')
			else:
				# unstackSingleFile(this_file, ids, os.path.join(root_dir, bands))
				unstackSingleFile(this_file, ids, os.path.join(root_dir, 'prj_%s/%s' % (projectid, bands)))
		except Exception as e:
			file_handle.writelines('%s: %s' % (this_file, e.message))
			file_handle.writelines('\n')

	with open(this_log, 'a') as oufh:
		unstackThis('tc', projectid, oufh)
		unstackThis('b743', projectid, oufh)
		unstackThis('b432', projectid, oufh)



def unstackSingleFile(stack_file, ids, output_dir):
	if not os.path.exists(output_dir):
		os.makedirs(output_dir)

	print 'processing', stack_file
	ds = gdal.Open(stack_file)
	dat = ds.ReadAsArray()

	for idx in range(1, len(ids)+1):
		id = ids[idx-1]
		this_dir = os.path.join(output_dir, 'plot_%s' % id[2])
		if not os.path.exists(this_dir):
			os.makedirs(this_dir)

		this_png = 'plot_%s_%s_%s.png' % (id[2], id[3], id[4])

		print '\t', this_png
		this_png = os.path.join(this_dir, this_png)

		this_image = Image.fromarray(np.transpose(dat[(idx*3):(idx*3+3)], [1,2,0]))
		this_image.save(this_png)


