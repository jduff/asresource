package com.asresource.mocks
{
	import com.asresource.base.Resource;
	import com.asresource.base.SimpleResponder;
	import com.asresource.base.XMLService;
	import com.utils.Metadata;
	
	import flash.utils.Dictionary;
	
	import mx.rpc.events.ResultEvent;
	
	public class MockXMLService extends XMLService
	{
		protected var data:Dictionary = new Dictionary();

		public function loadData(dataSets:Object = null):void {
			for (var dataSetName:String in dataSets) {
				dataSets[dataSetName];
        		data[dataSetName] = dataSets[dataSetName];
			}  
		}
		
		protected function lookup(object:Object):XML {
			var meta:Metadata = Metadata.getMeta(object);
			if(object is Class)
				return XML(data[meta.classNamePluralized]);
			else
				return XML(data[meta.classNamePluralized][meta.className].(id==object.id));
		}
		
		public override function show(object:Resource, onSuccess:Function=null, onFailure:Function=null):void {
			new SimpleResponder(object, onSuccess, onFailure).result(new ResultEvent(ResultEvent.RESULT, false, false, lookup(object)));
		}
		
		public override function list(object:Class, onSuccess:Function=null, onFailure:Function=null):void{
			new SimpleResponder(object, onSuccess, onFailure).result(new ResultEvent(ResultEvent.RESULT, false, false, lookup(object)));
		}

	}
}