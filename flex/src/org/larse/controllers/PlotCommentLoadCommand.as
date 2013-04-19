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
	import org.larse.vos.PlotComments;
	
	public class PlotCommentLoadCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var plotModel:PlotModel;
		[Inject] public var global:GlobalModel;
		
		private var _plot:Plot = null;
		
		public function PlotCommentLoadCommand() {}
		
		public function execute(event:PlotEvent):AsyncToken
		{
			_plot = event.CurrentPlot;
			
			trace("PlotCommentLoadCommand.execute()");
			if (global.project_id > 0 && global.tsa > 0) {
				return service.loadCommentForPlot(global.project_id, global.tsa, _plot.plotid, global.interpreter.user_id);
			}
			else
				return null;
		}
		
		public function result(comment:PlotComments):void
		{
			trace("PlotCommentLoadCommand.result()");
			_plot.comment = comment.comment;
			_plot.isExample = comment.is_example != 0;
			_plot.isCommentLoaded = true;
			_plot.uncertainty = comment.uncertainty;
			plotModel.plotModified();
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Load Plot Comment Error");
		}
	}
}