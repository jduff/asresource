package com.asresource.base
{
	import com.utils.Metadata;
	
	public class XMLHandler
	{
		private var _metadata:Metadata;
		private var _variables:Array;
		
		function XMLHandler(metadata:Metadata) {
			_metadata = metadata;
			_variables = _metadata.variables;
		}
			
		public static function encode():void {
			
		}
		
		public static function decode(object:Object, data:XML):Object {
			var handler:XMLHandler = new XMLHandler(Metadata.getMeta(object));
			if(object is Class){
				return handler.parseObjectArray(object as Class, data);
			}
			else {
				return handler.parseObject(object, data);
			}
		}
		
		private function parseObject(object:Object, data:XML):Object {
			for(var i:int = 0; i < _variables.length; i++) {
				var sanitised:String = _variables[i].replace("_", "-");
				if(data.child(sanitised).length()!=0)
					object[_variables[i]] = data.child(sanitised)[0].toString();
			}
			return object;
		}
		
		private function parseObjectArray(object:Class, data:XML):Array {
			var objects:XMLList = data[_metadata.className];
			var arr:Array = new Array();
			for(var i:int = 0; i < objects.length(); i++) {
				arr.push(parseObject(new object(), XML(objects[i])));
			}
			return arr;
		}

	}
}