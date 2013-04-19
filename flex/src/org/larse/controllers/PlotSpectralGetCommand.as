package org.larse.controllers
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.PlotEvent;
	import org.larse.model.GlobalModel;
	import org.larse.model.PlotModel;
	import org.larse.services.TimeSyncService;
	import org.larse.tsclass.PlotSpectral;
	import org.larse.vos.Plot;
	import org.larse.vos.RegionSpectral;
	
	public class PlotSpectralGetCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var plotModel:PlotModel
		[Inject] public var global:GlobalModel;
		
		private var _plot:Plot;
		
		public function PlotSpectralGetCommand() {}
		
		public function execute(event:PlotEvent):AsyncToken
		{
			trace("PlotSpectralGetCommand.execute()");
			_plot = event.CurrentPlot;
			return service.getPlotRegionSpectral(_plot.project_id, _plot.tsa, _plot.plotid);
		}
		
		public function result(list:ArrayCollection):void
		{
			trace("PlotSpectralGetCommand.result()");
			//TODO: should the region spectrals be kept for each plot?
			//_plot.regionSpectrals = list;
			trace("Spectral count " + list.length);
			var plotsize:int = plotModel.plotSize;
			//construct plot spectral properties
			var delim:String = "|";
			
			_plot.plotSpectrals.removeAll();
			
			global.min_year = 9999;
			global.max_year = 0;
			
			var seq:int = 0;
			for each (var rs:RegionSpectral in list) {
				var b1:Array = rs.b1.split(delim);
				var b2:Array = rs.b2.split(delim);
				var b3:Array = rs.b3.split(delim);
				var b4:Array = rs.b4.split(delim);
				var b5:Array = rs.b5.split(delim);
				var b7:Array = rs.b7.split(delim);
				var tcb:Array = rs.tcb.split(delim);
				var tcg:Array = rs.tcg.split(delim);
				var tcw:Array = rs.tcw.split(delim);
				
				var t1:Number = 0;
				var t2:Number = 0;
				var t3:Number = 0;
				var t4:Number = 0;
				var t5:Number = 0;
				var t7:Number = 0;
				var tb:Number = 0;
				var tg:Number = 0;
				var tw:Number = 0;
				
				var count:int = 0;
				
				var rwidth:int = int(Math.sqrt(b1.length));
				var halfwidth:int = int(rwidth/2);
				for (var i:int=0; i<rwidth;i++) {
					for (var j:int=0; j<rwidth; j++) {
						var idx:int = i + j * rwidth;
						if (Math.abs(i-halfwidth) <= int(plotModel.plotSize/2)
							&& Math.abs(j-halfwidth) <= int(plotModel.plotSize/2)) {
							t1 += int(b1[idx])/rs.spectral_scaler;
							t2 += int(b2[idx])/rs.spectral_scaler;
							t3 += int(b3[idx])/rs.spectral_scaler;
							t4 += int(b4[idx])/rs.spectral_scaler;
							t5 += int(b5[idx])/rs.spectral_scaler;
							t7 += int(b7[idx])/rs.spectral_scaler;
							tb += int(tcb[idx])/rs.spectral_scaler;
							tg += int(tcg[idx])/rs.spectral_scaler;
							tw += int(tcw[idx])/rs.spectral_scaler;
							count++;
						}
					}
				}
				//trace("Plot size: " + count);
				var ps:PlotSpectral = new PlotSpectral(rs.sensor, _plot.plotid,
									                   rs.image_year, rs.image_julday,
													   int(t1*plotModel.scale/count)/plotModel.scale, 
													   int(t2*plotModel.scale/count)/plotModel.scale, 
													   int(t3*plotModel.scale/count)/plotModel.scale, 
													   int(t4*plotModel.scale/count)/plotModel.scale, 
													   int(t5*plotModel.scale/count)/plotModel.scale, 
													   int(t7*plotModel.scale/count)/plotModel.scale, 
													   int(tb*plotModel.scale/count)/plotModel.scale, 
													   int(tg*plotModel.scale/count)/plotModel.scale, 
													   int(tw*plotModel.scale/count)/plotModel.scale);
				ps.sequence = ++seq;
				
				global.min_year = global.min_year > rs.image_year ? rs.image_year : global.min_year;
				global.max_year = global.max_year < rs.image_year ? rs.image_year : global.max_year;
				
				_plot.plotSpectrals.addItem(ps);
				global.target_day = rs.target_day;
			}
			
			global.max_year = global.max_year;
			_plot.isSpectralLoaded = true;
			plotModel.plotSpectralLoaded();
			
			trace("plot spectral retrieved");
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Get Plots Error");
		}
	}
}