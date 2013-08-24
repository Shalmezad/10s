package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GameState extends FlxState
	{
		override public function create():void
		{
			add(new FlxText(20, 20, 200, "Test"));
		}
	}

}