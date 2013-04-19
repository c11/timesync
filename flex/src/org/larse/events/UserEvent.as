package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	
	public class UserEvent extends Event
	{
		public static const LOGIN:String = "login";
		
		public var usr:Object = null;
		
		public function UserEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}