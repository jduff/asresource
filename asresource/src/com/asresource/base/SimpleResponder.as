package com.asresource.base
{
	import mx.rpc.IResponder;
	import mx.rpc.events.ResultEvent;

	public class SimpleResponder implements IResponder
	{
		private var _object:Resource;
		private var _success:Function;
		private var _failure:Function;
		
		public function SimpleResponder(object:Resource, onSuccess:Function=null, onFailure:Function=null)
		{
			_object = object;
			_success = onSuccess;
			_failure = onFailure;
		}

		public function result(event:Object):void
		{
			//TODO: Check for errors
			
			// map resulting data to the object
			XMLHandler.decode(_object, XML(event.result));
			
			// fire success callback with the object
			if (_success != null)
				(_success as Function)(_object);
		}
		
		public function fault(info:Object):void
		{

		}
		
	}
}