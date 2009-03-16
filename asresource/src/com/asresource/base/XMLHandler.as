package com.asresource.base
{
	import com.utils.Metadata;
	
	public class XMLHandler
	{
			
		public static function encode():void {
			
		}
		
		public static function decode(object:Object, data:XML):Object {
			if(object is Class){
				return parseObjectArray(object as Class, data);
			}
			else {
				return parseObject(object,data);
			}
		}
		
		private static function parseObject(object:Object, data:XML):Object {
			Metadata.getMeta(object).variables.forEach(function(elm:String, ...rest):void{
				var sanitised:String = elm.replace("_", "-");
				if(data.child(sanitised).length()!=0)
					this[elm] = data.child(sanitised)[0].toString();
			}, object)
			return object;
		}
		
		private static function parseObjectArray(object:Class, data:XML):Array {
			var objects:XMLList = data[Metadata.getMeta(object).className];
			var arr:Array = new Array();
			for(var i:int = 0; i < objects.length(); i++) {
				arr.push(parseObject(new object(), XML(objects[i])));
			}
			return arr;
		}

	}
}