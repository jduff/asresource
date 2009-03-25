package test.asresource.base
{
	import com.asresource.base.Controller;
	import com.asresource.mocks.MockXMLService;
	
	import flexunit.framework.TestCase;
	
	public class ControllerTest extends TestCase
	{
		public function testBaseUrl():void
		{
			assertEquals("http://localhost:3000/",Controller.inst.base_url);
			
			Controller.inst.basicAuth("username", "password");
			
			assertEquals("http://username:password@localhost:3000/",Controller.inst.base_url);
			
			Controller.inst.basicAuth(null);
			
			assertEquals("http://localhost:3000/",Controller.inst.base_url);
		}

	}
}