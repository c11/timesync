package org.larse.controllers
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.SpectralPropertyEvent;
	import org.larse.model.SpectralPropertyModel;
	import org.larse.services.TimeSyncService;
	
	public class SpectralPropertyGetCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var spectralPropertyModel:SpectralPropertyModel;
		
		public function SpectralPropertyGetCommand() {}
		
		public function execute(event:SpectralPropertyEvent):AsyncToken
		{
			trace("SpectralPropertyGetCommand.execute()");
			return service.getSpectralProperties();
		}
		
		public function result(list:ArrayCollection):void
		{
			trace("SpectralPropertyGetCommand.result()");
			spectralPropertyModel.spectralProperties = list;
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Get Spectral Property Error");
		}
	}
}