package org.larse.tsclass
{
	import mx.collections.ArrayCollection;

	public class LinearRegression
	{

		/**
		 * first degress linear regression using xfield and yfield from objects specified in arr. 
		 * 
		 * Note: No checking is performed on whether the xfield and yfield have been defined in the object.
		 */
		public static function regress1(xarr:ArrayCollection, yarr:ArrayCollection):RegressionResult {
			var result:RegressionResult = new RegressionResult();
			
			var xs:Number = 0;
			var ys:Number = 0;
			var x2s:Number = 0;
			var y2s:Number = 0;
			var xys:Number = 0;
			
			for (var i:int = 0; i < xarr.length; i++) {
				xs += xarr[i];
				ys += yarr[i];
				x2s += xarr[i] * xarr[i];
				y2s += yarr[i] * yarr[i];
				xys += xarr[i] * yarr[i];
			}
			
			var intercept:Number = (ys * x2s - xys * xs) / (xarr.length * x2s - xs * xs);
			var slope:Number = (xarr.length * xys - xs * ys) / (xarr.length * x2s - xs * xs);
			var corr:Number = (xarr.length * xys - xs * ys) / Math.sqrt((xarr.length*x2s-xs*xs)*(xarr.length*y2s-ys*ys));
			corr = corr * corr;
			
			result.intercept = int(intercept*10000)/10000;
			result.slope = int(slope*10000)/10000;
			result.rsquared = int(corr*10000)/10000;
			
			return result;
		}
		
	}
}