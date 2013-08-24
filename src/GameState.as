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
			add(new Player());
		}
		
		
		override public function update():void
		{
			super.update();
		}
	}

}