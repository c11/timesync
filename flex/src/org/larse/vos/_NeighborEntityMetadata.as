
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
internal class _NeighborEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("tsa", "image_julday", "plotid", "neighbor_id", "change_process", "patch_size", "interpreter", "image_year", "relative_magnitude", "project_id", "centroid_direction", "plot_included", "comments");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("tsa", "image_julday", "plotid", "neighbor_id", "change_process", "patch_size", "interpreter", "image_year", "relative_magnitude", "project_id", "centroid_direction", "plot_included", "comments");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("tsa", "image_julday", "plotid", "neighbor_id", "change_process", "patch_size", "interpreter", "image_year", "relative_magnitude", "project_id", "centroid_direction", "plot_included", "comments");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("tsa", "image_julday", "plotid", "neighbor_id", "change_process", "patch_size", "interpreter", "image_year", "relative_magnitude", "project_id", "centroid_direction", "plot_included", "comments");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("tsa", "image_julday", "plotid", "neighbor_id", "change_process", "patch_size", "interpreter", "image_year", "relative_magnitude", "project_id", "centroid_direction", "plot_included", "comments");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "Neighbor";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _change_processIsValid:Boolean;
    model_internal var _change_processValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _change_processIsValidCacheInitialized:Boolean = false;
    model_internal var _change_processValidationFailureMessages:Array;
    
    model_internal var _patch_sizeIsValid:Boolean;
    model_internal var _patch_sizeValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _patch_sizeIsValidCacheInitialized:Boolean = false;
    model_internal var _patch_sizeValidationFailureMessages:Array;
    
    model_internal var _relative_magnitudeIsValid:Boolean;
    model_internal var _relative_magnitudeValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _relative_magnitudeIsValidCacheInitialized:Boolean = false;
    model_internal var _relative_magnitudeValidationFailureMessages:Array;
    
    model_internal var _commentsIsValid:Boolean;
    model_internal var _commentsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _commentsIsValidCacheInitialized:Boolean = false;
    model_internal var _commentsValidationFailureMessages:Array;

    model_internal var _instance:_Super_Neighbor;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _NeighborEntityMetadata(value : _Super_Neighbor)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["tsa"] = new Array();
            model_internal::dependentsOnMap["image_julday"] = new Array();
            model_internal::dependentsOnMap["plotid"] = new Array();
            model_internal::dependentsOnMap["neighbor_id"] = new Array();
            model_internal::dependentsOnMap["change_process"] = new Array();
            model_internal::dependentsOnMap["patch_size"] = new Array();
            model_internal::dependentsOnMap["interpreter"] = new Array();
            model_internal::dependentsOnMap["image_year"] = new Array();
            model_internal::dependentsOnMap["relative_magnitude"] = new Array();
            model_internal::dependentsOnMap["project_id"] = new Array();
            model_internal::dependentsOnMap["centroid_direction"] = new Array();
            model_internal::dependentsOnMap["plot_included"] = new Array();
            model_internal::dependentsOnMap["comments"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["tsa"] = "int";
        model_internal::propertyTypeMap["image_julday"] = "int";
        model_internal::propertyTypeMap["plotid"] = "int";
        model_internal::propertyTypeMap["neighbor_id"] = "int";
        model_internal::propertyTypeMap["change_process"] = "String";
        model_internal::propertyTypeMap["patch_size"] = "String";
        model_internal::propertyTypeMap["interpreter"] = "int";
        model_internal::propertyTypeMap["image_year"] = "int";
        model_internal::propertyTypeMap["relative_magnitude"] = "String";
        model_internal::propertyTypeMap["project_id"] = "int";
        model_internal::propertyTypeMap["centroid_direction"] = "int";
        model_internal::propertyTypeMap["plot_included"] = "int";
        model_internal::propertyTypeMap["comments"] = "String";

        model_internal::_instance = value;
        model_internal::_change_processValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForChange_process);
        model_internal::_change_processValidator.required = true;
        model_internal::_change_processValidator.requiredFieldError = "change_process is required";
        //model_internal::_change_processValidator.source = model_internal::_instance;
        //model_internal::_change_processValidator.property = "change_process";
        model_internal::_patch_sizeValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForPatch_size);
        model_internal::_patch_sizeValidator.required = true;
        model_internal::_patch_sizeValidator.requiredFieldError = "patch_size is required";
        //model_internal::_patch_sizeValidator.source = model_internal::_instance;
        //model_internal::_patch_sizeValidator.property = "patch_size";
        model_internal::_relative_magnitudeValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForRelative_magnitude);
        model_internal::_relative_magnitudeValidator.required = true;
        model_internal::_relative_magnitudeValidator.requiredFieldError = "relative_magnitude is required";
        //model_internal::_relative_magnitudeValidator.source = model_internal::_instance;
        //model_internal::_relative_magnitudeValidator.property = "relative_magnitude";
        model_internal::_commentsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForComments);
        model_internal::_commentsValidator.required = true;
        model_internal::_commentsValidator.requiredFieldError = "comments is required";
        //model_internal::_commentsValidator.source = model_internal::_instance;
        //model_internal::_commentsValidator.property = "comments";
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
            throw new Error(propertyName + " is not a data property of entity Neighbor");
            
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
            throw new Error(propertyName + " is not a collection property of entity Neighbor");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of Neighbor");

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
            throw new Error(propertyName + " does not exist for entity Neighbor");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity Neighbor");
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
            throw new Error(propertyName + " does not exist for entity Neighbor");
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
    public function get isNeighbor_idAvailable():Boolean
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
    public function get isRelative_magnitudeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProject_idAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCentroid_directionAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isPlot_includedAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCommentsAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnChange_process():void
    {
        if (model_internal::_change_processIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfChange_process = null;
            model_internal::calculateChange_processIsValid();
        }
    }
    public function invalidateDependentOnPatch_size():void
    {
        if (model_internal::_patch_sizeIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfPatch_size = null;
            model_internal::calculatePatch_sizeIsValid();
        }
    }
    public function invalidateDependentOnRelative_magnitude():void
    {
        if (model_internal::_relative_magnitudeIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfRelative_magnitude = null;
            model_internal::calculateRelative_magnitudeIsValid();
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
    public function get neighbor_idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
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

    public function get patch_sizeValidator() : StyleValidator
    {
        return model_internal::_patch_sizeValidator;
    }

    model_internal function set _patch_sizeIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_patch_sizeIsValid;         
        if (oldValue !== value)
        {
            model_internal::_patch_sizeIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patch_sizeIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get patch_sizeIsValid():Boolean
    {
        if (!model_internal::_patch_sizeIsValidCacheInitialized)
        {
            model_internal::calculatePatch_sizeIsValid();
        }

        return model_internal::_patch_sizeIsValid;
    }

    model_internal function calculatePatch_sizeIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_patch_sizeValidator.validate(model_internal::_instance.patch_size)
        model_internal::_patch_sizeIsValid_der = (valRes.results == null);
        model_internal::_patch_sizeIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::patch_sizeValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::patch_sizeValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get patch_sizeValidationFailureMessages():Array
    {
        if (model_internal::_patch_sizeValidationFailureMessages == null)
            model_internal::calculatePatch_sizeIsValid();

        return _patch_sizeValidationFailureMessages;
    }

    model_internal function set patch_sizeValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_patch_sizeValidationFailureMessages;

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
            model_internal::_patch_sizeValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patch_sizeValidationFailureMessages", oldValue, value));
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
    public function get relative_magnitudeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get relative_magnitudeValidator() : StyleValidator
    {
        return model_internal::_relative_magnitudeValidator;
    }

    model_internal function set _relative_magnitudeIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_relative_magnitudeIsValid;         
        if (oldValue !== value)
        {
            model_internal::_relative_magnitudeIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "relative_magnitudeIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get relative_magnitudeIsValid():Boolean
    {
        if (!model_internal::_relative_magnitudeIsValidCacheInitialized)
        {
            model_internal::calculateRelative_magnitudeIsValid();
        }

        return model_internal::_relative_magnitudeIsValid;
    }

    model_internal function calculateRelative_magnitudeIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_relative_magnitudeValidator.validate(model_internal::_instance.relative_magnitude)
        model_internal::_relative_magnitudeIsValid_der = (valRes.results == null);
        model_internal::_relative_magnitudeIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::relative_magnitudeValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::relative_magnitudeValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get relative_magnitudeValidationFailureMessages():Array
    {
        if (model_internal::_relative_magnitudeValidationFailureMessages == null)
            model_internal::calculateRelative_magnitudeIsValid();

        return _relative_magnitudeValidationFailureMessages;
    }

    model_internal function set relative_magnitudeValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_relative_magnitudeValidationFailureMessages;

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
            model_internal::_relative_magnitudeValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "relative_magnitudeValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get project_idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get centroid_directionStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get plot_includedStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
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
            case("change_process"):
            {
                return change_processValidationFailureMessages;
            }
            case("patch_size"):
            {
                return patch_sizeValidationFailureMessages;
            }
            case("relative_magnitude"):
            {
                return relative_magnitudeValidationFailureMessages;
            }
            case("comments"):
            {
                return commentsValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
