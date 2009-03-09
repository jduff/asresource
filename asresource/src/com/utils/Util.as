package com.utils
{
	import com.asresource.base.Resource;
	
	public class Util
	{
		public function Util()
		{
		}
		
		public static function urlFor(object:Resource):String {
			var url:String = object.meta.classNamePluralized;
			if(object.id != null)
				url = url + "/" + object.id;
			return url + ".xml";
		}

	}
}