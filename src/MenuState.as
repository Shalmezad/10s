package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class MenuState extends FlxState
	{
		
		public function MenuState() 
		{
		}
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			add(new FlxText(20, 20, 200, "Press 'Jump'"));
			add(new FlxText(20, 50, 200, "Controls: WASD or arrows. Can use space to jump"));
			
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.UP || FlxG.keys.SPACE || FlxG.keys.W) {
				startGame();
			}
		}
		public function startGame():void
		{
			GUI.score = 0;
			FlxG.switchState(new GameState(1));
		}
	}

}