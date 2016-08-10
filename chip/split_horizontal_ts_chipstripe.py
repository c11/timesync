"""
split timesync image strip into individual chip

@This set of routines has tentative replaced by the GEE tasked based chip creation.

This script split the image chip strips into individual images. Using individual image
reduce the network load when displaying the image chips.

Assumption: for each plot, there are four files:
	plot_x_chip_strip_yyyy_b743.png
	plot_x_chip_strip_yyyy_b432.png
	plot_x_chip_strip_yyyy_tc.png
	plot_x_chip_strip_yyyy.info
	

Example:
	stripe_dir = 'DIRECTORY_OF_IMAGE_CHIP_STRIPE'
	output_dir = 'DIRECTORY_OF_SPLITTED_IMAGE_CHIP'
	log_file = 'PATH_TO_A_LOG_FILE_FOR_ANOMALY_DURING_SPLIT_PROCESS'

	splitChips(stripe_dir, output_dir, log_file)

"""
import os
from PIL import Image

def parseChipInfo(info_file):
	results = []
	with open(info_file) as infh:
		for line in infh:
			results.append(line.strip().split('/')[-1][-7:])
	return results


def splitImage(image_stack, ids, chip_dir):
	basefile = os.path.basename(image_stack)

	bands = basefile.split('_')[-1].replace('.png','')
	plotid = basefile.split('_')[1]

	this_outdir = os.path.join(chip_dir, '%s/plot_%s' % (bands, plotid))


	if not os.path.exists(this_outdir):
		os.makedirs(this_outdir)

	image = Image.open(image_stack)

	if len(ids) * image.size[0] != image.size[1]:
		print 'corrupted image'

	chipSize = image.size[0]
	for i in range(len(ids)):
		upper = i * chipSize
		lower = (i + 1) * chipSize

		yyyyddd = '%s_%s' % (ids[i][0:4], ids[i][-3:])
		print yyyyddd

		chip_file = os.path.join(this_outdir, basefile.replace('chip_strip_', '').replace('%s.png' % bands, '%s.png' % ids[i][-3:]))
		if os.path.exists(chip_file):
			continue

		chip = image.crop((0, upper, chipSize, lower))
		chip.save(chip_file)


def splitChips(stripe_dir, chip_dir, log_file):
	"""split all the file in the specified directory.
	"""
	with open(log_file, 'a') as oufh:
		for root, dirs, files in os.walk(stripe_dir):
			for f in files:
				if f.startswith('plot') and f.endswith('.info'):

					this_info = os.path.join(root, f)
					ids = parseChipInfo(this_info)

					this_outroot = chip_dir

					print 'unstacking tc'
					fc_file = f.replace('.info', '_tc.png')
					try:
						splitImage(os.path.join(root, fc_file), ids, this_outroot)
					except Exception as e:
						oufh.writelines('%s: %s\n' % (fc_file, e.message))

					print 'unstacking 743'
					fc_file = f.replace('.info', '_b743.png')
					try:
						splitImage(os.path.join(root, fc_file), ids, this_outroot)
					except Exception as e:
						oufh.writelines('%s: %s\n' % (fc_file, e.message))

					print 'unstacking 432'
					fc_file = f.replace('.info', '_b432.png')
					try:
						splitImage(os.path.join(root, fc_file), ids, this_outroot)
					except Exception as e:
						oufh.writelines('%s: %s\n' % (fc_file, e.message))

					oufh.flush()
