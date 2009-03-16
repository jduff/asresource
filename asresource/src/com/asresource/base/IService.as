package com.asresource.base
{
	public interface IService
	{
		function show(object:Resource, onSuccess:Function=null, onFailure:Function=null):void;
		function list(object:Class, onSuccess:Function=null, onFailure:Function=null):void;
		function create():void;
		function update():void;
		function destroy():void;
		
		function invoke():void;
	}
}