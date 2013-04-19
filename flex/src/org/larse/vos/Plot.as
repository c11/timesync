/**
 * This is a generated sub-class of _Plot.as and is intended for behavior
 * customization.  This class is only generated when there is no file already present
 * at its target location.  Thus custom behavior that you add here will survive regeneration
 * of the super-class. 
 *
 * NOTE: Do not manually modify the RemoteClass mapping unless
 * your server representation of this class has changed and you've 
 * updated your ActionScriptGeneration,RemoteClass annotation on the
 * corresponding entity 
 **/ 
 
package org.larse.vos
{

import com.adobe.fiber.core.model_internal;

import flash.utils.Dictionary;

import mx.collections.ArrayCollection;

import org.larse.tsclass.ImageChip;
import org.larse.tsclass.PlotSpectral;
import org.larse.tsclass.TsSegment;
import org.larse.vos.Neighbor;
import org.larse.vos.Vertex;

import spark.collections.Sort;
import spark.collections.SortField;

[Bindable]
public class Plot extends _Super_Plot
{
    /** 
     * DO NOT MODIFY THIS STATIC INITIALIZER - IT IS NECESSARY
     * FOR PROPERLY SETTING UP THE REMOTE CLASS ALIAS FOR THIS CLASS
     *
     **/
     
    /**
     * Calling this static function will initialize RemoteClass aliases
     * for this value object as well as all of the value objects corresponding
     * to entities associated to this value object's entity.  
     */     
    public static function _initRemoteClassAlias() : void
    {
        _Super_Plot.model_internal::initRemoteClassAliasSingle(org.larse.vos.Plot);
        _Super_Plot.model_internal::initRemoteClassAliasAllRelated();
    }
     
    model_internal static function initRemoteClassAliasSingleChild() : void
    {
        _Super_Plot.model_internal::initRemoteClassAliasSingle(org.larse.vos.Plot);
    }
    
    {
        _Super_Plot.model_internal::initRemoteClassAliasSingle(org.larse.vos.Plot);
    }
    /** 
     * END OF DO NOT MODIFY SECTION
     *
     **/   

//------------------------------------------------------------
//  plot related logic
//------------------------------------------------------------	
	public static const UNCERTAINTY_NONE:uint = 0;
	public static const UNCERTAINTY_VERT:uint = 1;
	public static const UNCERTAINTY_DIST:uint = 2;
	public static const UNCERTAINTY_AGNT:uint = 4;
	public static const UNCERTAINTY_LDLU:uint = 8;
	public static const UNCERTAINTY_DTLU:uint = 16;
	
	public static const UNCERTAINTY_ALL:uint = 31;
	
	
	//plot spectral identified by image_label: year-julday
	//public var plotSpectrals:Dictionary;
	public var plotSpectrals:ArrayCollection;
	
	public var vertexSpectrals:ArrayCollection;
	
	//public var vertices:Dictionary = new Dictionary();
	private var _vertices:ArrayCollection;
	public function get vertices():ArrayCollection {
		return _vertices;
	}
	
	public function set vertices(value:ArrayCollection):void {
		_vertices = value;
		applySort();
		this.updateSegments();
		this.updateChipVertex();
	}
	
	//all neighbors
	public var neighbors:ArrayCollection;

	public var comment:String="";
	
	public var segments:ArrayCollection;
	
	public var isModified:Boolean = false;
	public var isVertexLoaded:Boolean = false;
	public var isNeighborLoaded:Boolean = false;
	public var isCommentLoaded:Boolean = false;
	
	public var chips:ArrayCollection;
	
	private var _isSpectralLoaded:Boolean = false;
	public function get isSpectralLoaded():Boolean {
		return _isSpectralLoaded;
	}
	
	public function set isSpectralLoaded(value:Boolean):void {
		_isSpectralLoaded = value;
		if (!value)
			plotSpectrals.removeAll();
	}
	
	//private var _isExample:int = 0;
	public function get isExample():Boolean {
		return this.is_example > 0;
	}
	
	public function set isExample(value:Boolean):void {
		var ex:int = value ? 1 : 0;
		if (is_example != ex) {
			is_example = ex;
			isModified = true;
		}
	}
	
	private var _isChiplistDefined:Boolean = false;

	public function get isChiplistDefined():Boolean {
		return _isChiplistDefined;
	}

	public function set isChiplistDefined(value:Boolean):void {
		_isChiplistDefined = value;
		if (!_isChiplistDefined) {
			_vertices.removeAll();
		}
	}

	public function get isWetland():Boolean {
		return this.is_wetland > 0;
	}
	
	public function set isWetland(value:Boolean):void {
		var ex:int = value ? 1 : 0;
		if (is_wetland != ex) {
			is_wetland = ex;
			isModified = true;
		}
	}
	
	public function get interpreter():int {
		if (_vertices.length>0) {
			var v:Vertex = _vertices.getItemAt(0) as Vertex;
			return v.interpreter;
		}
		else {
			return -1;
		}
	}
	
	//public var regionSpectrals:ArrayCollection;
	private var disturbances:Array = new Array("Harvest", "Fire", "Stress", "Site-preparation Fire", "Delay", "Mechanical", "Other disturbance", "Wind", "Water", "Debris", "Volcano");
	
	//-----------------------------------------------------
	// Constructor
	//-----------------------------------------------------		
	public function Plot(plotid:int=0)
	{
		super();
		this.plotid = plotid;
		
		//plotSpectrals = new Dictionary();
		plotSpectrals = new ArrayCollection();
		_vertices = new ArrayCollection();
		neighbors = new ArrayCollection();
		segments = new ArrayCollection();
		vertexSpectrals = new ArrayCollection();
		//regionSpectrals = new ArrayCollection();
		isExample = false;
		applySort();
	}
	
	private function applySort():void {
		var sortField:SortField = new SortField();
		sortField.name = "label";
		sortField.numeric = false;
		
		var sort:Sort = new Sort();
		sort.fields = [sortField];
		vertices.sort = sort;
		vertices.refresh();
	}
	
	//-----------------------------------------------------
	// Public methods
	//-----------------------------------------------------		
	public function addVertex(v:Vertex, modified:Boolean=true):void {
		//vertices[v.label] = v;
		vertices.addItem(v);
		isModified = modified;
		updateSegments();
	}
	
	public function removeVertex(v:Vertex):void {
		var idx:int = 0;
		for each (var tv:Vertex in vertices) {
			if (tv.label == v.label) {
				vertices.removeItemAt(idx);
				isModified = true;
				break;
			}
			idx++;
		}
		updateSegments();
	}
	
	public function clearVertices():void {
		//			for (var k:String in vertices) {
		//				delete vertices[k];
		//			}
		vertices.removeAll();
		segments.removeAll();
		vertexSpectrals.removeAll();
		isModified = true;
	}
	
	/**
	 * recreate vertex spectral array
	 */
	public function rebuildVertexSpectral():void {
		vertexSpectrals.removeAll();
		for each (var v:Vertex in vertices) {
			for each (var ps:PlotSpectral in plotSpectrals) {
				if (v.image_year == ps.year && v.image_julday==ps.julday) {
					vertexSpectrals.addItem(ps);
					continue;
				}
			}
		}
	}
	/**
	 * rebuild segments from vertices
	 */
	private function updateSegments():void {
		segments.removeAll();
		for (var i:int = 1; i<vertices.length; i++) {
			var vv:Vertex = vertices[i-1] as Vertex;
			
			segments.addItem(new TsSegment(this.project_id, this.tsa, plotid, vv.interpreter, 
				             vertices[i-1], vertices[i]));
		}
	}
	
	public function addNeighbor(n:Neighbor):void {
		neighbors.addItem(n);
		isModified = true;
	}
	
	public function removeNeighbor(n:Neighbor):void {
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
	
	public function get vertexSqlValue():String {
		var sql:String = "";
		var i:int = 0;
		var seq:String = "";
		for each (var v:Vertex in vertices) {
			if (i++ > 0)
				seq = ","
			sql += seq + v.sqlValue;
		}
		return sql;
	}
	
	public function get neighborSqlValue():String {
		var sql:String = "";
		var i:int = 0;
		var seq:String = "";
		for each (var n:Neighbor in neighbors) {
			if (i++ > 0)
				seq = ",";
			sql += seq + n.sqlValue;
		}
		return sql;
	}

	//update the vertex selection for image chips
	public function updateChipVertex():void {
		//first clear all vertex
		for each (var chip:ImageChip in chips) {
			chip.isVertex = false;
		}
		
		//now match the chips with vertices
		for each (var v:Vertex in vertices) {
			for each (var chip:ImageChip in chips) {
				if (v.image_year == chip.year && v.image_julday == chip.julday) {
					chip.isVertex = true;
					break;
				}
			}
		}
	}
	
	
	/**
	 * Is the interpretation for this plot complete?
	 * 
	 * Any of the follwing condition will be considered as incomplete:
	 * 	- no segements have been defined
	 *  - there is disturbance but no neigher defined
	 */
	public function get complete():Boolean {
		if (segments.length == 0)
			return false;
		
		var disturbed:Boolean = false;
		for each (var v:Vertex in vertices) {
			if (!v.complete) //if vertex not complete
				return false;
			if (disturbances.indexOf(v.change_process)>=0) {
				disturbed = true;
			}
		}
		
		//plot disturbed but no neighor defined
		//if (disturbed && neighbors.length==0)
		//	return false;
		
		for each (var s:TsSegment in segments) {
			if (!s.complete) //segment is not complete
				return false;
		}
		
//		for each (var n:Neighbor in neighbors) {
//			if (!n.complete) // neighbor is not complete
//				return false;
//		}

		return true;
	}
	
	/**
	 * is this plot data has been modified, use it together with isModified field.
	 */
	public function get isDirty():Boolean {
		for each (var v:Vertex in vertices) {
			if (v.isDirty)
				return true;
		}
		
		for each (var n:Neighbor in neighbors) {
			if (n.isDirty)
				return true;
		}
		return false;
	}
	
	public function markPristine():void {
		isModified = false;
		for each (var v:Vertex in vertices) {
			v.isDirty = false;
		}
		
		for each (var n:Neighbor in neighbors) {
			n.isDirty = false;
		}
	}
	
	public function get imageCount():int {
		return this.plotSpectrals.length;
	}
	
	
}

}