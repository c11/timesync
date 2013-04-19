/**
 * This is a generated sub-class of _Vertex.as and is intended for behavior
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

import mx.events.PropertyChangeEvent;

import org.larse.tsclass.TsUtil;

[Bindable]
public class Vertex extends _Super_Vertex
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
        _Super_Vertex.model_internal::initRemoteClassAliasSingle(org.larse.vos.Vertex);
        _Super_Vertex.model_internal::initRemoteClassAliasAllRelated();
    }
     
    model_internal static function initRemoteClassAliasSingleChild() : void
    {
        _Super_Vertex.model_internal::initRemoteClassAliasSingle(org.larse.vos.Vertex);
    }
    
    {
        _Super_Vertex.model_internal::initRemoteClassAliasSingle(org.larse.vos.Vertex);
    }
    /** 
     * END OF DO NOT MODIFY SECTION
     *
     **/    

	
	private var disturbances:Array = new Array("Harvest", "Fire", "Stress", "Site-preparation Fire", "Delay", "Mechanical", "Other disturbance", "Wind", "Water", "Debris", "Volcano");
	
	public var isDirty:Boolean = false;
	
	public function Vertex(project_id:int=0, tsa:int=0, plotid:int=0, interpreter:int=0, 
						   year:int=0, julday:int=0) {
		super();
		this.project_id = project_id;
		this.tsa = tsa;
		this.interpreter = interpreter;
		this.plotid = plotid;
		this.image_year = year;
		this.image_julday = julday;
		this.dominant_landuse="";
		this.landuse_confidence="";
		this.dominant_landcover="";
		this.landcover_confidence="";
		this.date_confidence="";
		this.patch_size = 0;
		this.relative_magnitude = 0;
	}
	
	public function get label():String {
		//TODO: may be need to watch for uninitialized year and julday
		return ""+this.image_year + "-" + this.image_julday;
	}
	
	public function get score():int {
		return TsUtil.score(this.landuse_confidence) 
			+ TsUtil.score(this.landcover_confidence)
			+ TsUtil.score(this.date_confidence);
	}
	
	public function get complete():Boolean {
		var lucomplete:Boolean = this.dominant_landuse_over50 > 0 || 
										(this.dominant_landuse_over50 == 0 
											&& this.other_landuse!=null 
											&& other_landuse.length>0);
		var distcomplete:Boolean = true;
		if (disturbances.indexOf(this.change_process) > 0) {
			if (this.patch_size <=0 || this.relative_magnitude <=0)
				distcomplete = false;
		}
		
		return (dominant_landuse!=null && dominant_landuse.length > 0) && lucomplete && distcomplete;
		
//		var lccomplete:Boolean = this.dominant_landcover_over50 > 0 ||
//										(this.dominant_landcover_over50 == 0
//											&& this.other_landcover!=null
//											&& this.other_landcover.length > 0);
		
//		return (dominant_landuse!=null && dominant_landuse.length > 0) && 
//			   (dominant_landuse!=null && landuse_confidence.length > 0) &&
//			   (dominant_landcover!=null && dominant_landcover.length > 0) && 
//			   (landcover_confidence!=null && landcover_confidence.length > 0) &&
//			   (date_confidence!=null && date_confidence.length > 0) &&
//			   lucomplete && lccomplete;
	}
	
	public function get sqlValue():String {
		return "(" + this.plotid + 
			   "," + this.image_year +
			   "," + this.image_julday + 
			   ",'" + (this.dominant_landuse==null?"":dominant_landuse) + 
			   "'," + this.dominant_landuse_over50 +
			   ",'" + (this.other_landuse==null?"":other_landuse) + 
			   "','" + (this.landuse_confidence==null?"":landuse_confidence) +
			   "','" + (this.dominant_landcover==null?"":dominant_landcover) +
			   "'," + this.dominant_landcover_over50 +
			   ",'" + (this.other_landcover==null?"":other_landcover) +
			   "','" + (this.landcover_confidence==null?"":landcover_confidence) + 
			   "'," + this.landcover_ephemeral +
			   ",'" + (this.date_confidence==null?"":date_confidence) + 
			   "','" + (this.change_process==null?"":change_process) +
			   "','" + (this.change_process_confidence==null?"":change_process_confidence) +
			   "','" + this.comments +
			   "'," + this.interpreter +
			   "," + this.tsa + 
			   "," + this.project_id + 
			   "," + this.patch_size + 
			   "," + this.relative_magnitude + ")";
	}
	
	public function get lulc():String {
		var lu:String = dominant_landuse != null ? dominant_landuse : "-";
		var lc:String = dominant_landcover != null ? dominant_landcover : "-";
		return lu + " / " + lc;
	}
	
	public function copyInterpretation(src:Vertex):void {
		dominant_landuse = src.dominant_landuse;
		dominant_landuse_over50 = src.dominant_landuse_over50;
		other_landuse = src.other_landuse;
		landuse_confidence = src.landuse_confidence;
		
		dominant_landcover = src.dominant_landcover;
		dominant_landcover_over50 = src.dominant_landcover_over50;
		other_landcover = src.other_landcover;
		landcover_confidence = src.landcover_confidence;
		landcover_ephemeral = src.landcover_ephemeral;
		
		//date_confidence = src.date_confidence;
		//change_process = src.change_process;
		//change_process_confidence = src.change_process_confidence;
		//patch_size = src.patch_size;
		//relative_magnitude = src.relative_magnitude;
	}
	
	public function clearInterpretation():void {
		dominant_landuse = "";
		dominant_landuse_over50 = 0;
		other_landuse = "";
		landuse_confidence = "";
		
		dominant_landcover = "";
		dominant_landcover_over50 = 0;
		other_landcover = "";
		landcover_confidence = "";
		landcover_ephemeral = 0;
		
		date_confidence = "";
		change_process = "";
		change_process_confidence = "";
		
		patch_size = 0;
		relative_magnitude = 0;
	}
	
}

}