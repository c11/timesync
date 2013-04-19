/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - RegionSpectral.as.
 */

package org.larse.vos
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_RegionSpectral extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _RegionSpectralEntityMetadata;
    model_internal var _changedObjects:mx.collections.ArrayCollection = new ArrayCollection();

    public function getChangedObjects() : Array
    {
        _changedObjects.addItemAt(this,0);
        return _changedObjects.source;
    }

    public function clearChangedObjects() : void
    {
        _changedObjects.removeAll();
    }

    /**
     * properties
     */
    private var _internal_tcg : String;
    private var _internal_tsa : int;
    private var _internal_target_day : int;
    private var _internal_image_julday : int;
    private var _internal_plotid : int;
    private var _internal_b3 : String;
    private var _internal_b2 : String;
    private var _internal_b5 : String;
    private var _internal_b4 : String;
    private var _internal_tcb : String;
    private var _internal_b7 : String;
    private var _internal_sensor : String;
    private var _internal_selected : int;
    private var _internal_tcw : String;
    private var _internal_image_year : int;
    private var _internal_project_id : int;
    private var _internal_b1 : String;
    private var _internal_spectral_scaler : int;
    private var _internal_cloud_cover : int;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_RegionSpectral()
    {
        _model = new _RegionSpectralEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "tcg", model_internal::setterListenerTcg));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "b3", model_internal::setterListenerB3));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "b2", model_internal::setterListenerB2));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "b5", model_internal::setterListenerB5));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "b4", model_internal::setterListenerB4));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "tcb", model_internal::setterListenerTcb));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "b7", model_internal::setterListenerB7));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "sensor", model_internal::setterListenerSensor));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "tcw", model_internal::setterListenerTcw));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "b1", model_internal::setterListenerB1));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get tcg() : String
    {
        return _internal_tcg;
    }

    [Bindable(event="propertyChange")]
    public function get tsa() : int
    {
        return _internal_tsa;
    }

    [Bindable(event="propertyChange")]
    public function get target_day() : int
    {
        return _internal_target_day;
    }

    [Bindable(event="propertyChange")]
    public function get image_julday() : int
    {
        return _internal_image_julday;
    }

    [Bindable(event="propertyChange")]
    public function get plotid() : int
    {
        return _internal_plotid;
    }

    [Bindable(event="propertyChange")]
    public function get b3() : String
    {
        return _internal_b3;
    }

    [Bindable(event="propertyChange")]
    public function get b2() : String
    {
        return _internal_b2;
    }

    [Bindable(event="propertyChange")]
    public function get b5() : String
    {
        return _internal_b5;
    }

    [Bindable(event="propertyChange")]
    public function get b4() : String
    {
        return _internal_b4;
    }

    [Bindable(event="propertyChange")]
    public function get tcb() : String
    {
        return _internal_tcb;
    }

    [Bindable(event="propertyChange")]
    public function get b7() : String
    {
        return _internal_b7;
    }

    [Bindable(event="propertyChange")]
    public function get sensor() : String
    {
        return _internal_sensor;
    }

    [Bindable(event="propertyChange")]
    public function get selected() : int
    {
        return _internal_selected;
    }

    [Bindable(event="propertyChange")]
    public function get tcw() : String
    {
        return _internal_tcw;
    }

    [Bindable(event="propertyChange")]
    public function get image_year() : int
    {
        return _internal_image_year;
    }

    [Bindable(event="propertyChange")]
    public function get project_id() : int
    {
        return _internal_project_id;
    }

    [Bindable(event="propertyChange")]
    public function get b1() : String
    {
        return _internal_b1;
    }

    [Bindable(event="propertyChange")]
    public function get spectral_scaler() : int
    {
        return _internal_spectral_scaler;
    }

    [Bindable(event="propertyChange")]
    public function get cloud_cover() : int
    {
        return _internal_cloud_cover;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set tcg(value:String) : void
    {
        var oldValue:String = _internal_tcg;
        if (oldValue !== value)
        {
            _internal_tcg = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcg", oldValue, _internal_tcg));
        }
    }

    public function set tsa(value:int) : void
    {
        var oldValue:int = _internal_tsa;
        if (oldValue !== value)
        {
            _internal_tsa = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tsa", oldValue, _internal_tsa));
        }
    }

    public function set target_day(value:int) : void
    {
        var oldValue:int = _internal_target_day;
        if (oldValue !== value)
        {
            _internal_target_day = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "target_day", oldValue, _internal_target_day));
        }
    }

    public function set image_julday(value:int) : void
    {
        var oldValue:int = _internal_image_julday;
        if (oldValue !== value)
        {
            _internal_image_julday = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "image_julday", oldValue, _internal_image_julday));
        }
    }

    public function set plotid(value:int) : void
    {
        var oldValue:int = _internal_plotid;
        if (oldValue !== value)
        {
            _internal_plotid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "plotid", oldValue, _internal_plotid));
        }
    }

    public function set b3(value:String) : void
    {
        var oldValue:String = _internal_b3;
        if (oldValue !== value)
        {
            _internal_b3 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b3", oldValue, _internal_b3));
        }
    }

    public function set b2(value:String) : void
    {
        var oldValue:String = _internal_b2;
        if (oldValue !== value)
        {
            _internal_b2 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b2", oldValue, _internal_b2));
        }
    }

    public function set b5(value:String) : void
    {
        var oldValue:String = _internal_b5;
        if (oldValue !== value)
        {
            _internal_b5 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b5", oldValue, _internal_b5));
        }
    }

    public function set b4(value:String) : void
    {
        var oldValue:String = _internal_b4;
        if (oldValue !== value)
        {
            _internal_b4 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b4", oldValue, _internal_b4));
        }
    }

    public function set tcb(value:String) : void
    {
        var oldValue:String = _internal_tcb;
        if (oldValue !== value)
        {
            _internal_tcb = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcb", oldValue, _internal_tcb));
        }
    }

    public function set b7(value:String) : void
    {
        var oldValue:String = _internal_b7;
        if (oldValue !== value)
        {
            _internal_b7 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b7", oldValue, _internal_b7));
        }
    }

    public function set sensor(value:String) : void
    {
        var oldValue:String = _internal_sensor;
        if (oldValue !== value)
        {
            _internal_sensor = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "sensor", oldValue, _internal_sensor));
        }
    }

    public function set selected(value:int) : void
    {
        var oldValue:int = _internal_selected;
        if (oldValue !== value)
        {
            _internal_selected = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "selected", oldValue, _internal_selected));
        }
    }

    public function set tcw(value:String) : void
    {
        var oldValue:String = _internal_tcw;
        if (oldValue !== value)
        {
            _internal_tcw = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tcw", oldValue, _internal_tcw));
        }
    }

    public function set image_year(value:int) : void
    {
        var oldValue:int = _internal_image_year;
        if (oldValue !== value)
        {
            _internal_image_year = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "image_year", oldValue, _internal_image_year));
        }
    }

    public function set project_id(value:int) : void
    {
        var oldValue:int = _internal_project_id;
        if (oldValue !== value)
        {
            _internal_project_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "project_id", oldValue, _internal_project_id));
        }
    }

    public function set b1(value:String) : void
    {
        var oldValue:String = _internal_b1;
        if (oldValue !== value)
        {
            _internal_b1 = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "b1", oldValue, _internal_b1));
        }
    }

    public function set spectral_scaler(value:int) : void
    {
        var oldValue:int = _internal_spectral_scaler;
        if (oldValue !== value)
        {
            _internal_spectral_scaler = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_scaler", oldValue, _internal_spectral_scaler));
        }
    }

    public function set cloud_cover(value:int) : void
    {
        var oldValue:int = _internal_cloud_cover;
        if (oldValue !== value)
        {
            _internal_cloud_cover = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "cloud_cover", oldValue, _internal_cloud_cover));
        }
    }

    /**
     * Data/source property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerTcg(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTcg();
    }

    model_internal function setterListenerB3(value:flash.events.Event):void
    {
        _model.invalidateDependentOnB3();
    }

    model_internal function setterListenerB2(value:flash.events.Event):void
    {
        _model.invalidateDependentOnB2();
    }

    model_internal function setterListenerB5(value:flash.events.Event):void
    {
        _model.invalidateDependentOnB5();
    }

    model_internal function setterListenerB4(value:flash.events.Event):void
    {
        _model.invalidateDependentOnB4();
    }

    model_internal function setterListenerTcb(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTcb();
    }

    model_internal function setterListenerB7(value:flash.events.Event):void
    {
        _model.invalidateDependentOnB7();
    }

    model_internal function setterListenerSensor(value:flash.events.Event):void
    {
        _model.invalidateDependentOnSensor();
    }

    model_internal function setterListenerTcw(value:flash.events.Event):void
    {
        _model.invalidateDependentOnTcw();
    }

    model_internal function setterListenerB1(value:flash.events.Event):void
    {
        _model.invalidateDependentOnB1();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */
    

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.tcgIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_tcgValidationFailureMessages);
        }
        if (!_model.b3IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_b3ValidationFailureMessages);
        }
        if (!_model.b2IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_b2ValidationFailureMessages);
        }
        if (!_model.b5IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_b5ValidationFailureMessages);
        }
        if (!_model.b4IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_b4ValidationFailureMessages);
        }
        if (!_model.tcbIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_tcbValidationFailureMessages);
        }
        if (!_model.b7IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_b7ValidationFailureMessages);
        }
        if (!_model.sensorIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_sensorValidationFailureMessages);
        }
        if (!_model.tcwIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_tcwValidationFailureMessages);
        }
        if (!_model.b1IsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_b1ValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _RegionSpectralEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _RegionSpectralEntityMetadata) : void
    {
        var oldValue : _RegionSpectralEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfTcg : Array = null;
    model_internal var _doValidationLastValOfTcg : String;

    model_internal function _doValidationForTcg(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfTcg != null && model_internal::_doValidationLastValOfTcg == value)
           return model_internal::_doValidationCacheOfTcg ;

        _model.model_internal::_tcgIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTcgAvailable && _internal_tcg == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "tcg is required"));
        }

        model_internal::_doValidationCacheOfTcg = validationFailures;
        model_internal::_doValidationLastValOfTcg = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfB3 : Array = null;
    model_internal var _doValidationLastValOfB3 : String;

    model_internal function _doValidationForB3(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfB3 != null && model_internal::_doValidationLastValOfB3 == value)
           return model_internal::_doValidationCacheOfB3 ;

        _model.model_internal::_b3IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isB3Available && _internal_b3 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "b3 is required"));
        }

        model_internal::_doValidationCacheOfB3 = validationFailures;
        model_internal::_doValidationLastValOfB3 = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfB2 : Array = null;
    model_internal var _doValidationLastValOfB2 : String;

    model_internal function _doValidationForB2(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfB2 != null && model_internal::_doValidationLastValOfB2 == value)
           return model_internal::_doValidationCacheOfB2 ;

        _model.model_internal::_b2IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isB2Available && _internal_b2 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "b2 is required"));
        }

        model_internal::_doValidationCacheOfB2 = validationFailures;
        model_internal::_doValidationLastValOfB2 = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfB5 : Array = null;
    model_internal var _doValidationLastValOfB5 : String;

    model_internal function _doValidationForB5(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfB5 != null && model_internal::_doValidationLastValOfB5 == value)
           return model_internal::_doValidationCacheOfB5 ;

        _model.model_internal::_b5IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isB5Available && _internal_b5 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "b5 is required"));
        }

        model_internal::_doValidationCacheOfB5 = validationFailures;
        model_internal::_doValidationLastValOfB5 = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfB4 : Array = null;
    model_internal var _doValidationLastValOfB4 : String;

    model_internal function _doValidationForB4(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfB4 != null && model_internal::_doValidationLastValOfB4 == value)
           return model_internal::_doValidationCacheOfB4 ;

        _model.model_internal::_b4IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isB4Available && _internal_b4 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "b4 is required"));
        }

        model_internal::_doValidationCacheOfB4 = validationFailures;
        model_internal::_doValidationLastValOfB4 = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfTcb : Array = null;
    model_internal var _doValidationLastValOfTcb : String;

    model_internal function _doValidationForTcb(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfTcb != null && model_internal::_doValidationLastValOfTcb == value)
           return model_internal::_doValidationCacheOfTcb ;

        _model.model_internal::_tcbIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTcbAvailable && _internal_tcb == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "tcb is required"));
        }

        model_internal::_doValidationCacheOfTcb = validationFailures;
        model_internal::_doValidationLastValOfTcb = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfB7 : Array = null;
    model_internal var _doValidationLastValOfB7 : String;

    model_internal function _doValidationForB7(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfB7 != null && model_internal::_doValidationLastValOfB7 == value)
           return model_internal::_doValidationCacheOfB7 ;

        _model.model_internal::_b7IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isB7Available && _internal_b7 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "b7 is required"));
        }

        model_internal::_doValidationCacheOfB7 = validationFailures;
        model_internal::_doValidationLastValOfB7 = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfSensor : Array = null;
    model_internal var _doValidationLastValOfSensor : String;

    model_internal function _doValidationForSensor(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfSensor != null && model_internal::_doValidationLastValOfSensor == value)
           return model_internal::_doValidationCacheOfSensor ;

        _model.model_internal::_sensorIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isSensorAvailable && _internal_sensor == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "sensor is required"));
        }

        model_internal::_doValidationCacheOfSensor = validationFailures;
        model_internal::_doValidationLastValOfSensor = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfTcw : Array = null;
    model_internal var _doValidationLastValOfTcw : String;

    model_internal function _doValidationForTcw(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfTcw != null && model_internal::_doValidationLastValOfTcw == value)
           return model_internal::_doValidationCacheOfTcw ;

        _model.model_internal::_tcwIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTcwAvailable && _internal_tcw == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "tcw is required"));
        }

        model_internal::_doValidationCacheOfTcw = validationFailures;
        model_internal::_doValidationLastValOfTcw = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfB1 : Array = null;
    model_internal var _doValidationLastValOfB1 : String;

    model_internal function _doValidationForB1(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfB1 != null && model_internal::_doValidationLastValOfB1 == value)
           return model_internal::_doValidationCacheOfB1 ;

        _model.model_internal::_b1IsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isB1Available && _internal_b1 == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "b1 is required"));
        }

        model_internal::_doValidationCacheOfB1 = validationFailures;
        model_internal::_doValidationLastValOfB1 = value;

        return validationFailures;
    }
    

}

}
