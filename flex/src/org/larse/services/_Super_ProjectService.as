/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - ProjectService.as.
 */
package org.larse.services
{
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper;
import com.adobe.serializers.utility.TypeUtility;
import mx.rpc.AbstractOperation;
import mx.rpc.AsyncToken;
import mx.rpc.remoting.Operation;
import mx.rpc.remoting.RemoteObject;
import org.larse.vos.Project;
import org.larse.vos.ProjectTsa;
import org.larse.vos.TimeSyncTask;

import mx.collections.ItemResponder;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

[ExcludeClass]
internal class _Super_ProjectService extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{

    // Constructor
    public function _Super_ProjectService()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();

        // initialize RemoteClass alias for all entities returned by functions of this service
        org.larse.vos.Project._initRemoteClassAlias();
        org.larse.vos.ProjectTsa._initRemoteClassAlias();
        org.larse.vos.TimeSyncTask._initRemoteClassAlias();

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "getAllProject");
        operation.resultElementType = org.larse.vos.Project;
        operations["getAllProject"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "createProject");
        operation.resultType = int;
        operations["createProject"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "updateProject");
        operations["updateProject"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "addProjectTsa");
        operations["addProjectTsa"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getProjectTsa");
        operation.resultElementType = org.larse.vos.ProjectTsa;
        operations["getProjectTsa"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "assignInterpreter");
        operations["assignInterpreter"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getUserTasks");
        operation.resultElementType = org.larse.vos.TimeSyncTask;
        operations["getUserTasks"] = operation;

        _serviceControl.operations = operations;
        _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "ProjectService";
        _serviceControl.endpoint = "gateway.php";


         preInitializeService();
         model_internal::initialize();
    }
    
    //init initialization routine here, child class to override
    protected function preInitializeService():void
    {
        destination = "ProjectService";
      
    }
    

    /**
      * This method is a generated wrapper used to call the 'getAllProject' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getAllProject() : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getAllProject");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send() ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'createProject' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function createProject(project:org.larse.vos.Project) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("createProject");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'updateProject' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function updateProject(project:org.larse.vos.Project) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("updateProject");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'addProjectTsa' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function addProjectTsa(project_id:int, tsa:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("addProjectTsa");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id,tsa) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getProjectTsa' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getProjectTsa(project_id:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getProjectTsa");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'assignInterpreter' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function assignInterpreter(project_id:int, tsa:int, interpreter:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("assignInterpreter");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id,tsa,interpreter) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getUserTasks' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getUserTasks(interpreter:int, role:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getUserTasks");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(interpreter,role) ;
        return _internal_token;
    }
     
}

}
