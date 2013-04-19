package org.larse.tsclass
{
	public class SpectralBands
	{
		public static var TM:String = "tm";
		public static var MSS:String = "mss";
		public static var MODIS:String = "modis";
		
		public var sensor:String;
		public var b1:Number;
		public var b2:Number;
		public var b3:Number;
		public var b4:Number;
		public var b5:Number;
		public var b7:Number;
		public var brightness:Number;
		public var greenness:Number;
		public var wetness:Number;
		
		public function get ndvi():Number {
			if (sensor==SpectralBands.MSS)
				return b2+b4==0?-99:int((b4-b2)/(b4+b2)*100)/100;
			else
				return b3+b4==0?-99:int((b4-b3)/(b4+b3)*100)/100;
		}
		
		public function get nbr():Number {
			if (sensor == SpectralBands.MSS)
				return 0;
			if ((b4+b7)==0)
				return -99;
			return int((b4-b7)/(b4+b7)*100)/100;
		}
		
		public function get angle():Number {
			if (brightness == 0)
				return -99;
			else
				return int(Math.atan2(greenness, brightness)*180.0/Math.PI*100)/100;
		}

		public function get distance():Number {
			return int(Math.sqrt(brightness*brightness + greenness*greenness)*100)/100;
		}
		
		public function getSpectral(ax:String):Number {
			var val:Number = -9999;
			switch (ax) {
				case SpectralIndex.BAND1:
					val = b1;
					break;
				case SpectralIndex.BAND2:
					val = b2;
					break;
				case SpectralIndex.BAND3:
					val = b3;
					break;
				case SpectralIndex.BAND4:
					val = b4;
					break;
				case SpectralIndex.BAND5:
					val = b5;
					break;
				case SpectralIndex.BAND7:
					val = b7;
					break;
				case SpectralIndex.BRIGHTNESS:
					val = brightness;
					break;
				case SpectralIndex.GREENNESS:
					val = greenness;
					break;
				case SpectralIndex.WETNESS:
					val = wetness;
					break;
				case SpectralIndex.ANGLE:
					val = angle;
					break;
				case SpectralIndex.DISTANCE:
					val = distance;
					break;
				case SpectralIndex.NDVI:
					val = ndvi;
					break;
				case SpectralIndex.NBR:
					val = nbr;
					break;
				default:
					val = -9999;
					break;
			}
			return val;
		}
		
		public function SpectralBands(b1:Number=0, b2:Number=0, b3:Number=0,
									  b4:Number=0, b5:Number=0, b7:Number=0,
									  b:Number=0, g:Number=0, w:Number=0, 
									  sensor:String="tm")
		{
			this.sensor = sensor;
			this.b1 = b1;
			this.b2 = b2;
			this.b3 = b3;
			this.b4 = b4;
			this.b5 = b5;
			this.b7 = b7;
			this.brightness = b;
			this.greenness = g;
			this.wetness = w;
		}
	}
}