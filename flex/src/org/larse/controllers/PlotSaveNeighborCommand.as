package org.larse.controllers
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.PlotEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.PlotModel;
	import org.larse.services.TimeSyncService;
	import org.larse.vos.Plot;
	
	public class PlotSaveNeighborCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var plotModel:PlotModel;
		[Inject] public var global:GlobalModel;
		
		public function PlotSaveNeighborCommand() {}
		
		public function execute(event:PlotEvent):AsyncToken
		{
			trace("PlotSaveNeighborCommand.execute()");
			if (global.project_id > 0 && global.tsa > 0) {
				return service.getAllPlots(global.project_id, global.tsa);
			}
			else
				return null;
		}
		
		public function result(list:ArrayCollection):void
		{
			trace("PlotSaveNeighborCommand.result()");
			plotModel.Plots = list;
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Save Neighbor Error");
		}
	}
}