import ee
from ts_chip_harvestor import *

ee.Initialize()

#the CSV file expect to have 4 columns: projectid, plotid, longitude, latitude
#the projectid field is a place holder, can use any number for now. It will be used 
#to create a subfolder under out_dir to hold all the chips

plot_file = 'PLOT_CSV_FILE'
out_dir = 'CHIP_DIRECTORY'
spectral_file = 'SPECTRAL_OUTPUT_FILE'

chips = {
	'tc': True,
	'b743': True,
	'b432': True
}

processPlots(plot_file, out_dir, spectral_file, **chips)
