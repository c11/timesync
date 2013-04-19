package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	
	public class PlotEvent extends Event
	{
		public static const PLOT_GET_ALL:String = "get_all_plots";
		public static const PLOT_SAVE:String = "save_plot";
		public static const PLOT_UPDATE:String = "update_plot";
		
		public static const PLOT_MODIFIED:String = "plot_modified";
		public static const PLOT_MODEL_CHANGED:String = "plot_model_changed";
		public static const PLOT_SELECTION_CHANGED:String = "plot_selection_changed";

		public static const PLOT_SPECTRAL_GET:String = "get_plot_spectrals";
		public static const PLOT_SPECTRAL_LOADED:String = "plot_spectral_loaded";
		
		public static const LOAD_VERTEX:String = "load_verteices";
		public static const SAVE_VERTEX:String = "save_verteices";
		
		public static const LOAD_NEIGHBOR:String = "load_neighbors";
		public static const SAVE_NEIGHBOR:String = "save_neighbors";
		
		public static const LOAD_COMMENTS:String = "load_comments";
		public static const SAVE_COMMENTS:String = "save_comments";

		private var _current:Plot;
		
		public function PlotEvent(type:String, data:Plot=null, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
			_current = data;
		}
		
		public function get CurrentPlot():Plot
		{
			return _current;
		}
		
		public function set CurrentPlot(value:Plot):void
		{
			_current = value;
		}
	}
}