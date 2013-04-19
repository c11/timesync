package org.larse.tsclass
{
	[Bindable]
	public class ImageChip
	{
		private var _project_id:int;
		public function get project_id():int {
			return _project_id;
		}

		public function set project_id(value:int):void {
			_project_id = value;
		}

		private var _tsa:int;
		public function get tsa():int {
			return _tsa;
		}

		public function set tsa(value:int):void {
			_tsa = value;
		}

		
		private var _plotid:int;
		public function get plotid():int {
			return _plotid;
		}
		
		public function set plotid(value:int):void {
			_plotid = value;
		}
		
		private var _year:int;
		public function get year():int {
			return _year;
		}
		
		public function set year(value:int):void {
			_year = value;
		}
	
		private var _julday:int;
		public function get julday():int {
			return _julday;
		}
		
		public function set julday(value:int):void {
			_julday = value;
		}
		
		private var _path:String;
		public function get chipUrl():String {
			return _path;
		}
		
		public function set chipUrl(value:String):void {
			_path = value;
		}
		
		private var is_vertex:Boolean;
		public function get isVertex():Boolean {
			return is_vertex;
		}
		
		public function set isVertex(value:Boolean):void {
			is_vertex = value;
		}
		
		private var _sequence:int;
		public function get sequence():int {
			return _sequence;
		}
		
		public function set sequence(value:int):void {
			_sequence = value;
		}
		
		public function get label():String {
			if (_sequence > 0)
				return "" + _sequence + ": " + _year + "-" + _julday;
			else 
				return ""+_year + "-" + _julday;
		}
		
		public function ImageChip()
		{
			_year = 1984;
			_julday = 180;
			is_vertex = false;
			_path = "";
			_project_id = 0;
			_tsa = 0;
		}

	}
}