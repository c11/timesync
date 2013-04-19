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
	
	public class PlotGetAllCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var plotModel:PlotModel;
		[Inject] public var global:GlobalModel;
		
		public function PlotGetAllCommand() {}
		
		public function execute(event:PlotEvent):AsyncToken
		{
			trace("PlotGetAllCommand.execute()");
			if (global.project_id > 0 && global.tsa > 0) {
				var interp:int = global.examinee_id > 0 ? global.examinee_id : global.interpreter.user_id; 
				return service.getAllPlots(global.project_id, global.tsa, interp);
			}
			else
				return null;
		}
		
		public function result(list:ArrayCollection):void
		{
			trace("PlotGetAllCommand.result()");
			plotModel.Plots = list;
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Get Plots Error");
		}
	}
}