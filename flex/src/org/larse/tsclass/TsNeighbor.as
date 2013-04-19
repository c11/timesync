package org.larse.tsclass
{
	import org.larse.vos.Neighbor;
	
	public class TsNeighbor extends Neighbor
	{
		public function TsNeighbor(plotid:int, year:int, julday:int,
								   process:String, patch_size:int=3,
								   magnitude:String="High",
								   direction:int=0,
								   includeplot:Boolean=false,
								   comments:String="")
		{
			super();
			this.plotid = plotid;
			this.image_year = year;
			this.image_julday = julday;
			this.change_process = process;
			this.patch_size = patch_size;
			this.relative_magnitude = magnitude;
			this.centroid_direction = direction;
			this.plot_included = includeplot?1:0;
			this.comments = comments;
		}
	}
}