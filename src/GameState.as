package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GameState extends FlxState
	{
		private var map:LevelMap;
		private var player:Player;
		private var gui:GUI;
		private var timeLeft:Number = 10;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			
			map = new LevelMap(1);
			add(map);
			
			player = new Player();
			add(player);
			gui = new GUI();
			add(gui);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(map, player);
			timeLeft -= FlxG.elapsed;
			gui.setTimeLeft(timeLeft);
			if (timeLeft <= 0 && player.alive) {
				player.kill();
				add(new Explosion(player.x, player.y));
			}
			if (timeLeft < -3) {
				FlxG.switchState(new GameState());
			}
		}
	}

}