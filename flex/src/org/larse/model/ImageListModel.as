package org.larse.model
{
	import flash.events.EventDispatcher;
	import mx.collections.ArrayCollection;
	import org.larse.events.ImageListEvent;
	
	[Bindable]
	[Event(name="image_list_changed",type="org.larse.events.ImageListEvent")]
	[ManagedEvents("image_list_changed")]
	public class ImageListModel extends EventDispatcher
	{
		private var _imageList:ArrayCollection;
		public function get imageList():ArrayCollection
		{
			return _imageList;
		}
		
		public function set imageList(value:ArrayCollection):void
		{
			_imageList = value;
			dispatchEvent(new ImageListEvent(ImageListEvent.IMAGE_LIST_CHANGED));
		}
	}
}