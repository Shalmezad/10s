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
		private var spikes:FlxGroup;
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
			loadSpikes();
			
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
		
		private function loadSpikes():void
		{
			spikes = new FlxGroup();
			for (var a:int = 0; a < map.spikePoints.length; a++) {
				var spikeIndex:int = map.spikePoints[a];
				var spike:Spike = new Spike();
				spike.x = spikeIndex % map.widthInTiles;
				spike.y = (int)(spikeIndex / map.widthInTiles);
				spike.x *= map.TILE_WIDTH;
				spike.y *= map.TILE_HEIGHT;
				spike.width = 10;
				spike.height = 10;
				spike.centerOffsets(true);
				spikes.add(spike);
			}
			add(spikes);
		}
		
		override public function update():void
		{
			super.update();
			FlxG.collide(map, player);
			FlxG.overlap(exits, player, reachedExit);
			FlxG.overlap(spikes, player, hitSpike);
			if (!player.onScreen()) {
				killPlayer();
			}
			timeLeft -= FlxG.elapsed;
			gui.setTimeLeft(timeLeft);
			if (timeLeft <= 0) {
				killPlayer();
			}
			if (timeLeft < -3) {
				gameOver();
			}
		}
		
		private function killPlayer():void
		{
			if (timeLeft > 0) {
				timeLeft = 0;
			}
			if (player.alive) {
				player.kill();
				add(new Explosion(player.x, player.y));
			}
		}
		private function hitSpike(a:FlxObject, b:FlxObject):void
		{
			killPlayer();
		}
		
		private function reachedExit(a:FlxObject, b:FlxObject):void
		{
			GUI.score += timeLeft * 50;
			if(levelNum < 10){
				FlxG.switchState(new GameState(levelNum + 1));
			}
			else {
				gameWin();
			}
		}
		private function gameWin():void {
			FlxG.switchState(new GameState());
		}
		private function gameOver():void
		{
			FlxG.switchState(new GameState());
		}
	}

}