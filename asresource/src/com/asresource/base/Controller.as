package com.asresource.base
{
	import com.asresource.base.XMLService;
	public class Controller
	{
		private var _base_url:String;
		
		private var _service:IService;
		
		private var _username:String;
		private var _password:String;
		
		private static var _instance:Controller = null;
		
		public function Controller(enforcer:SingletonEnforcer, url:String, service:IService) {
			_base_url = url;
			_service = service;
		}
		
		public static function initialize(url:String="localhost:3000/", serviceProvider:Class=null):void {
			if(serviceProvider == null)
				serviceProvider = XMLService;
			_instance = new Controller(new SingletonEnforcer, url, new serviceProvider());
		}
		
		public static function get inst():Controller {
			if(_instance == null) initialize();
			return _instance;
		}
		
		public function get base_url():String {
			var url:String = "http://";
			if(_username != null && _password != null)
				url += _username + ":" + _password + "@";
			return url + _base_url.replace("http://", "");
		}
		
		public function get service():IService {
			return _service;
		}
		
		public function basicAuth(username:String=null, password:String=null):void {
			_username = username;
			_password = password;
		}

	}
}

class SingletonEnforcer {}