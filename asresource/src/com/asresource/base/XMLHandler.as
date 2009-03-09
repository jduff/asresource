package com.asresource.base
{
	public class XMLHandler
	{
			
		public static function encode():void {
			
		}
		
		public static function decode(object:Resource, data:XML):void {
			object.meta.variables.forEach(function(elm:String, ...rest):void{
				var sanitised:String = elm.replace("_", "-");
				if(data.child(sanitised).length()!=0)
					this[elm] = data.child(sanitised)[0].toString();
			}, object)
		}

	}
}