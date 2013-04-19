/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - SpectralProperty.as.
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
public class _Super_SpectralProperty extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _SpectralPropertyEntityMetadata;
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
    private var _internal_spectral_id : int;
    private var _internal_spectral_std : Number = Number(0);
    private var _internal_spectral_mean : Number = Number(0);
    private var _internal_spectral_max : Number = Number(0);
    private var _internal_spectral_min : Number = Number(0);
    private var _internal_spectral_name : String;

    private static var emptyArray:Array = new Array();

    // Change this value according to your application's floating-point precision
    private static var epsilon:Number = 0.0001;

    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_SpectralProperty()
    {
        _model = new _SpectralPropertyEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "spectral_name", model_internal::setterListenerSpectral_name));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get spectral_id() : int
    {
        return _internal_spectral_id;
    }

    [Bindable(event="propertyChange")]
    public function get spectral_std() : Number
    {
        return _internal_spectral_std;
    }

    [Bindable(event="propertyChange")]
    public function get spectral_mean() : Number
    {
        return _internal_spectral_mean;
    }

    [Bindable(event="propertyChange")]
    public function get spectral_max() : Number
    {
        return _internal_spectral_max;
    }

    [Bindable(event="propertyChange")]
    public function get spectral_min() : Number
    {
        return _internal_spectral_min;
    }

    [Bindable(event="propertyChange")]
    public function get spectral_name() : String
    {
        return _internal_spectral_name;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set spectral_id(value:int) : void
    {
        var oldValue:int = _internal_spectral_id;
        if (oldValue !== value)
        {
            _internal_spectral_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_id", oldValue, _internal_spectral_id));
        }
    }

    public function set spectral_std(value:Number) : void
    {
        var oldValue:Number = _internal_spectral_std;
        if (isNaN(_internal_spectral_std) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_spectral_std = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_std", oldValue, _internal_spectral_std));
        }
    }

    public function set spectral_mean(value:Number) : void
    {
        var oldValue:Number = _internal_spectral_mean;
        if (isNaN(_internal_spectral_mean) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_spectral_mean = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_mean", oldValue, _internal_spectral_mean));
        }
    }

    public function set spectral_max(value:Number) : void
    {
        var oldValue:Number = _internal_spectral_max;
        if (isNaN(_internal_spectral_max) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_spectral_max = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_max", oldValue, _internal_spectral_max));
        }
    }

    public function set spectral_min(value:Number) : void
    {
        var oldValue:Number = _internal_spectral_min;
        if (isNaN(_internal_spectral_min) == true || Math.abs(oldValue - value) > epsilon)
        {
            _internal_spectral_min = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_min", oldValue, _internal_spectral_min));
        }
    }

    public function set spectral_name(value:String) : void
    {
        var oldValue:String = _internal_spectral_name;
        if (oldValue !== value)
        {
            _internal_spectral_name = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "spectral_name", oldValue, _internal_spectral_name));
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

    model_internal function setterListenerSpectral_name(value:flash.events.Event):void
    {
        _model.invalidateDependentOnSpectral_name();
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
        if (!_model.spectral_nameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_spectral_nameValidationFailureMessages);
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
    public function get _model() : _SpectralPropertyEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _SpectralPropertyEntityMetadata) : void
    {
        var oldValue : _SpectralPropertyEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfSpectral_name : Array = null;
    model_internal var _doValidationLastValOfSpectral_name : String;

    model_internal function _doValidationForSpectral_name(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfSpectral_name != null && model_internal::_doValidationLastValOfSpectral_name == value)
           return model_internal::_doValidationCacheOfSpectral_name ;

        _model.model_internal::_spectral_nameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isSpectral_nameAvailable && _internal_spectral_name == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "spectral_name is required"));
        }

        model_internal::_doValidationCacheOfSpectral_name = validationFailures;
        model_internal::_doValidationLastValOfSpectral_name = value;

        return validationFailures;
    }
    

}

}
