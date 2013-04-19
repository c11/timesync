package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	
	public class TimeSyncEvent extends Event
	{
		public static const CHIP_SIZESCALE_CHANGED:String = "chip_sizescale_changed";
		public static const LOGIN_SUCCESSFUL:String = "login_successful";
		
		public function TimeSyncEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
		}

	}
}