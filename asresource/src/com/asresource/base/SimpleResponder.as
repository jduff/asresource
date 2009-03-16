package com.asresource.base
{
	import mx.rpc.IResponder;

	public class SimpleResponder implements IResponder
	{
		private var _object:Object;
		private var _success:Function;
		private var _failure:Function;
		
		public function SimpleResponder(object:Object, onSuccess:Function=null, onFailure:Function=null)
		{
			_object = object;
			_success = onSuccess;
			_failure = onFailure;
		}

		public function result(event:Object):void
		{
			//TODO: Check for errors
			
			// map resulting data to the object
			var result:Object = XMLHandler.decode(_object, XML(event.result));
			
			// fire success callback with the object
			if (_success != null)
				(_success as Function)(result);
		}
		
		public function fault(info:Object):void
		{

		}
		
	}
}