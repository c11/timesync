package org.larse.controllers
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.ImageListEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.ImageListModel;
	import org.larse.model.PlotModel;
	import org.larse.services.TimeSyncService;
	import org.larse.tsclass.ImageChip;
	import org.larse.vos.RegionSpectral;
	
	public class PlotOverrideChipCommand
	{
		[Inject] public var im_service:TimeSyncService;
		[Inject] public var imageList_model:ImageListModel;
		[Inject] public var global:GlobalModel;
		[Inject] public var plotModel:PlotModel;
		
		public function PlotOverrideChipCommand() {}
		
		public function execute(event:ImageListEvent):AsyncToken
		{
			trace("PlotGetAllChipsCommand.execute()");
			if (global.project_id > 0 && global.tsa > 0) {
				return im_service.overrideImagePriority(event.data.project_id, event.data.tsa, event.data.plotid, event.data.year, event.data.julday, event.data.old_year, event.data.old_julday);
			}
			else 
				return null;
		}
		
		public function result(result:int):void
		{
			trace("PlotOverrideChipCommand.result()");
			plotModel.currentPlot.isSpectralLoaded = false;
			plotModel.currentPlot.isChiplistDefined = false;
			plotModel.currentPlot.isVertexLoaded = false;
			plotModel.plotSelectionChanged();
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Failed to override image priority");
		}
	}
}