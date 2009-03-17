package com.asresource.base
{	
	public class Resource
	{
		private var _isReady:Boolean = false;
		
		public var id:String;
		
		public function Resource()
		{
		}
		
		public function save(onSuccess:Function=null, onFailure:Function=null):void {}
		
		public function create(onSuccess:Function=null, onFailure:Function=null):void {}
		
		public function destroy(onSuccess:Function=null, onFailure:Function=null):void {}
		
		public function update(onSuccess:Function=null, onFailure:Function=null):void {}
		
		
		public function find(onSuccess:Function=null, onFailure:Function=null):void {
			Controller.inst.service.show(this, onSuccess, onFailure);
		}
		
		public static function list(obj:Class, onSuccess:Function=null, onFailure:Function=null):void {
			return Controller.inst.service.list(obj, onSuccess, onFailure);
		}
		
		public static function invoke(resource:Resource, path:String, params:Object):void {
		}

	}
}