package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	
	public class SpectralPropertyEvent extends Event
	{
		public static const SPECTRAL_PROPERTIES_GET:String = "get_spectral_properties";
		
		public function SpectralPropertyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}