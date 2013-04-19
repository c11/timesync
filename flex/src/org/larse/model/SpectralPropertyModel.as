package org.larse.model
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.larse.events.ImageListEvent;
	import org.larse.vos.SpectralProperty;
	
	//[Event(name="image_list_changed",type="org.larse.events.ImageListEvent")]
	//[ManagedEvents("image_list_changed")]
	public class SpectralPropertyModel extends EventDispatcher
	{
		private var _spectralProperties:ArrayCollection;
		
		[Bindable]
		public function get spectralProperties():ArrayCollection
		{
			return _spectralProperties;
		}
		
		public function set spectralProperties(value:ArrayCollection):void
		{
			_spectralProperties = value;
			is_loaded = true;
			//dispatchEvent(new ImageListEvent(ImageListEvent.IMAGE_LIST_CHANGED, null, true, true));
		}
		
		public var is_loaded:Boolean = false;
		
		/**
		 * get spectral property for specified spectral index
		 */
		public function getSpectralProperty(spectralname:String):SpectralProperty {
			for each (var sp:SpectralProperty in _spectralProperties) {
				if (sp.spectral_name == spectralname)
					return sp;
			}
			return null;
		}
		
	}
}