package org.larse.tsclass
{
	[Bindable]
	public class PlotSpectral
	{
		public function PlotSpectral(sensor:String, plotid:int, 
									 year:int, julday:int,
									 b1:Number, b2:Number,
									 b3:Number, b4:Number,
									 b5:Number, b7:Number,
									 b:Number, g:Number, w:Number)
		{
			_plotid = plotid;
			_year = year;
			_julday = julday;
			_spectralBands = new SpectralBands(b1, b2, b3, b4, b5, b7, b, g, w, sensor);
			_sequence = -1;
		}

		/********************************
		 * Properties 
		 *******************************/
		private var _plotid:int;
		public function get plotid():int {
			return _plotid;
		}
		
		private var _year:int;
		public function get year():int {
			return _year;
		}
		
		private var _julday:int;
		public function get julday():int {
			return _julday;
		}
		
		private var _sequence:int;
		public function get sequence():int {
			return _sequence;
		}
		
		public function set sequence(value:int):void {
			_sequence = value;
		}
		
		private var _isVertex:Boolean=false;
		public function get isVertex():Boolean {
			return _isVertex;
		}
		
		public function set isVertex(value:Boolean):void {
			if (value != _isVertex) {
				_isVertex = value;
				_isModified = true;
			}
		}
		
		private var _spectralBands:SpectralBands=null;
		public function get spectralBands():SpectralBands {
			return _spectralBands;
		}
		
		public function set spectralBands(value:SpectralBands):void {
			_spectralBands = value;
		}
		
		private var _isModified:Boolean = false;
		public function get isModified():Boolean {
			return _isModified;
		}
		
		public function set isModified(value:Boolean):void {
			if (value != _isModified)
				_isModified = value;
		}
		
		public function get imageDateAsNumber():Number {
			return int((_year + _julday / 366)*100)/100;	
		}
		
		public function get imageLabel():String {
			return "" + year + "-" + julday;
		}
		
		private var _isOutlier:Boolean = false;
		public function get isOutlier():Boolean {
			return _isOutlier;
		}
		
		public function set isOutlier(value:Boolean):void {
			if (_isOutlier != value) {
				_isOutlier = value;
			}
		}
//--------------------------------------------------------------
// Spectral Property
//--------------------------------------------------------------
		public function get b1():Number {
			return _spectralBands.getSpectral(SpectralIndex.BAND1);
		}
		
		public function get b2():Number {
			return _spectralBands.getSpectral(SpectralIndex.BAND2);
		}
	
		public function get b3():Number {
			return _spectralBands.getSpectral(SpectralIndex.BAND3);
		}

		public function get b4():Number {
			return _spectralBands.getSpectral(SpectralIndex.BAND4);
		}

		public function get b5():Number {
			return _spectralBands.getSpectral(SpectralIndex.BAND5);
		}
		
		public function get b7():Number {
			return _spectralBands.getSpectral(SpectralIndex.BAND7);
		}
		
		public function get brightness():Number {
			return _spectralBands.brightness;
		}
		
		public function get greenness():Number {
			return _spectralBands.greenness;
		}
		
		public function get wetness():Number {
			return _spectralBands.wetness;
		}
		
		public function get ndvi():Number {
			return _spectralBands.ndvi;
		}
		
		public function get nbr():Number {
			return _spectralBands.nbr;
		}
		
		public function get angle():Number {
			return _spectralBands.angle;
		}
		
		public function get distance():Number {
			return _spectralBands.distance;
		}
	}
}