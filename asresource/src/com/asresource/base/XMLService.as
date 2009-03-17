package com.asresource.base
{
	import com.utils.Util;
	
	import flash.net.URLRequestMethod;
	import flash.utils.Dictionary;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.http.HTTPService;
	
	public class XMLService implements IService
	{		
		public function show(object:Resource, onSuccess:Function=null, onFailure:Function=null):void {
			var service:HTTPService = getHTTPService(object, URLRequestMethod.GET);

			var token:AsyncToken = service.send();
			token.addResponder(new SimpleResponder(object, onSuccess, onFailure));
		}
		
		public function create():void{}
		public function update():void{}
		public function destroy():void{}
		
		public function invoke():void{}
		public function list(object:Class, onSuccess:Function=null, onFailure:Function=null):void{
			var service:HTTPService = getHTTPService(object, URLRequestMethod.GET);
			
			var token:AsyncToken = service.send();
			token.addResponder(new SimpleResponder(object, onSuccess, onFailure));
		}
		
		
		protected function getHTTPService(object:Object, method:String):HTTPService {
			var httpService:HTTPService = new HTTPService();
			httpService.addEventListener(ResultEvent.RESULT, onHttpResult);
			
			httpService.contentType = HTTPService.CONTENT_TYPE_XML;
			httpService.method = (method == URLRequestMethod.GET) ? URLRequestMethod.GET : URLRequestMethod.POST;
      		httpService.headers = {'X-HTTP-Method-Override': method};
      		httpService.request["_method"] = method;
			httpService.url = Controller.inst.base_url + Util.urlFor(object);
			return httpService;
		}
		
		protected function onHttpResult(event:ResultEvent):void {
			if (event.currentTarget is HTTPService) {
				var service:HTTPService = HTTPService(event.currentTarget);
				service.disconnect();
				service.removeEventListener(ResultEvent.RESULT, onHttpResult);
			}
		}

	}
}