/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Neighbor.as.
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
public class _Super_Neighbor extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
    }

    model_internal var _dminternal_model : _NeighborEntityMetadata;
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
    private var _internal_image_julday : int;
    private var _internal_plotid : int;
    private var _internal_neighbor_id : int;
    private var _internal_change_process : String;
    private var _internal_patch_size : String;
    private var _internal_interpreter : int;
    private var _internal_image_year : int;
    private var _internal_relative_magnitude : String;
    private var _internal_project_id : int;
    private var _internal_centroid_direction : int;
    private var _internal_plot_included : int;
    private var _internal_comments : String;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Neighbor()
    {
        _model = new _NeighborEntityMetadata(this);

        // Bind to own data or source properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "change_process", model_internal::setterListenerChange_process));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "patch_size", model_internal::setterListenerPatch_size));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "relative_magnitude", model_internal::setterListenerRelative_magnitude));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "comments", model_internal::setterListenerComments));

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
    public function get neighbor_id() : int
    {
        return _internal_neighbor_id;
    }

    [Bindable(event="propertyChange")]
    public function get change_process() : String
    {
        return _internal_change_process;
    }

    [Bindable(event="propertyChange")]
    public function get patch_size() : String
    {
        return _internal_patch_size;
    }

    [Bindable(event="propertyChange")]
    public function get interpreter() : int
    {
        return _internal_interpreter;
    }

    [Bindable(event="propertyChange")]
    public function get image_year() : int
    {
        return _internal_image_year;
    }

    [Bindable(event="propertyChange")]
    public function get relative_magnitude() : String
    {
        return _internal_relative_magnitude;
    }

    [Bindable(event="propertyChange")]
    public function get project_id() : int
    {
        return _internal_project_id;
    }

    [Bindable(event="propertyChange")]
    public function get centroid_direction() : int
    {
        return _internal_centroid_direction;
    }

    [Bindable(event="propertyChange")]
    public function get plot_included() : int
    {
        return _internal_plot_included;
    }

    [Bindable(event="propertyChange")]
    public function get comments() : String
    {
        return _internal_comments;
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

    public function set neighbor_id(value:int) : void
    {
        var oldValue:int = _internal_neighbor_id;
        if (oldValue !== value)
        {
            _internal_neighbor_id = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "neighbor_id", oldValue, _internal_neighbor_id));
        }
    }

    public function set change_process(value:String) : void
    {
        var oldValue:String = _internal_change_process;
        if (oldValue !== value)
        {
            _internal_change_process = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "change_process", oldValue, _internal_change_process));
        }
    }

    public function set patch_size(value:String) : void
    {
        var oldValue:String = _internal_patch_size;
        if (oldValue !== value)
        {
            _internal_patch_size = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "patch_size", oldValue, _internal_patch_size));
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

    public function set image_year(value:int) : void
    {
        var oldValue:int = _internal_image_year;
        if (oldValue !== value)
        {
            _internal_image_year = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "image_year", oldValue, _internal_image_year));
        }
    }

    public function set relative_magnitude(value:String) : void
    {
        var oldValue:String = _internal_relative_magnitude;
        if (oldValue !== value)
        {
            _internal_relative_magnitude = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "relative_magnitude", oldValue, _internal_relative_magnitude));
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

    public function set centroid_direction(value:int) : void
    {
        var oldValue:int = _internal_centroid_direction;
        if (oldValue !== value)
        {
            _internal_centroid_direction = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "centroid_direction", oldValue, _internal_centroid_direction));
        }
    }

    public function set plot_included(value:int) : void
    {
        var oldValue:int = _internal_plot_included;
        if (oldValue !== value)
        {
            _internal_plot_included = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "plot_included", oldValue, _internal_plot_included));
        }
    }

    public function set comments(value:String) : void
    {
        var oldValue:String = _internal_comments;
        if (oldValue !== value)
        {
            _internal_comments = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "comments", oldValue, _internal_comments));
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

    model_internal function setterListenerChange_process(value:flash.events.Event):void
    {
        _model.invalidateDependentOnChange_process();
    }

    model_internal function setterListenerPatch_size(value:flash.events.Event):void
    {
        _model.invalidateDependentOnPatch_size();
    }

    model_internal function setterListenerRelative_magnitude(value:flash.events.Event):void
    {
        _model.invalidateDependentOnRelative_magnitude();
    }

    model_internal function setterListenerComments(value:flash.events.Event):void
    {
        _model.invalidateDependentOnComments();
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
        if (!_model.change_processIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_change_processValidationFailureMessages);
        }
        if (!_model.patch_sizeIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_patch_sizeValidationFailureMessages);
        }
        if (!_model.relative_magnitudeIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_relative_magnitudeValidationFailureMessages);
        }
        if (!_model.commentsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_commentsValidationFailureMessages);
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
    public function get _model() : _NeighborEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _NeighborEntityMetadata) : void
    {
        var oldValue : _NeighborEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfChange_process : Array = null;
    model_internal var _doValidationLastValOfChange_process : String;

    model_internal function _doValidationForChange_process(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfChange_process != null && model_internal::_doValidationLastValOfChange_process == value)
           return model_internal::_doValidationCacheOfChange_process ;

        _model.model_internal::_change_processIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isChange_processAvailable && _internal_change_process == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "change_process is required"));
        }

        model_internal::_doValidationCacheOfChange_process = validationFailures;
        model_internal::_doValidationLastValOfChange_process = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfPatch_size : Array = null;
    model_internal var _doValidationLastValOfPatch_size : String;

    model_internal function _doValidationForPatch_size(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfPatch_size != null && model_internal::_doValidationLastValOfPatch_size == value)
           return model_internal::_doValidationCacheOfPatch_size ;

        _model.model_internal::_patch_sizeIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isPatch_sizeAvailable && _internal_patch_size == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "patch_size is required"));
        }

        model_internal::_doValidationCacheOfPatch_size = validationFailures;
        model_internal::_doValidationLastValOfPatch_size = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfRelative_magnitude : Array = null;
    model_internal var _doValidationLastValOfRelative_magnitude : String;

    model_internal function _doValidationForRelative_magnitude(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfRelative_magnitude != null && model_internal::_doValidationLastValOfRelative_magnitude == value)
           return model_internal::_doValidationCacheOfRelative_magnitude ;

        _model.model_internal::_relative_magnitudeIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isRelative_magnitudeAvailable && _internal_relative_magnitude == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "relative_magnitude is required"));
        }

        model_internal::_doValidationCacheOfRelative_magnitude = validationFailures;
        model_internal::_doValidationLastValOfRelative_magnitude = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfComments : Array = null;
    model_internal var _doValidationLastValOfComments : String;

    model_internal function _doValidationForComments(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfComments != null && model_internal::_doValidationLastValOfComments == value)
           return model_internal::_doValidationCacheOfComments ;

        _model.model_internal::_commentsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isCommentsAvailable && _internal_comments == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "comments is required"));
        }

        model_internal::_doValidationCacheOfComments = validationFailures;
        model_internal::_doValidationLastValOfComments = value;

        return validationFailures;
    }
    

}

}
