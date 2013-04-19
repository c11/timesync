/**
 * This is a generated sub-class of _Neighbor.as and is intended for behavior
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

public class Neighbor extends _Super_Neighbor
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
        _Super_Neighbor.model_internal::initRemoteClassAliasSingle(org.larse.vos.Neighbor);
        _Super_Neighbor.model_internal::initRemoteClassAliasAllRelated();
    }
     
    model_internal static function initRemoteClassAliasSingleChild() : void
    {
        _Super_Neighbor.model_internal::initRemoteClassAliasSingle(org.larse.vos.Neighbor);
    }
    
    {
        _Super_Neighbor.model_internal::initRemoteClassAliasSingle(org.larse.vos.Neighbor);
    }
    /** 
     * END OF DO NOT MODIFY SECTION
     *
     **/  
	
	public var isDirty:Boolean = false;
	
	public function Neighbor(project_id:int=0, tsa:int=0, plotid:int=0, 
							 year:int=0, julday:int=0, interpreter:int=0,
							 process:String="", patch_size:String="",
							 magnitude:String="",
							 direction:int=0,
							 includeplot:Boolean=false,
							 comments:String="")
	{
		super();
		this.project_id = project_id;
		this.tsa = tsa;
		this.plotid = plotid;
		this.image_year = year;
		this.image_julday = julday;
		this.interpreter = interpreter;
		this.change_process = process;
		this.patch_size = patch_size;
		this.relative_magnitude = magnitude;
		this.centroid_direction = direction;
		this.plot_included = includeplot?1:0;
		this.comments = comments;
	}
	
	
	public function get sqlValue():String {
		return "(" + this.plotid + 
				"," + this.image_year + 
				"," + this.image_julday +
				",'" + (this.change_process==null?"":change_process) + 
				"','" + (this.patch_size==null?"":patch_size) + 
				"','" + (this.relative_magnitude==null?"":relative_magnitude) +
				"'," + this.centroid_direction +
				"," + this.plot_included +
				",'" + this.comments +
				"'," + this.interpreter +
				"," + this.tsa + 
				"," + this.project_id + ")";
	}
	
	/**
	 * is neighbor interpretation complete.
	 * 
	 */
	public function get complete():Boolean {
		return (change_process!=null && change_process.length>0) &&
			   (patch_size!=null && patch_size.length>0) &&
			   (relative_magnitude!=null && relative_magnitude.length>0) &&
			   centroid_direction > 0 && image_year > 0;
	}
}

}