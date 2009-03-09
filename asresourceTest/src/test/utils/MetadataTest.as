package test.utils
{
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
		}
	}
}