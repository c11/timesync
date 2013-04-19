package org.larse.events
{
	import flash.events.Event;
	
	import org.larse.vos.Plot;
	import org.larse.vos.Vertex;
	
	public class VertexEvent extends Event
	{
		public static const VERTEX_TOGGLED:String = "vertex_toggled";
		
		public var vertex:Vertex=null;
		
		public function VertexEvent(type:String, data:Vertex=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.vertex = data;
		}

	}
}