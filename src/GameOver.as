package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GameOver extends FlxState
	{
		private var tick:int = 0;
		public function GameOver(win:Boolean = false) 
		{
			if (win) {
				add(new FlxText(20, 20, 200, "You win!"));
			}
			else {
				add(new FlxText(20, 20, 200, "GAME OVER"));
			}
			
			add(new FlxText(20, 40, 200, "Final score: " + GUI.score));
		}
		override public function update() :void
		{
			tick++;
			if (tick > 300) {
				FlxG.switchState(new MenuState());
			}
		}
		
	}

}