package org.larse.events
{
	import flash.events.Event;
	
	public class ImageListEvent extends Event
	{
		public static const IMAGE_LIST_GET:String = "get_image_list";
		public static const IMAGE_LIST_CHANGED:String = "image_list_changed";
		
		public static const PLOT_LOAD_ALL_CHIP:String = "plot_load_all_chip";
		public static const PLOT_OVERRIDE_CHIP:String = "plot_override_chip";
		
		private var _data:Object; //a generic data object to host data from client.
		public function get data():Object {
			return _data;
		}
		
		public function set data(value:Object):void {
			_data = value;
		}
		
		public function ImageListEvent(type:String, data:Object=null, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		
	}
}