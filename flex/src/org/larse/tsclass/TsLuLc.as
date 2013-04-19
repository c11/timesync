package org.larse.tsclass
{
	[Bindable]
	public class TsLuLc
	{
		public var label:String;
		public var isDominant:Boolean;
		private var _isSelected:Boolean;
		
		public function get isSelected():Boolean {
			return _isSelected;
		}
		
		public function set isSelected(value:Boolean):void {
			_isSelected = value;
		}
		
		public function TsLuLc(name:String, isDominant:Boolean=false, isSelected:Boolean=false)
		{
			this.label = name;
			this.isDominant = isDominant;
			this._isSelected = isSelected;
		}
	}
}