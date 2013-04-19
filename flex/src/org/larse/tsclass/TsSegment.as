package org.larse.tsclass
{
	import org.larse.vos.Vertex;
	
	[Bindable]
	public class TsSegment
	{
		private var plotid:int;
		
		private var _startVertex:Vertex;
		private var _endVertex:Vertex;
		
		public function TsSegment(project_id:int, tsa:int, plotid:int, 
								  interpreter:int, 
								  start:Vertex=null, end:Vertex=null)
		{
			this.plotid = plotid;
			_startVertex = start==null?new Vertex(project_id, tsa, plotid, interpreter):start;
			_endVertex = end==null?new Vertex(project_id, tsa, plotid, interpreter):end;
		}
		
//-----------------------------------------------
//		properties
//-----------------------------------------------

		public function get startVertex():Vertex {
			return _startVertex;
		}
		
		public function set startVertex(value:Vertex):void {
			_startVertex = value;
		}
		
		public function get endVertex():Vertex {
			return _endVertex;
		}
		
		public function set endVertex(value:Vertex):void {
			_endVertex = value;
		}

		public function get startYear():int {
			return _startVertex.image_year;
		}
		
		public function get endYear():int {
			return _endVertex.image_year;
		}
		
		public function get startImage():String {
			return _startVertex.label;
		}
		
		public function get endImage():String {
			return _endVertex.label;
		}
		
		public function get changeProcess():String {
			return _endVertex.change_process;
		}
		
		public function set changeProcess(value:String):void {
			if (_endVertex.change_process != value) {
				_endVertex.change_process = value;
				_endVertex.isDirty = true;
			}
		}
		
		public function get processConfidence():String {
			return _endVertex.change_process_confidence;
		}
		
		public function set processConfidence(value:String):void {
			if (_endVertex.change_process_confidence != value) {
				_endVertex.change_process_confidence = value;
				_endVertex.isDirty = true;
			}
		}
		
		public function get confidenceScore():int {
			return _startVertex.score + _endVertex.score + TsUtil.score(processConfidence);
		}
		
		public function set confidenceScore(value:int):void {
		}
		
		public function get isEphemeral():Boolean {
			return _endVertex.landcover_ephemeral > 0;
		}
		
		public function set isEphemeral(value:Boolean):void {
			if (_endVertex.landcover_ephemeral != (value?1:0)) {
				_endVertex.landcover_ephemeral = value ? 1 : 0;
				_endVertex.isDirty = true;
			}
		}
		
		public function get patch_size():int {
			return _endVertex.patch_size;
		}
		
		public function set patch_size(value:int):void {
			if (_endVertex.patch_size != value) {
				_endVertex.patch_size = value;
				_endVertex.isDirty = true;
			}
		}
		
		public function get relative_magnitude():int {
			return _endVertex.relative_magnitude;
		}
		
		public function set relative_magnitude(value:int):void {
			if (_endVertex.relative_magnitude != value) {
				_endVertex.relative_magnitude = value;
				_endVertex.isDirty = true;
			}
		}
		
		public function get complete():Boolean {
			return _startVertex.complete && _endVertex.complete &&
				(changeProcess!=null && changeProcess.length > 0);
		}
		
	}
}