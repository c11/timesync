package org.larse.controllers
{
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	
	import org.larse.events.ProjectEvent;
	import org.larse.model.GlobalModel;
	import org.larse.services.TimeSyncService;
	import org.larse.vos.Plot;
	
	public class AssignmentGetCommand
	{
		[Inject] public var service:TimeSyncService;
		[Inject] public var global:GlobalModel;
		
		public function AssignmentGetCommand() {}
		
		public function execute(event:ProjectEvent):AsyncToken
		{
			trace("AssignmentGetCommand.execute()");
			if (global.user_id > 0) {
				return service.getAssignments(global.user_id, global.user_role);
			}
			else
				return null;
		}
		
		public function result(list:ArrayCollection):void
		{
			trace("AssignmentGetCommand.result()");
			global.assignments = list;
		}
		
		public function error(fault:FaultEvent):void
		{
			trace(fault.message.toString());
			Alert.show("Database had an error", "Get Assignments Error");
		}
	}
}