package org.larse.controllers
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.UserEvent;
	import org.larse.model.GlobalModel;
	import org.larse.services.TimeSyncService;
	import org.larse.vos.Interpreter;
	import org.larse.vos.Plot;
	
	public class LoginCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var global:GlobalModel;
		
		public function LoginCommand() {}
		
		public function execute(event:UserEvent):AsyncToken
		{
			trace("LoginCommand.execute()");
			return service.login(event.usr.user_name, event.usr.pass);
		}
		
		public function result(list:Interpreter):void
		{
			trace("LoginCommand.result()");
			global.interpreter = list as Interpreter;
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Login Error");
		}
	}
}