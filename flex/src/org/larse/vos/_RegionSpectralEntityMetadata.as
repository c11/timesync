
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
internal class _RegionSpectralEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("tcg", "tsa", "target_day", "image_julday", "plotid", "b3", "b2", "b5", "b4", "tcb", "b7", "sensor", "selected", "tcw", "image_year", "project_id", "b1", "spectral_scaler", "cloud_cover");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("tcg", "tsa", "target_day", "image_julday", "plotid", "b3", "b2", "b5", "b4", "tcb", "b7", "sensor", "selected", "tcw", "image_year", "project_id", "b1", "spectral_scaler", "cloud_cover");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("tcg", "tsa", "target_day", "image_julday", "plotid", "b3", "b2", "b5", "b4", "tcb", "b7", "sensor", "selected", "tcw", "image_year", "project_id", "b1", "spectral_scaler", "cloud_cover");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("tcg", "tsa", "target_day", "image_julday", "plotid", "b3", "b2", "b5", "b4", "tcb", "b7", "sensor", "selected", "tcw", "image_year", "project_id", "b1", "spectral_scaler", "cloud_cover");
    model_internal static var sourceProperties:Array = emptyArray
    model_internal static var nonDerivedProperties:Array = new Array("tcg", "tsa", "target_day", "image_julday", "plotid", "b3", "b2", "b5", "b4", "tcb", "b7", "sensor", "selected", "tcw", "image_year", "project_id", "b1", "spectral_scaler", "cloud_cover");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "RegionSpectral";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();
    model_internal static var propertyTypeMap:Object;

    
    model_internal var _tcgIsValid:Boolean;
    model_internal var _tcgValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _tcgIsValidCacheInitialized:Boolean = false;
    model_internal var _tcgValidationFailureMessages:Array;
    
    model_internal var _b3IsValid:Boolean;
    model_internal var _b3Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _b3IsValidCacheInitialized:Boolean = false;
    model_internal var _b3ValidationFailureMessages:Array;
    
    model_internal var _b2IsValid:Boolean;
    model_internal var _b2Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _b2IsValidCacheInitialized:Boolean = false;
    model_internal var _b2ValidationFailureMessages:Array;
    
    model_internal var _b5IsValid:Boolean;
    model_internal var _b5Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _b5IsValidCacheInitialized:Boolean = false;
    model_internal var _b5ValidationFailureMessages:Array;
    
    model_internal var _b4IsValid:Boolean;
    model_internal var _b4Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _b4IsValidCacheInitialized:Boolean = false;
    model_internal var _b4ValidationFailureMessages:Array;
    
    model_internal var _tcbIsValid:Boolean;
    model_internal var _tcbValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _tcbIsValidCacheInitialized:Boolean = false;
    model_internal var _tcbValidationFailureMessages:Array;
    
    model_internal var _b7IsValid:Boolean;
    model_internal var _b7Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _b7IsValidCacheInitialized:Boolean = false;
    model_internal var _b7ValidationFailureMessages:Array;
    
    model_internal var _sensorIsValid:Boolean;
    model_internal var _sensorValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _sensorIsValidCacheInitialized:Boolean = false;
    model_internal var _sensorValidationFailureMessages:Array;
    
    model_internal var _tcwIsValid:Boolean;
    model_internal var _tcwValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _tcwIsValidCacheInitialized:Boolean = false;
    model_internal var _tcwValidationFailureMessages:Array;
    
    model_internal var _b1IsValid:Boolean;
    model_internal var _b1Validator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _b1IsValidCacheInitialized:Boolean = false;
    model_internal var _b1ValidationFailureMessages:Array;

    model_internal var _instance:_Super_RegionSpectral;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _RegionSpectralEntityMetadata(value : _Super_RegionSpectral)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // dependents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["tcg"] = new Array();
            model_internal::dependentsOnMap["tsa"] = new Array();
            model_internal::dependentsOnMap["target_day"] = new Array();
            model_internal::dependentsOnMap["image_julday"] = new Array();
            model_internal::dependentsOnMap["plotid"] = new Array();
            model_internal::dependentsOnMap["b3"] = new Array();
            model_internal::dependentsOnMap["b2"] = new Array();
            model_internal::dependentsOnMap["b5"] = new Array();
            model_internal::dependentsOnMap["b4"] = new Array();
            model_internal::dependentsOnMap["tcb"] = new Array();
            model_internal::dependentsOnMap["b7"] = new Array();
            model_internal::dependentsOnMap["sensor"] = new Array();
            model_internal::dependentsOnMap["selected"] = new Array();
            model_internal::dependentsOnMap["tcw"] = new Array();
            model_internal::dependentsOnMap["image_year"] = new Array();
            model_internal::dependentsOnMap["project_id"] = new Array();
            model_internal::dependentsOnMap["b1"] = new Array();
            model_internal::dependentsOnMap["spectral_scaler"] = new Array();
            model_internal::dependentsOnMap["cloud_cover"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object();
        }

        // Property type Map
        model_internal::propertyTypeMap = new Object();
        model_internal::propertyTypeMap["tcg"] = "String";
        model_internal::propertyTypeMap["tsa"] = "int";
        model_internal::propertyTypeMap["target_day"] = "int";
        model_internal::propertyTypeMap["image_julday"] = "int";
        model_internal::propertyTypeMap["plotid"] = "int";
        model_internal::propertyTypeMap["b3"] = "String";
        model_internal::propertyTypeMap["b2"] = "String";
        model_internal::propertyTypeMap["b5"] = "String";
        model_internal::propertyTypeMap["b4"] = "String";
        model_internal::propertyTypeMap["tcb"] = "String";
        model_internal::propertyTypeMap["b7"] = "String";
        model_internal::propertyTypeMap["sensor"] = "String";
        model_internal::propertyTypeMap["selected"] = "int";
        model_internal::propertyTypeMap["tcw"] = "String";
        model_internal::propertyTypeMap["image_year"] = "int";
        model_internal::propertyTypeMap["project_id"] = "int";
        model_internal::propertyTypeMap["b1"] = "String";
        model_internal::propertyTypeMap["spectral_scaler"] = "int";
        model_internal::propertyTypeMap["cloud_cover"] = "int";

        model_internal::_instance = value;
        model_internal::_tcgValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForTcg);
        model_internal::_tcgValidator.required = true;
        model_internal::_tcgValidator.requiredFieldError = "tcg is required";
        //model_internal::_tcgValidator.source = model_internal::_instance;
        //model_internal::_tcgValidator.property = "tcg";
        model_internal::_b3Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForB3);
        model_internal::_b3Validator.required = true;
        model_internal::_b3Validator.requiredFieldError = "b3 is required";
        //model_internal::_b3Validator.source = model_internal::_instance;
        //model_internal::_b3Validator.property = "b3";
        model_internal::_b2Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForB2);
        model_internal::_b2Validator.required = true;
        model_internal::_b2Validator.requiredFieldError = "b2 is required";
        //model_internal::_b2Validator.source = model_internal::_instance;
        //model_internal::_b2Validator.property = "b2";
        model_internal::_b5Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForB5);
        model_internal::_b5Validator.required = true;
        model_internal::_b5Validator.requiredFieldError = "b5 is required";
        //model_internal::_b5Validator.source = model_internal::_instance;
        //model_internal::_b5Validator.property = "b5";
        model_internal::_b4Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForB4);
        model_internal::_b4Validator.required = true;
        model_internal::_b4Validator.requiredFieldError = "b4 is required";
        //model_internal::_b4Validator.source = model_internal::_instance;
        //model_internal::_b4Validator.property = "b4";
        model_internal::_tcbValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForTcb);
        model_internal::_tcbValidator.required = true;
        model_internal::_tcbValidator.requiredFieldError = "tcb is required";
        //model_internal::_tcbValidator.source = model_internal::_instance;
        //model_internal::_tcbValidator.property = "tcb";
        model_internal::_b7Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForB7);
        model_internal::_b7Validator.required = true;
        model_internal::_b7Validator.requiredFieldError = "b7 is required";
        //model_internal::_b7Validator.source = model_internal::_instance;
        //model_internal::_b7Validator.property = "b7";
        model_internal::_sensorValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForSensor);
        model_internal::_sensorValidator.required = true;
        model_internal::_sensorValidator.requiredFieldError = "sensor is required";
        //model_internal::_sensorValidator.source = model_internal::_instance;
        //model_internal::_sensorValidator.property = "sensor";
        model_internal::_tcwValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForTcw);
        model_internal::_tcwValidator.required = true;
        model_internal::_tcwValidator.requiredFieldError = "tcw is required";
        //model_internal::_tcwValidator.source = model_internal::_instance;
        //model_internal::_tcwValidator.property = "tcw";
        model_internal::_b1Validator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForB1);
        model_internal::_b1Validator.required = true;
        model_internal::_b1Validator.requiredFieldError = "b1 is required";
        //model_internal::_b1Validator.source = model_internal::_instance;
        //model_internal::_b1Validator.property = "b1";
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
            throw new Error(propertyName + " is not a data property of entity RegionSpectral");
            
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
            throw new Error(propertyName + " is not a collection property of entity RegionSpectral");

        return model_internal::collectionBaseMap[propertyName];
    }
    
    override public function getPropertyType(propertyName:String):String
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a property of RegionSpectral");

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
            throw new Error(propertyName + " does not exist for entity RegionSpectral");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::nonDerivedProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a modifiable property of entity RegionSpectral");
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
            throw new Error(propertyName + " does not exist for entity RegionSpectral");
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
    public function get isTcgAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTsaAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTarget_dayAvailable():Boolean
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
    public function get isB3Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isB2Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isB5Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isB4Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTcbAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isB7Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSensorAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSelectedAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTcwAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isImage_yearAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isProject_idAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isB1Available():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isSpectral_scalerAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isCloud_coverAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnTcg():void
    {
        if (model_internal::_tcgIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfTcg = null;
            model_internal::calculateTcgIsValid();
        }
    }
    public function invalidateDependentOnB3():void
    {
        if (model_internal::_b3IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfB3 = null;
            model_internal::calculateB3IsValid();
        }
    }
    public function invalidateDependentOnB2():void
    {
        if (model_internal::_b2IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfB2 = null;
            model_internal::calculateB2IsValid();
        }
    }
    public function invalidateDependentOnB5():void
    {
        if (model_internal::_b5IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfB5 = null;
            model_internal::calculateB5IsValid();
        }
    }
    public function invalidateDependentOnB4():void
    {
        if (model_internal::_b4IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfB4 = null;
            model_internal::calculateB4IsValid();
        }
    }
    public function invalidateDependentOnTcb():void
    {
        if (model_internal::_tcbIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfTcb = null;
            model_internal::calculateTcbIsValid();
        }
    }
    public function invalidateDependentOnB7():void
    {
        if (model_internal::_b7IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfB7 = null;
            model_internal::calculateB7IsValid();
        }
    }
    public function invalidateDependentOnSensor():void
    {
        if (model_internal::_sensorIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfSensor = null;
            model_internal::calculateSensorIsValid();
        }
    }
    public function invalidateDependentOnTcw():void
    {
        if (model_internal::_tcwIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfTcw = null;
            model_internal::calculateTcwIsValid();
        }
    }
    public function invalidateDependentOnB1():void
    {
        if (model_internal::_b1IsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfB1 = null;
            model_internal::calculateB1IsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get tcgStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get tcgValidator() : StyleValidator
    {
        return model_internal::_tcgValidator;
    }

    model_internal function set _tcgIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_tcgIsValid;         
        if (oldValue !== value)
        {
            model_internal::_tcgIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcgIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get tcgIsValid():Boolean
    {
        if (!model_internal::_tcgIsValidCacheInitialized)
        {
            model_internal::calculateTcgIsValid();
        }

        return model_internal::_tcgIsValid;
    }

    model_internal function calculateTcgIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_tcgValidator.validate(model_internal::_instance.tcg)
        model_internal::_tcgIsValid_der = (valRes.results == null);
        model_internal::_tcgIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::tcgValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::tcgValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get tcgValidationFailureMessages():Array
    {
        if (model_internal::_tcgValidationFailureMessages == null)
            model_internal::calculateTcgIsValid();

        return _tcgValidationFailureMessages;
    }

    model_internal function set tcgValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_tcgValidationFailureMessages;

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
            model_internal::_tcgValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcgValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get tsaStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get target_dayStyle():com.adobe.fiber.styles.Style
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
    public function get b3Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get b3Validator() : StyleValidator
    {
        return model_internal::_b3Validator;
    }

    model_internal function set _b3IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_b3IsValid;         
        if (oldValue !== value)
        {
            model_internal::_b3IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b3IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get b3IsValid():Boolean
    {
        if (!model_internal::_b3IsValidCacheInitialized)
        {
            model_internal::calculateB3IsValid();
        }

        return model_internal::_b3IsValid;
    }

    model_internal function calculateB3IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_b3Validator.validate(model_internal::_instance.b3)
        model_internal::_b3IsValid_der = (valRes.results == null);
        model_internal::_b3IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::b3ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::b3ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get b3ValidationFailureMessages():Array
    {
        if (model_internal::_b3ValidationFailureMessages == null)
            model_internal::calculateB3IsValid();

        return _b3ValidationFailureMessages;
    }

    model_internal function set b3ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_b3ValidationFailureMessages;

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
            model_internal::_b3ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b3ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get b2Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get b2Validator() : StyleValidator
    {
        return model_internal::_b2Validator;
    }

    model_internal function set _b2IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_b2IsValid;         
        if (oldValue !== value)
        {
            model_internal::_b2IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b2IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get b2IsValid():Boolean
    {
        if (!model_internal::_b2IsValidCacheInitialized)
        {
            model_internal::calculateB2IsValid();
        }

        return model_internal::_b2IsValid;
    }

    model_internal function calculateB2IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_b2Validator.validate(model_internal::_instance.b2)
        model_internal::_b2IsValid_der = (valRes.results == null);
        model_internal::_b2IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::b2ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::b2ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get b2ValidationFailureMessages():Array
    {
        if (model_internal::_b2ValidationFailureMessages == null)
            model_internal::calculateB2IsValid();

        return _b2ValidationFailureMessages;
    }

    model_internal function set b2ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_b2ValidationFailureMessages;

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
            model_internal::_b2ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b2ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get b5Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get b5Validator() : StyleValidator
    {
        return model_internal::_b5Validator;
    }

    model_internal function set _b5IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_b5IsValid;         
        if (oldValue !== value)
        {
            model_internal::_b5IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b5IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get b5IsValid():Boolean
    {
        if (!model_internal::_b5IsValidCacheInitialized)
        {
            model_internal::calculateB5IsValid();
        }

        return model_internal::_b5IsValid;
    }

    model_internal function calculateB5IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_b5Validator.validate(model_internal::_instance.b5)
        model_internal::_b5IsValid_der = (valRes.results == null);
        model_internal::_b5IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::b5ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::b5ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get b5ValidationFailureMessages():Array
    {
        if (model_internal::_b5ValidationFailureMessages == null)
            model_internal::calculateB5IsValid();

        return _b5ValidationFailureMessages;
    }

    model_internal function set b5ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_b5ValidationFailureMessages;

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
            model_internal::_b5ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b5ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get b4Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get b4Validator() : StyleValidator
    {
        return model_internal::_b4Validator;
    }

    model_internal function set _b4IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_b4IsValid;         
        if (oldValue !== value)
        {
            model_internal::_b4IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b4IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get b4IsValid():Boolean
    {
        if (!model_internal::_b4IsValidCacheInitialized)
        {
            model_internal::calculateB4IsValid();
        }

        return model_internal::_b4IsValid;
    }

    model_internal function calculateB4IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_b4Validator.validate(model_internal::_instance.b4)
        model_internal::_b4IsValid_der = (valRes.results == null);
        model_internal::_b4IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::b4ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::b4ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get b4ValidationFailureMessages():Array
    {
        if (model_internal::_b4ValidationFailureMessages == null)
            model_internal::calculateB4IsValid();

        return _b4ValidationFailureMessages;
    }

    model_internal function set b4ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_b4ValidationFailureMessages;

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
            model_internal::_b4ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b4ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get tcbStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get tcbValidator() : StyleValidator
    {
        return model_internal::_tcbValidator;
    }

    model_internal function set _tcbIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_tcbIsValid;         
        if (oldValue !== value)
        {
            model_internal::_tcbIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcbIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get tcbIsValid():Boolean
    {
        if (!model_internal::_tcbIsValidCacheInitialized)
        {
            model_internal::calculateTcbIsValid();
        }

        return model_internal::_tcbIsValid;
    }

    model_internal function calculateTcbIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_tcbValidator.validate(model_internal::_instance.tcb)
        model_internal::_tcbIsValid_der = (valRes.results == null);
        model_internal::_tcbIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::tcbValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::tcbValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get tcbValidationFailureMessages():Array
    {
        if (model_internal::_tcbValidationFailureMessages == null)
            model_internal::calculateTcbIsValid();

        return _tcbValidationFailureMessages;
    }

    model_internal function set tcbValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_tcbValidationFailureMessages;

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
            model_internal::_tcbValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcbValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get b7Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get b7Validator() : StyleValidator
    {
        return model_internal::_b7Validator;
    }

    model_internal function set _b7IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_b7IsValid;         
        if (oldValue !== value)
        {
            model_internal::_b7IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b7IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get b7IsValid():Boolean
    {
        if (!model_internal::_b7IsValidCacheInitialized)
        {
            model_internal::calculateB7IsValid();
        }

        return model_internal::_b7IsValid;
    }

    model_internal function calculateB7IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_b7Validator.validate(model_internal::_instance.b7)
        model_internal::_b7IsValid_der = (valRes.results == null);
        model_internal::_b7IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::b7ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::b7ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get b7ValidationFailureMessages():Array
    {
        if (model_internal::_b7ValidationFailureMessages == null)
            model_internal::calculateB7IsValid();

        return _b7ValidationFailureMessages;
    }

    model_internal function set b7ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_b7ValidationFailureMessages;

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
            model_internal::_b7ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b7ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get sensorStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get sensorValidator() : StyleValidator
    {
        return model_internal::_sensorValidator;
    }

    model_internal function set _sensorIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_sensorIsValid;         
        if (oldValue !== value)
        {
            model_internal::_sensorIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sensorIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get sensorIsValid():Boolean
    {
        if (!model_internal::_sensorIsValidCacheInitialized)
        {
            model_internal::calculateSensorIsValid();
        }

        return model_internal::_sensorIsValid;
    }

    model_internal function calculateSensorIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_sensorValidator.validate(model_internal::_instance.sensor)
        model_internal::_sensorIsValid_der = (valRes.results == null);
        model_internal::_sensorIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::sensorValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::sensorValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get sensorValidationFailureMessages():Array
    {
        if (model_internal::_sensorValidationFailureMessages == null)
            model_internal::calculateSensorIsValid();

        return _sensorValidationFailureMessages;
    }

    model_internal function set sensorValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_sensorValidationFailureMessages;

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
            model_internal::_sensorValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sensorValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get selectedStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get tcwStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get tcwValidator() : StyleValidator
    {
        return model_internal::_tcwValidator;
    }

    model_internal function set _tcwIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_tcwIsValid;         
        if (oldValue !== value)
        {
            model_internal::_tcwIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcwIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get tcwIsValid():Boolean
    {
        if (!model_internal::_tcwIsValidCacheInitialized)
        {
            model_internal::calculateTcwIsValid();
        }

        return model_internal::_tcwIsValid;
    }

    model_internal function calculateTcwIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_tcwValidator.validate(model_internal::_instance.tcw)
        model_internal::_tcwIsValid_der = (valRes.results == null);
        model_internal::_tcwIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::tcwValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::tcwValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get tcwValidationFailureMessages():Array
    {
        if (model_internal::_tcwValidationFailureMessages == null)
            model_internal::calculateTcwIsValid();

        return _tcwValidationFailureMessages;
    }

    model_internal function set tcwValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_tcwValidationFailureMessages;

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
            model_internal::_tcwValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcwValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get image_yearStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get project_idStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get b1Style():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get b1Validator() : StyleValidator
    {
        return model_internal::_b1Validator;
    }

    model_internal function set _b1IsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_b1IsValid;         
        if (oldValue !== value)
        {
            model_internal::_b1IsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b1IsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get b1IsValid():Boolean
    {
        if (!model_internal::_b1IsValidCacheInitialized)
        {
            model_internal::calculateB1IsValid();
        }

        return model_internal::_b1IsValid;
    }

    model_internal function calculateB1IsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_b1Validator.validate(model_internal::_instance.b1)
        model_internal::_b1IsValid_der = (valRes.results == null);
        model_internal::_b1IsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::b1ValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::b1ValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get b1ValidationFailureMessages():Array
    {
        if (model_internal::_b1ValidationFailureMessages == null)
            model_internal::calculateB1IsValid();

        return _b1ValidationFailureMessages;
    }

    model_internal function set b1ValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_b1ValidationFailureMessages;

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
            model_internal::_b1ValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b1ValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get spectral_scalerStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    [Bindable(event="propertyChange")]   
    public function get cloud_coverStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
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
            case("tcg"):
            {
                return tcgValidationFailureMessages;
            }
            case("b3"):
            {
                return b3ValidationFailureMessages;
            }
            case("b2"):
            {
                return b2ValidationFailureMessages;
            }
            case("b5"):
            {
                return b5ValidationFailureMessages;
            }
            case("b4"):
            {
                return b4ValidationFailureMessages;
            }
            case("tcb"):
            {
                return tcbValidationFailureMessages;
            }
            case("b7"):
            {
                return b7ValidationFailureMessages;
            }
            case("sensor"):
            {
                return sensorValidationFailureMessages;
            }
            case("tcw"):
            {
                return tcwValidationFailureMessages;
            }
            case("b1"):
            {
                return b1ValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
