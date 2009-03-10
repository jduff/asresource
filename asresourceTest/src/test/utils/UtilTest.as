package test.utils
{
	import com.utils.Util;
	
	import examples.Project;
	import examples.User;
	
	import flexunit.framework.TestCase;
	
	public class UtilTest extends TestCase
	{
		public function testUrlForWithObjectId():void {
			var project:Project = new Project();
			project.id = "1";
			assertEquals("projects/1.xml", Util.urlFor(project));
			
			var user:User = new User();
			user.id = "3";
			assertEquals("users/3.xml", Util.urlFor(user));
		}
		
		public function testUrlForWithoutObjectId():void {
			var project:Project = new Project();
			assertEquals("projects.xml", Util.urlFor(project));
			
			var user:User = new User();
			assertEquals("users.xml", Util.urlFor(user));
		}

	}
}