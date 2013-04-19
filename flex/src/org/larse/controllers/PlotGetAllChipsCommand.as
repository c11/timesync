package org.larse.controllers
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.ImageListEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.ImageListModel;
	import org.larse.services.TimeSyncService;
	import org.larse.tsclass.ImageChip;
	import org.larse.vos.RegionSpectral;
	
	public class PlotGetAllChipsCommand
	{
		[Inject] public var im_service:TimeSyncService;
		[Inject] public var imageList_model:ImageListModel;
		[Inject] public var global:GlobalModel;
		
		public function PlotGetAllChipsCommand() {}
		
		public function execute(event:ImageListEvent):AsyncToken
		{
			trace("PlotGetAllChipsCommand.execute()");
			if (global.project_id > 0 && global.tsa > 0) {
				return im_service.getPlotRegionSpectralForYear(event.data.project_id, event.data.tsa, event.data.plotid, event.data.year);
			}
			else 
				return null;
		}
		
		public function result(list:ArrayCollection):void
		{
			trace("PlotGetAllChipsCommand.result()");
			
			var chips:ArrayCollection = new ArrayCollection();
			var seq:int = 1;
			for each (var rs:RegionSpectral in list) {
				var chip:ImageChip = new ImageChip();
				chip.plotid = rs.plotid;
				chip.year = rs.image_year;
				chip.julday = rs.image_julday;
				chip.project_id = rs.project_id;
				chip.tsa = rs.tsa;
				
				var filename:String = "plot_"+ chip.plotid + "/tsa_" + chip.tsa + "_plot_" + chip.plotid + "_" + chip.year +"-" + chip.julday + ".png";
				chip.chipUrl = im_service.server + "storages/prj_" + chip.project_id + "/ts_" + chip.tsa +"/" + filename + "?ts=" + new Date().time;
				
				chip.sequence = seq++;
				chips.addItem(chip);
			}
			imageList_model.imageList = chips;
			trace(chips.length);
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Load All Chips Error");
		}
	}
}