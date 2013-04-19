/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this service wrapper you may modify the generated sub-class of this class - RegionSpectralService.as.
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
import org.larse.vos.RegionSpectral;

import mx.collections.ItemResponder;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

[ExcludeClass]
internal class _Super_RegionSpectralService extends com.adobe.fiber.services.wrapper.RemoteObjectServiceWrapper
{

    // Constructor
    public function _Super_RegionSpectralService()
    {
        // initialize service control
        _serviceControl = new mx.rpc.remoting.RemoteObject();

        // initialize RemoteClass alias for all entities returned by functions of this service
        org.larse.vos.RegionSpectral._initRemoteClassAlias();

        var operations:Object = new Object();
        var operation:mx.rpc.remoting.Operation;

        operation = new mx.rpc.remoting.Operation(null, "getRegionSpectralByPlot");
        operation.resultElementType = org.larse.vos.RegionSpectral;
        operations["getRegionSpectralByPlot"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getAllRegionSpectralByPlot");
        operation.resultElementType = org.larse.vos.RegionSpectral;
        operations["getAllRegionSpectralByPlot"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "overrideImagePriority");
        operation.resultType = int;
        operations["overrideImagePriority"] = operation;
        operation = new mx.rpc.remoting.Operation(null, "getAllRegionSpectralByPlotForYear");
        operation.resultElementType = org.larse.vos.RegionSpectral;
        operations["getAllRegionSpectralByPlotForYear"] = operation;

        _serviceControl.operations = operations;
        _serviceControl.convertResultHandler = com.adobe.serializers.utility.TypeUtility.convertResultHandler;
        _serviceControl.source = "RegionSpectralService";
        _serviceControl.endpoint = "gateway.php";


         preInitializeService();
         model_internal::initialize();
    }
    
    //init initialization routine here, child class to override
    protected function preInitializeService():void
    {
        destination = "RegionSpectralService";
      
    }
    

    /**
      * This method is a generated wrapper used to call the 'getRegionSpectralByPlot' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getRegionSpectralByPlot(project_id:int, tsa:int, plotid:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getRegionSpectralByPlot");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id,tsa,plotid) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getAllRegionSpectralByPlot' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getAllRegionSpectralByPlot(project_id:int, tsa:int, plotid:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getAllRegionSpectralByPlot");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id,tsa,plotid) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'overrideImagePriority' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function overrideImagePriority(project_id:int, tsa:int, plotid:int, year:int, day:int, oldYear:int, oldDay:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("overrideImagePriority");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id,tsa,plotid,year,day,oldYear,oldDay) ;
        return _internal_token;
    }
     
    /**
      * This method is a generated wrapper used to call the 'getAllRegionSpectralByPlotForYear' operation. It returns an mx.rpc.AsyncToken whose
      * result property will be populated with the result of the operation when the server response is received.
      * To use this result from MXML code, define a CallResponder component and assign its token property to this method's return value.
      * You can then bind to CallResponder.lastResult or listen for the CallResponder.result or fault events.
      *
      * @see mx.rpc.AsyncToken
      * @see mx.rpc.CallResponder 
      *
      * @return an mx.rpc.AsyncToken whose result property will be populated with the result of the operation when the server response is received.
      */
    public function getAllRegionSpectralByPlotForYear(project_id:int, tsa:int, plotid:int, year:int) : mx.rpc.AsyncToken
    {
        var _internal_operation:mx.rpc.AbstractOperation = _serviceControl.getOperation("getAllRegionSpectralByPlotForYear");
        var _internal_token:mx.rpc.AsyncToken = _internal_operation.send(project_id,tsa,plotid,year) ;
        return _internal_token;
    }
     
}

}
