package test.asresource.example
{	
	import com.asresource.base.Resource;
	
	import examples.Project;
	
	import flexunit.framework.TestCase;
	
	public class ProjectTest extends TestCase
	{
		
		public function testFindingProject():void
		{
			var project:Project = new Project();
			project.id = "1";
			
			// check that the callback returns the righ data
			project.find(function(result:Project):void {
				assertEquals("expecting correct project name", "the project", result.name);
				assertEquals("expecting correct project id", "1", result.id);
				assertEquals("expecting correct created at date", "2009-01-15T17:14:27Z", result.created_at);
				
			});
			
			// make sure the object making the call is updated
			assertEquals("expecting correct project name", "the project", project.name);
			assertEquals("expecting correct project id", "1", project.id);
			assertEquals("expecting correct  created at date", "2009-01-15T17:14:27Z", project.created_at);
			
			// make sure adding a property that is not in the xml doesn't break the parsing
			assertEquals("expecting nothing be returned since it's not in the xml", null, project.local_variable);
		}
		
		public function testListingProjects():void {
			Resource.list(Project, function(projects:Array):void {
				assertEquals(4, projects.length);
				
				var project:Project = projects.shift();
				assertEquals("1", project.id);
				assertEquals("the project", project.name);
				
				project = projects.shift();
				assertEquals("2", project.id);
				assertEquals("another project", project.name);
				
			});
			
		}
		
		public function testSavingProject():void {
			var project:Project = new Project();
			project.name = "saved project";
			project.save(function(result:Project):void{
				assertEquals("5", project.id);
				assertEquals("saved project", project.name);
				assertEquals("", project.created_at);
			});
		}
		
	}
}