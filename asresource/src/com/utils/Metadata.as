package com.utils
{
	import flash.utils.describeType;
	
	public class Metadata
	{
		private var _variables:Array = new Array();
		private var _className:String;
		
		public function Metadata(object:Object)
		{
			var data:XML = describeType(object);
			
			_className = String(data.@name).toLowerCase().split(':').pop();
			
			var variables:XMLList = data.variable;
			for(var i:int = 0; i < variables.length(); i++) {
				 _variables.push(String(variables[i].@name));
			}
		}
		
		public function get className():String {
			return _className;
		}
		
		public function get classNamePluralized():String {
			return Inflector.pluralize(_className);
		}
		
		public function get variables():Array {
			return _variables;
		}
	}
}