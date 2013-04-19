package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	
	public class ProjectEvent extends Event
	{
		public static const GET_ASSIGNMENT:String = "get_user_assignments";
		public static const ASSIGNMENT_CHANGED:String = "assignment_changed";
		
		public function ProjectEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}