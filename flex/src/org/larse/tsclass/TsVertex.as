package org.larse.tsclass
{
	import org.larse.vos.Vertex;
	
	[Bindable]
	public class TsVertex extends Vertex
	{

		public function TsVertex(plotid:int, year:int=0, julday:int=0)
		{
			super(plotid, year, julday);
			this.plotid = plotid;
			this.image_year = year;
			this.image_julday = julday;
		}
		
//		public function get label():String {
//			//TODO: may be need to watch for uninitialized year and julday
//			return ""+this.image_year + "-" + this.image_julday;
//		}
//
//		public function get score():int {
//			return TsUtil.score(this.landuse_confidence) 
//				+ TsUtil.score(this.landcover_confidence)
//				+ TsUtil.score(this.date_confidence);
//		}
	}
}