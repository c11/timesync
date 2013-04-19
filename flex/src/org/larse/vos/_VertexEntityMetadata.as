
/**
 * This is a generated class and is not intended for modification.  
 */
package org.larse.vos
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _VertexEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("tsa", "dominant_landcover", "dominant_landcover_over50", "image_julday", "plotid", "dominant_landuse", "change_process", "patch_size", "other_landcover", "interpreter", "image_year", "dominant_landuse_over50", "relative_magnitude", "date_confidence", "landcover_ephemeral", "project_id", "vertex_id", "other_landuse", "landuse_confidence", "change_process_confidence", "comments", "landcover_confidence");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("tsa", "dominant_landcover", "dominant_landcover_over50", "image_julday", "plotid", "dominant_landuse", "change_process", "patch_size", "other_landcover", "interpreter", "image_year", "dominant_landuse_over50", "relative_magnitude", "date_confidence", "landcover_ephemeral", "project_id", "vertex_id", "other_landuse", "landuse_confidence", "change_process_confidence", "comments", "landcover_confidence");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("tsa", "dominant_landcover", "dominant_landcover_over50", "image_julday", "plotid", "dominant_landuse", "change_process", "patch_size", "other_landcover", "interpreter", "image_year", "dominant_landuse_over50", "relative_magnitude", "date_confidence", "landcover_ephemeral", "project_id", "vertex_id", "other_landuse", "landuse_confidence", "change_process_confidence", "comments", "landcover_confidence");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("tsa", "dominant_landcover", "dominant_landcover_over50", "image_julday", "plotid", "dominant_landuse", "change_process", "patch_size", "other_landcover", "interpreter", "image_year", "dominant_landuse_over50", "relative_magnitude", "date_confidence", "landcover_ephemeral", "project_id", "vertex_id", "other_landuse", "landuse_confidence", "change_process_confidence", "comments", "landcover_confidence");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("tsa", "dominant_landcover", "dominant_landcover_over50", "image_julday", "plotid", "dominant_landuse", "change_process", "patch_size", "other_landcover", "interpreter", "image_year", "dominant_landuse_over50", "relative_magnitude", "date_confidence", "landcover_ephemeral", "project_id", "vertex_id", "other_landuse", "landuse_confidence", "change_process_confidence", "comments", "landcover_confidence");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "Vertex";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _dominant_landcoverIsValid:Boolean;
    model_internal var _dominant_landcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dominant_landcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _dominant_landcoverValidationFailureMessages:Array;
    
    model_internal var _dominant_landuseIsValid:Boolean;
    model_internal var _dominant_landuseValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _dominant_landuseIsValidCacheInitialized:Boolean = false;
    model_internal var _dominant_landuseValidationFailureMessages:Array;
    
    model_internal var _change_processIsValid:Boolean;
    model_internal var _change_processValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _change_processIsValidCacheInitialized:Boolean = false;
    model_internal var _change_processValidationFailureMessages:Array;
    
    model_internal var _other_landcoverIsValid:Boolean;
    model_internal var _other_landcoverValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _other_landcoverIsValidCacheInitialized:Boolean = false;
    model_internal var _other_landcoverValidationFailureMessages:Array;
    
    model_internal var _date_confidenceIsValid:Boolean;
    model_internal var _date_confidenceValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _date_confidenceIsValidCacheInitialized:Boolean = false;
    model_internal var _date_confidenceValidationFailureMessages:Array;
    
    model_internal var _other_landuseIsValid:Boolean;
    model_internal var _other_landuseValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _other_landuseIsValidCacheInitialized:Boolean = false;
    model_internal var _other_landuseValidationFailureMessages:Array;
    
    model_internal var _landuse_confidenceIsValid:Boolean;
    model_internal var _landuse_confidenceValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _landuse_confidenceIsValidCacheInitialized:Boolean = false;
    model_internal var _landuse_confidenceValidationFailureMessages:Array;
    
    model_internal var _change_process_confidenceIsValid:Boolean;
    model_internal var _change_process_confidenceValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _change_process_confidenceIsValidCacheInitialized:Boolean = false;
    model_internal var _change_process_confidenceValidationFailureMessages:Array;
    
    model_internal var _commentsIsValid:Boolean;
    model_internal var _commentsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _commentsIsValidCacheInitialized:Boolean = false;
    model_internal var _commentsValidationFailureMessages:Array;
    
    model_internal var _landcover_confidenceIsValid:Boolean;
    model_internal var _landcover_confidenceValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _landcover_confidenceIsValidCacheInitialized:Boolean = false;
    model_internal var _landcover_confidenceValidationFailureMessages:Array;

    model_internal var _instance:_Super_Vertex;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _VertexEntityMetadata(value : _Super_Vertex)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["tsa"] = new Array();
            model_internal::dependentsOnMap["dominant_landcover"] = new Array();
            model_internal::dependentsOnMap["dominant_landcover_over50"] = new Array();
            model_internal::dependentsOnMap["image_julday"] = new Array();
            model_internal::dependentsOnMap["plotid"] = new Array();
            model_internal::dependentsOnMap["dominant_landuse"] = new Array();
            model_internal::dependentsOnMap["change_process"] = new Array();
            model_internal::dependentsOnMap["patch_size"] = new Array();
            model_internal::dependentsOnMap["other_landcover"] = new Array();
            model_internal::dependentsOnMap["interpreter"] = new Array();
            model_internal::dependentsOnMap["image_year"] = new Array();
            model_internal::dependentsOnMap["dominant_landuse_over50"] = new Array();
            model_internal::dependentsOnMap["relative_magnitude"] = new Array();
            model_internal::dependentsOnMap["date_confidence"] = new Array();
            model_internal::dependentsOnMap["landcover_ephemeral"] = new Array();
            model_internal::dependentsOnMap["project_id"] = new Array();
            model_internal::dependentsOnMap["vertex_id"] = new Array();
            model_internal::dependentsOnMap["other_landuse"] = new Array();
            model_internal::dependentsOnMap["landuse_confidence"] = new Array();
            model_internal::dependentsOnMap["change_process_confidence"] = new Array();
            model_internal::dependentsOnMap["comments"] = new Array();
            model_internal::dependentsOnMap["landcover_confidence"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["tsa"] = "int";
        model_internal::propertyTypeMap["dominant_landcover"] = "String";
        model_internal::propertyTypeMap["dominant_landcover_over50"] = "int";
        model_internal::propertyTypeMap["image_julday"] = "int";
        model_internal::propertyTypeMap["plotid"] = "int";
        model_internal::propertyTypeMap["dominant_landuse"] = "String";
        model_internal::propertyTypeMap["change_process"] = "String";
        model_internal::propertyTypeMap["patch_size"] = "int";
        model_internal::propertyTypeMap["other_landcover"] = "String";
        model_internal::propertyTypeMap["interpreter"] = "int";
        model_internal::propertyTypeMap["image_year"] = "int";
        model_internal::propertyTypeMap["dominant_landuse_over50"] = "int";
        model_internal::propertyTypeMap["relative_magnitude"] = "int";
        model_internal::propertyTypeMap["date_confidence"] = "String";
        model_internal::propertyTypeMap["landcover_ephemeral"] = "int";
        model_internal::propertyTypeMap["project_id"] = "int";
        model_internal::propertyTypeMap["vertex_id"] = "int";
        model_internal::propertyTypeMap["other_landuse"] = "String";
        model_internal::propertyTypeMap["landuse_confidence"] = "String";
        model_internal::propertyTypeMap["change_process_confidence"] = "String";
        model_internal::propertyTypeMap["comments"] = "String";
        model_internal::propertyTypeMap["landcover_confidence"] = "String";

        model_internal::_instance = value;
        model_internal::_dominant_landcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDominant_landcover);
        model_internal::_dominant_landcoverValidator.required = true;
        model_internal::_dominant_landcoverValidator.requiredFieldError = "dominant_landcover is required";
        //model_internal::_dominant_landcoverValidator.source = model_internal::_instance;
        //model_internal::_dominant_landcoverValidator.property = "dominant_landcover";
        model_internal::_dominant_landuseValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDominant_landuse);
        model_internal::_dominant_landuseValidator.required = true;
        model_internal::_dominant_landuseValidator.requiredFieldError = "dominant_landuse is required";
        //model_internal::_dominant_landuseValidator.source = model_internal::_instance;
        //model_internal::_dominant_landuseValidator.property = "dominant_landuse";
        model_internal::_change_processValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForChange_process);
        model_internal::_change_processValidator.required = true;
        model_internal::_change_processValidator.requiredFieldError = "change_process is required";
        //model_internal::_change_processValidator.source = model_internal::_instance;
        //model_internal::_change_processValidator.property = "change_process";
        model_internal::_other_landcoverValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForOther_landcover);
        model_internal::_other_landcoverValidator.required = true;
        model_internal::_other_landcoverValidator.requiredFieldError = "other_landcover is required";
        //model_internal::_other_landcoverValidator.source = model_internal::_instance;
        //model_internal::_other_landcoverValidator.property = "other_landcover";
        model_internal::_date_confidenceValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForDate_confidence);
        model_internal::_date_confidenceValidator.required = true;
        model_internal::_date_confidenceValidator.requiredFieldError = "date_confidence is required";
        //model_internal::_date_confidenceValidator.source = model_internal::_instance;
        //model_internal::_date_confidenceValidator.property = "date_confidence";
        model_internal::_other_landuseValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForOther_landuse);
        model_internal::_other_landuseValidator.required = true;
        model_internal::_other_landuseValidator.requiredFieldError = "other_landuse is required";
        //model_internal::_other_landuseValidator.source = model_internal::_instance;
        //model_internal::_other_landuseValidator.property = "other_landuse";
        model_internal::_landuse_confidenceValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLanduse_confidence);
        model_internal::_landuse_confidenceValidator.required = true;
        model_internal::_landuse_confidenceValidator.requiredFieldError = "landuse_confidence is required";
        //model_internal::_landuse_confidenceValidator.source = model_internal::_instance;
        //model_internal::_landuse_confidenceValidator.property = "landuse_confidence";
        model_internal::_change_process_confidenceValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForChange_process_confidence);
        model_internal::_change_process_confidenceValidator.required = true;
        model_internal::_change_process_confidenceValidator.requiredFieldError = "change_process_confidence is required";
        //model_internal::_change_process_confidenceValidator.source = model_internal::_instance;
        //model_internal::_change_process_confidenceValidator.property = "change_process_confidence";
        model_internal::_commentsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForComments);
        model_internal::_commentsValidator.required = true;
        model_internal::_commentsValidator.requiredFieldError = "comments is required";
        //model_internal::_commentsValidator.source = model_internal::_instance;
        //model_internal::_commentsValidator.property = "comments";
        model_internal::_landcover_confidenceValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLandcover_confidence);
        model_internal::_landcover_confidenceValidator.required = true;
        model_internal::_landcover_confidenceValidator.requiredFieldError = "landcover_confidence is required";
        //model_internal::_landcover_confidenceValidator.source = model_internal::_instance;
        //model_internal::_landcover_confidenceValidator.property = "landcover_confidence";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    public function getSourceProperties():Array
    {
        return model_internal::sourceProperties;
    }

    public function getNonDerivedProperties():Array
    {
        return model_internal::nonDerivedProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity Vertex");
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity Vertex");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of Vertex");

        return model_internal::propertyTypeMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity Vertex");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity Vertex");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity Vertex");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isTsaAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landcover_over50Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isImage_juldayAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPlotidAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landuseAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isChange_processAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPatch_sizeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOther_landcoverAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isInterpreterAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isImage_yearAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDominant_landuse_over50Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isRelative_magnitudeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isDate_confidenceAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLandcover_ephemeralAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProject_idAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isVertex_idAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isOther_landuseAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLanduse_confidenceAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isChange_process_confidenceAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCommentsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLandcover_confidenceAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnDominant_landcover():void
    {
        if (model_internal::_dominant_landcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDominant_landcover = null;
            model_internal::calculateDominant_landcoverIsValid();
        }
    }
    public function invalidateDependentOnDominant_landuse():void
    {
        if (model_internal::_dominant_landuseIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDominant_landuse = null;
            model_internal::calculateDominant_landuseIsValid();
        }
    }
    public function invalidateDependentOnChange_process():void
    {
        if (model_internal::_change_processIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfChange_process = null;
            model_internal::calculateChange_processIsValid();
        }
    }
    public function invalidateDependentOnOther_landcover():void
    {
        if (model_internal::_other_landcoverIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfOther_landcover = null;
            model_internal::calculateOther_landcoverIsValid();
        }
    }
    public function invalidateDependentOnDate_confidence():void
    {
        if (model_internal::_date_confidenceIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfDate_confidence = null;
            model_internal::calculateDate_confidenceIsValid();
        }
    }
    public function invalidateDependentOnOther_landuse():void
    {
        if (model_internal::_other_landuseIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfOther_landuse = null;
            model_internal::calculateOther_landuseIsValid();
        }
    }
    public function invalidateDependentOnLanduse_confidence():void
    {
        if (model_internal::_landuse_confidenceIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLanduse_confidence = null;
            model_internal::calculateLanduse_confidenceIsValid();
        }
    }
    public function invalidateDependentOnChange_process_confidence():void
    {
        if (model_internal::_change_process_confidenceIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfChange_process_confidence = null;
            model_internal::calculateChange_process_confidenceIsValid();
        }
    }
    public function invalidateDependentOnComments():void
    {
        if (model_internal::_commentsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfComments = null;
            model_internal::calculateCommentsIsValid();
        }
    }
    public function invalidateDependentOnLandcover_confidence():void
    {
        if (model_internal::_landcover_confidenceIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLandcover_confidence = null;
            model_internal::calculateLandcover_confidenceIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get tsaStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dominant_landcoverValidator() : StyleValidator
    {
        return model_internal::_dominant_landcoverValidator;
    }

    model_internal function set _dominant_landcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dominant_landcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dominant_landcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landcoverIsValid():Boolean
    {
        if (!model_internal::_dominant_landcoverIsValidCacheInitialized)
        {
            model_internal::calculateDominant_landcoverIsValid();
        }

        return model_internal::_dominant_landcoverIsValid;
    }

    model_internal function calculateDominant_landcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dominant_landcoverValidator.validate(model_internal::_instance.dominant_landcover)
        model_internal::_dominant_landcoverIsValid_der = (valRes.results == null);
        model_internal::_dominant_landcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dominant_landcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dominant_landcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landcoverValidationFailureMessages():Array
    {
        if (model_internal::_dominant_landcoverValidationFailureMessages == null)
            model_internal::calculateDominant_landcoverIsValid();

        return _dominant_landcoverValidationFailureMessages;
    }

    model_internal function set dominant_landcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dominant_landcoverValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_dominant_landcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landcoverValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landcover_over50Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get image_juldayStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get plotidStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landuseStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get dominant_landuseValidator() : StyleValidator
    {
        return model_internal::_dominant_landuseValidator;
    }

    model_internal function set _dominant_landuseIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_dominant_landuseIsValid;         
        if (oldValue !== value)
        {
            model_internal::_dominant_landuseIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landuseIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landuseIsValid():Boolean
    {
        if (!model_internal::_dominant_landuseIsValidCacheInitialized)
        {
            model_internal::calculateDominant_landuseIsValid();
        }

        return model_internal::_dominant_landuseIsValid;
    }

    model_internal function calculateDominant_landuseIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_dominant_landuseValidator.validate(model_internal::_instance.dominant_landuse)
        model_internal::_dominant_landuseIsValid_der = (valRes.results == null);
        model_internal::_dominant_landuseIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::dominant_landuseValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::dominant_landuseValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get dominant_landuseValidationFailureMessages():Array
    {
        if (model_internal::_dominant_landuseValidationFailureMessages == null)
            model_internal::calculateDominant_landuseIsValid();

        return _dominant_landuseValidationFailureMessages;
    }

    model_internal function set dominant_landuseValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_dominant_landuseValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_dominant_landuseValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "dominant_landuseValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get change_processStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get change_processValidator() : StyleValidator
    {
        return model_internal::_change_processValidator;
    }

    model_internal function set _change_processIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_change_processIsValid;         
        if (oldValue !== value)
        {
            model_internal::_change_processIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "change_processIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get change_processIsValid():Boolean
    {
        if (!model_internal::_change_processIsValidCacheInitialized)
        {
            model_internal::calculateChange_processIsValid();
        }

        return model_internal::_change_processIsValid;
    }

    model_internal function calculateChange_processIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_change_processValidator.validate(model_internal::_instance.change_process)
        model_internal::_change_processIsValid_der = (valRes.results == null);
        model_internal::_change_processIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::change_processValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::change_processValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get change_processValidationFailureMessages():Array
    {
        if (model_internal::_change_processValidationFailureMessages == null)
            model_internal::calculateChange_processIsValid();

        return _change_processValidationFailureMessages;
    }

    model_internal function set change_processValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_change_processValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_change_processValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "change_processValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get patch_sizeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get other_landcoverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get other_landcoverValidator() : StyleValidator
    {
        return model_internal::_other_landcoverValidator;
    }

    model_internal function set _other_landcoverIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_other_landcoverIsValid;         
        if (oldValue !== value)
        {
            model_internal::_other_landcoverIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landcoverIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get other_landcoverIsValid():Boolean
    {
        if (!model_internal::_other_landcoverIsValidCacheInitialized)
        {
            model_internal::calculateOther_landcoverIsValid();
        }

        return model_internal::_other_landcoverIsValid;
    }

    model_internal function calculateOther_landcoverIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_other_landcoverValidator.validate(model_internal::_instance.other_landcover)
        model_internal::_other_landcoverIsValid_der = (valRes.results == null);
        model_internal::_other_landcoverIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::other_landcoverValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::other_landcoverValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get other_landcoverValidationFailureMessages():Array
    {
        if (model_internal::_other_landcoverValidationFailureMessages == null)
            model_internal::calculateOther_landcoverIsValid();

        return _other_landcoverValidationFailureMessages;
    }

    model_internal function set other_landcoverValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_other_landcoverValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_other_landcoverValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landcoverValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get interpreterStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get image_yearStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get dominant_landuse_over50Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get relative_magnitudeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get date_confidenceStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get date_confidenceValidator() : StyleValidator
    {
        return model_internal::_date_confidenceValidator;
    }

    model_internal function set _date_confidenceIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_date_confidenceIsValid;         
        if (oldValue !== value)
        {
            model_internal::_date_confidenceIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "date_confidenceIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get date_confidenceIsValid():Boolean
    {
        if (!model_internal::_date_confidenceIsValidCacheInitialized)
        {
            model_internal::calculateDate_confidenceIsValid();
        }

        return model_internal::_date_confidenceIsValid;
    }

    model_internal function calculateDate_confidenceIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_date_confidenceValidator.validate(model_internal::_instance.date_confidence)
        model_internal::_date_confidenceIsValid_der = (valRes.results == null);
        model_internal::_date_confidenceIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::date_confidenceValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::date_confidenceValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get date_confidenceValidationFailureMessages():Array
    {
        if (model_internal::_date_confidenceValidationFailureMessages == null)
            model_internal::calculateDate_confidenceIsValid();

        return _date_confidenceValidationFailureMessages;
    }

    model_internal function set date_confidenceValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_date_confidenceValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_date_confidenceValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "date_confidenceValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get landcover_ephemeralStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get project_idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get vertex_idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get other_landuseStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get other_landuseValidator() : StyleValidator
    {
        return model_internal::_other_landuseValidator;
    }

    model_internal function set _other_landuseIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_other_landuseIsValid;         
        if (oldValue !== value)
        {
            model_internal::_other_landuseIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landuseIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get other_landuseIsValid():Boolean
    {
        if (!model_internal::_other_landuseIsValidCacheInitialized)
        {
            model_internal::calculateOther_landuseIsValid();
        }

        return model_internal::_other_landuseIsValid;
    }

    model_internal function calculateOther_landuseIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_other_landuseValidator.validate(model_internal::_instance.other_landuse)
        model_internal::_other_landuseIsValid_der = (valRes.results == null);
        model_internal::_other_landuseIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::other_landuseValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::other_landuseValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get other_landuseValidationFailureMessages():Array
    {
        if (model_internal::_other_landuseValidationFailureMessages == null)
            model_internal::calculateOther_landuseIsValid();

        return _other_landuseValidationFailureMessages;
    }

    model_internal function set other_landuseValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_other_landuseValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_other_landuseValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "other_landuseValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get landuse_confidenceStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get landuse_confidenceValidator() : StyleValidator
    {
        return model_internal::_landuse_confidenceValidator;
    }

    model_internal function set _landuse_confidenceIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_landuse_confidenceIsValid;         
        if (oldValue !== value)
        {
            model_internal::_landuse_confidenceIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landuse_confidenceIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get landuse_confidenceIsValid():Boolean
    {
        if (!model_internal::_landuse_confidenceIsValidCacheInitialized)
        {
            model_internal::calculateLanduse_confidenceIsValid();
        }

        return model_internal::_landuse_confidenceIsValid;
    }

    model_internal function calculateLanduse_confidenceIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_landuse_confidenceValidator.validate(model_internal::_instance.landuse_confidence)
        model_internal::_landuse_confidenceIsValid_der = (valRes.results == null);
        model_internal::_landuse_confidenceIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::landuse_confidenceValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::landuse_confidenceValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get landuse_confidenceValidationFailureMessages():Array
    {
        if (model_internal::_landuse_confidenceValidationFailureMessages == null)
            model_internal::calculateLanduse_confidenceIsValid();

        return _landuse_confidenceValidationFailureMessages;
    }

    model_internal function set landuse_confidenceValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_landuse_confidenceValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_landuse_confidenceValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landuse_confidenceValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get change_process_confidenceStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get change_process_confidenceValidator() : StyleValidator
    {
        return model_internal::_change_process_confidenceValidator;
    }

    model_internal function set _change_process_confidenceIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_change_process_confidenceIsValid;         
        if (oldValue !== value)
        {
            model_internal::_change_process_confidenceIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "change_process_confidenceIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get change_process_confidenceIsValid():Boolean
    {
        if (!model_internal::_change_process_confidenceIsValidCacheInitialized)
        {
            model_internal::calculateChange_process_confidenceIsValid();
        }

        return model_internal::_change_process_confidenceIsValid;
    }

    model_internal function calculateChange_process_confidenceIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_change_process_confidenceValidator.validate(model_internal::_instance.change_process_confidence)
        model_internal::_change_process_confidenceIsValid_der = (valRes.results == null);
        model_internal::_change_process_confidenceIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::change_process_confidenceValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::change_process_confidenceValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get change_process_confidenceValidationFailureMessages():Array
    {
        if (model_internal::_change_process_confidenceValidationFailureMessages == null)
            model_internal::calculateChange_process_confidenceIsValid();

        return _change_process_confidenceValidationFailureMessages;
    }

    model_internal function set change_process_confidenceValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_change_process_confidenceValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_change_process_confidenceValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "change_process_confidenceValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get commentsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get commentsValidator() : StyleValidator
    {
        return model_internal::_commentsValidator;
    }

    model_internal function set _commentsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_commentsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_commentsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get commentsIsValid():Boolean
    {
        if (!model_internal::_commentsIsValidCacheInitialized)
        {
            model_internal::calculateCommentsIsValid();
        }

        return model_internal::_commentsIsValid;
    }

    model_internal function calculateCommentsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_commentsValidator.validate(model_internal::_instance.comments)
        model_internal::_commentsIsValid_der = (valRes.results == null);
        model_internal::_commentsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::commentsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::commentsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get commentsValidationFailureMessages():Array
    {
        if (model_internal::_commentsValidationFailureMessages == null)
            model_internal::calculateCommentsIsValid();

        return _commentsValidationFailureMessages;
    }

    model_internal function set commentsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_commentsValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_commentsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "commentsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get landcover_confidenceStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get landcover_confidenceValidator() : StyleValidator
    {
        return model_internal::_landcover_confidenceValidator;
    }

    model_internal function set _landcover_confidenceIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_landcover_confidenceIsValid;         
        if (oldValue !== value)
        {
            model_internal::_landcover_confidenceIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landcover_confidenceIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get landcover_confidenceIsValid():Boolean
    {
        if (!model_internal::_landcover_confidenceIsValidCacheInitialized)
        {
            model_internal::calculateLandcover_confidenceIsValid();
        }

        return model_internal::_landcover_confidenceIsValid;
    }

    model_internal function calculateLandcover_confidenceIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_landcover_confidenceValidator.validate(model_internal::_instance.landcover_confidence)
        model_internal::_landcover_confidenceIsValid_der = (valRes.results == null);
        model_internal::_landcover_confidenceIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::landcover_confidenceValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::landcover_confidenceValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get landcover_confidenceValidationFailureMessages():Array
    {
        if (model_internal::_landcover_confidenceValidationFailureMessages == null)
            model_internal::calculateLandcover_confidenceIsValid();

        return _landcover_confidenceValidationFailureMessages;
    }

    model_internal function set landcover_confidenceValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_landcover_confidenceValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_landcover_confidenceValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "landcover_confidenceValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("dominant_landcover"):
            {
                return dominant_landcoverValidationFailureMessages;
            }
            case("dominant_landuse"):
            {
                return dominant_landuseValidationFailureMessages;
            }
            case("change_process"):
            {
                return change_processValidationFailureMessages;
            }
            case("other_landcover"):
            {
                return other_landcoverValidationFailureMessages;
            }
            case("date_confidence"):
            {
                return date_confidenceValidationFailureMessages;
            }
            case("other_landuse"):
            {
                return other_landuseValidationFailureMessages;
            }
            case("landuse_confidence"):
            {
                return landuse_confidenceValidationFailureMessages;
            }
            case("change_process_confidence"):
            {
                return change_process_confidenceValidationFailureMessages;
            }
            case("comments"):
            {
                return commentsValidationFailureMessages;
            }
            case("landcover_confidence"):
            {
                return landcover_confidenceValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
