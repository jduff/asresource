package com.utils
{
	import flash.utils.describeType;
	
	public class Metadata
	{
		private var _variables:Array = new Array();
		private var _className:String;
		private var _extendsClasses:Array = new Array();
		
		public function Metadata(object:Object)
		{
			var data:XML = describeType(object);
			
			_className = String(data.@name).toLowerCase().split(':').pop();
			
			if(data.factory.length()>0)
				data = XMLList(data.factory)[0];
				
			var variables:XMLList = data.variable;
			for(var i:int = 0; i < variables.length(); i++) {
				 _variables.push(String(variables[i].@name));
			}
			
			var classes:XMLList = data.extendsClass;
			for(var x:int = 0; x < classes.length(); x++) {
				 _extendsClasses.push(String(classes[x].@type).split(':').pop());
			}
		}
		
		public function get className():String {
			return _className;
		}
		
		public function get extendsClasses():Array {
			return _extendsClasses;
		}
		
		public function extendsClass(className:String):Boolean {
			for each (var name:* in extendsClasses) {
				if(name == className)
					return true;
			}
			return false;
		}
		
		public function get classNamePluralized():String {
			return Inflector.pluralize(_className);
		}
		
		public function get variables():Array {
			return _variables;
		}
		
		public static function getMeta(object:Object):Metadata {
			//TODO: Need to cache the metadata
			return new Metadata(object);
		}
	}
}