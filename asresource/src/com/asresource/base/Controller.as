package com.asresource.base
{
	import com.asresource.base.XMLService;
	public class Controller
	{
		private var _base_url:String;
		
		private var _service:IService;
		
		private static var _instance:Controller = null;
		
		public function Controller(enforcer:SingletonEnforcer, url:String, service:IService) {
			_base_url = url;
			_service = service;
		}
		
		public static function initialize(url:String="http://localhost:3000/", serviceProvider:Class=null):void {
			if(serviceProvider == null)
				serviceProvider = XMLService;
			_instance = new Controller(new SingletonEnforcer, url, new serviceProvider());
		}
		
		public static function get inst():Controller {
			if(_instance == null) initialize();
			return _instance;
		}
		
		public function get base_url():String {
			return _base_url;
		}
		
		public function get service():IService {
			return _service;
		}

	}
}

class SingletonEnforcer {}