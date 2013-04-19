package org.larse.model
{
	import flash.events.EventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import org.larse.events.ProjectEvent;
	import org.larse.events.TimeSyncEvent;
	import org.larse.tsclass.ImageChip;
	import org.larse.vos.Interpreter;

	[Bindable]
	[Event(name="assignment_changed",type="org.larse.events.ProjectEvent")]
	[Event(name="login_successful",type="org.larse.events.TimeSyncEvent")]
	[ManagedEvents("login_successful,assignment_changed")]
	public class GlobalModel extends EventDispatcher
	{
		public static var INTERPRETER:int = 0;
		public static var ARBITOR:int = 1;
		public var scale:Number = 1.0;
		public var view_size:int = 195;
		
		private var _plot_size:int = 1;
		public function get plot_size():int {
			return _plot_size;
		}
		public function set plot_size(value:int):void {
			_plot_size = value;
		}

		/**
		 * the target day used for automatic image selection
		 */
		private var _target_day:int = 0;
		public function get target_day():int {
			return _target_day;
		}

		public function set target_day(value:int):void {
			_target_day = value;
		}
		

		public var neighbor_size:int = 3; //neighborhood size
		//public var spectral_scaler:int = 4000;
		public var overlaySegment:Boolean = true;
		
		public var min_year:int = 9999;
		public var max_year:int = 0;
		
		public var user_id:int = 1;
		
		private var _project_id:int = 1;
		public function get project_id():int {
			return _project_id;
		}
		public function set project_id(value:int):void {
			_project_id = value;
		}

		public var tsa:int = 4630;
		
		public function GlobalModel()
		{
			scale = 15.0;
		}
		
		//user role: 0 - interpreter; 1 - arbitor
		private var _user_role:int = INTERPRETER;
		public function get user_role():int {
			return _user_role;
		}
		public function set user_role(value:int):void {
			_user_role = value;
		}
		
		
		private var _assignments:ArrayCollection = null;
		public function get assignments():ArrayCollection {
			return _assignments;
		}
		
		public function set assignments(value:ArrayCollection):void {
			_assignments = value;
			this.dispatchEvent(new ProjectEvent(ProjectEvent.ASSIGNMENT_CHANGED, true, true));
		}
		
		//02.20.2013,
		//added to handle special case when super user is viewing other people's data
		//_examinee is used to represent the previous interpreter that is being examined by the superuser
		//this is especially needed, when superuser delete all existing interpretation for current plot.
		private var _examinee_id:int = -1;
		public function get examinee_id():int {
			return _examinee_id;
		}
		
		public function set examinee_id(value:int):void {
			_examinee_id = value;
		}
		
		
		private var _interpreter:Interpreter = null;
		public function get interpreter():Interpreter {
			return _interpreter;
		}
		
		public function set interpreter(value:Interpreter):void {
			_interpreter = value;
			user_id = _interpreter.user_id;
			_examinee_id = -1;
			this.dispatchEvent(new TimeSyncEvent(TimeSyncEvent.LOGIN_SUCCESSFUL));
		}
		
		//currently selected chip
		private var _selectedChip:ImageChip = null;
		public function get selectedChip():ImageChip {
			return _selectedChip;
		}
		
		public function set selectedChip(value:ImageChip):void {
			if (_selectedChip != value)
				_selectedChip = value;
		}
	}
}