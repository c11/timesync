package org.larse.tsclass
{
	import flash.utils.Dictionary;
	
	import mx.collections.ArrayCollection;
	
	import org.larse.vos.Plot;
	
	[Bindable]
	public class TsPlot
	{
		
//-----------------------------------------------------
// Properties
//-----------------------------------------------------
		private var _plot:Plot;
		
		//plot spectral identified by image_label: year-julday
		public var plotSpectrals:Dictionary = new Dictionary();
		
		//public var vertices:Dictionary = new Dictionary();
		public var vertices:ArrayCollection = new ArrayCollection();
		
		//all neighbors
		public var neighbors:ArrayCollection = new ArrayCollection();

		public var segments:ArrayCollection = new ArrayCollection();
		
		private var isModified:Boolean = false;

		
		public function get plotid():int {
			return _plot.plotid;
		}
		
//-----------------------------------------------------
// Constructor
//-----------------------------------------------------		
		public function TsPlot(plot:Plot)
		{
			super();
			this._plot = plot;
		}
		
//-----------------------------------------------------
// Public methods
//-----------------------------------------------------		
		public function addVertex(v:TsVertex):void {
			//vertices[v.label] = v;
			vertices.addItem(v);
			isModified = true;
			updateSegments();
		}
		
		public function removeVertex(v:TsVertex):void {
			var idx:int = vertices.getItemIndex(v);
			if (idx>=0) {
				vertices.removeItemAt(idx);
				updateSegments();
			}
		}
		
		public function clearVertices():void {
//			for (var k:String in vertices) {
//				delete vertices[k];
//			}
			vertices.removeAll();
			segments.removeAll();
			isModified = true;
		}
		
		/**
		 * rebuild segments from vertices
		 */
		private function updateSegments():void {
			segments.removeAll();
			for (var i:int = 1; i<vertices.length-1; i++) {
				segments.addItem(new TsSegment(_plot.plotid, vertices[i-1], vertices[i]));
			}
		}
		
		public function addNeighbor(n:TsNeighbor):void {
			neighbors.addItem(n);
			isModified = true;
		}
		
		public function removeNeighbor(n:TsNeighbor):void {
			var idx:int = neighbors.getItemIndex(n);
			if (idx>=0) {
				neighbors.removeItemAt(idx);
				isModified = true;
			}
		}
		
		public function clearNeighbors():void {
			neighbors.removeAll();			
			isModified = true;
		}

	}	
	
}