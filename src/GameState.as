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
		private var exits:FlxGroup;
		private var levelNum:int;
		
		public function GameState(level:int = 1) {
			levelNum = level;
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			
			map = new LevelMap(levelNum);
			add(map);
			
			loadExits();
			
			player = new Player();
			player.x = map.playerStart.x;
			player.y = map.playerStart.y;
			add(player);
			
			gui = new GUI();
			add(gui);
		}
		
		private function loadExits():void
		{
			exits = new FlxGroup();
			for (var a:int = 0; a < map.endPoints.length; a++) {
				var exitIndex:int = map.endPoints[a];
				var exitPoint:FlxPoint = new FlxPoint(exitIndex % map.widthInTiles, (int)(exitIndex / map.widthInTiles));
				var exit:FlxSprite = new FlxSprite(exitPoint.x * map.TILE_WIDTH, exitPoint.y * map.TILE_HEIGHT);
				exit.makeGraphic(20, 20, 0xff00cccc);
				exits.add(exit);
			}
			add(exits);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(map, player);
			FlxG.overlap(exits, player, reachedExit);
			timeLeft -= FlxG.elapsed;
			gui.setTimeLeft(timeLeft);
			if (timeLeft <= 0 && player.alive) {
				player.kill();
				add(new Explosion(player.x, player.y));
			}
			if (timeLeft < -3) {
				gameOver();
			}
		}
		private function reachedExit(a:FlxObject, b:FlxObject):void
		{
			FlxG.switchState(new GameState(levelNum+1));
		}
		private function gameOver() {
			FlxG.switchState(new GameState(1));
		}
	}

}