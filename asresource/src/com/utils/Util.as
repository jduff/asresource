package com.utils
{
	import com.asresource.base.Resource;
	
	public class Util
	{
		public function Util()
		{
		}
		
		public static function urlFor(object:Object):String {
			var url:String = Metadata.getMeta(object).classNamePluralized;
			if(object.id != null)
				url = url + "/" + object.id;
			return url + ".xml";
		}

	}
}