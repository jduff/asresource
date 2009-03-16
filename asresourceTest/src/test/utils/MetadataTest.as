package test.utils
{
	import com.asresource.base.Controller;
	import com.asresource.base.Resource;
	import com.utils.Metadata;
	
	import examples.Project;
	
	import flexunit.framework.TestCase;
	
	public class MetadataTest extends TestCase
	{
		public function testProjectMetadata():void
		{
			var data:Metadata = new Metadata(new Project());
			
			assertTrue(data.variables.indexOf("name")!=-1);
			assertTrue(data.variables.indexOf("id")!=-1);
			
			assertEquals(data.className, "project");
			assertEquals(data.classNamePluralized, "projects");
			assertTrue(data.extendsClass("Resource"));
		}
		
		public function testProjectClassMetadata():void
		{
			var data:Metadata = new Metadata(Project);
			
			assertTrue(data.variables.indexOf("name")!=-1);
			assertEquals(data.classNamePluralized, "projects");
			assertTrue(data.extendsClass("Resource"));
			assertTrue(!data.extendsClass("Test"));
		}
	}
}