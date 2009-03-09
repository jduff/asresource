package com.asresource.base
{
	import com.utils.Metadata;
	
	public class Resource
	{
		private var _metadata:Metadata;
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
		
		public static function list(resource:Resource):void {}
		
		public static function invoke(resource:Resource, path:String, params:Object):void {
		}
		
		public function get meta():Metadata {
			if(_metadata==null)
				_metadata = new Metadata(this);
			return _metadata;
		}

	}
}