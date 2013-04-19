/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - PlotComments.as.
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
public class _Super_PlotComments extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _PlotCommentsEntityMetadata;
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
    private var _internal_tsa : int;
    private var _internal_interpreter : int;
    private var _internal_plotid : int;
    private var _internal_project_id : int;
    private var _internal_is_example : int;
    private var _internal_is_wetland : int;
    private var _internal_comment : String;
    private var _internal_uncertainty : int;
    private var _internal_is_complete : int;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_PlotComments()
    {
        _model = new _PlotCommentsEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "comment", model_internal::setterListenerComment));

    }

    /**
     * data/source property getters
     */

    [Bindable(event="propertyChange")]
    public function get tsa() : int
    {
        return _internal_tsa;
    }

    [Bindable(event="propertyChange")]
    public function get interpreter() : int
    {
        return _internal_interpreter;
    }

    [Bindable(event="propertyChange")]
    public function get plotid() : int
    {
        return _internal_plotid;
    }

    [Bindable(event="propertyChange")]
    public function get project_id() : int
    {
        return _internal_project_id;
    }

    [Bindable(event="propertyChange")]
    public function get is_example() : int
    {
        return _internal_is_example;
    }

    [Bindable(event="propertyChange")]
    public function get is_wetland() : int
    {
        return _internal_is_wetland;
    }

    [Bindable(event="propertyChange")]
    public function get comment() : String
    {
        return _internal_comment;
    }

    [Bindable(event="propertyChange")]
    public function get uncertainty() : int
    {
        return _internal_uncertainty;
    }

    [Bindable(event="propertyChange")]
    public function get is_complete() : int
    {
        return _internal_is_complete;
    }

    public function clearAssociations() : void
    {
    }

    /**
     * data/source property setters
     */

    public function set tsa(value:int) : void
    {
        var oldValue:int = _internal_tsa;
        if (oldValue !== value)
        {
            _internal_tsa = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "tsa", oldValue, _internal_tsa));
        }
    }

    public function set interpreter(value:int) : void
    {
        var oldValue:int = _internal_interpreter;
        if (oldValue !== value)
        {
            _internal_interpreter = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "interpreter", oldValue, _internal_interpreter));
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

    public function set project_id(value:int) : void
    {
        var oldValue:int = _internal_project_id;
        if (oldValue !== value)
        {
            _internal_project_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "project_id", oldValue, _internal_project_id));
        }
    }

    public function set is_example(value:int) : void
    {
        var oldValue:int = _internal_is_example;
        if (oldValue !== value)
        {
            _internal_is_example = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "is_example", oldValue, _internal_is_example));
        }
    }

    public function set is_wetland(value:int) : void
    {
        var oldValue:int = _internal_is_wetland;
        if (oldValue !== value)
        {
            _internal_is_wetland = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "is_wetland", oldValue, _internal_is_wetland));
        }
    }

    public function set comment(value:String) : void
    {
        var oldValue:String = _internal_comment;
        if (oldValue !== value)
        {
            _internal_comment = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "comment", oldValue, _internal_comment));
        }
    }

    public function set uncertainty(value:int) : void
    {
        var oldValue:int = _internal_uncertainty;
        if (oldValue !== value)
        {
            _internal_uncertainty = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "uncertainty", oldValue, _internal_uncertainty));
        }
    }

    public function set is_complete(value:int) : void
    {
        var oldValue:int = _internal_is_complete;
        if (oldValue !== value)
        {
            _internal_is_complete = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "is_complete", oldValue, _internal_is_complete));
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

    model_internal function setterListenerComment(value:flash.events.Event):void
    {
        _model.invalidateDependentOnComment();
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
        if (!_model.commentIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_commentValidationFailureMessages);
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
    public function get _model() : _PlotCommentsEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _PlotCommentsEntityMetadata) : void
    {
        var oldValue : _PlotCommentsEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfComment : Array = null;
    model_internal var _doValidationLastValOfComment : String;

    model_internal function _doValidationForComment(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfComment != null && model_internal::_doValidationLastValOfComment == value)
           return model_internal::_doValidationCacheOfComment ;

        _model.model_internal::_commentIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCommentAvailable && _internal_comment == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "comment is required"));
        }

        model_internal::_doValidationCacheOfComment = validationFailures;
        model_internal::_doValidationLastValOfComment = value;

        return validationFailures;
    }
    

}

}
