package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GameState extends FlxState
	{
		[Embed(source="../res/gfx/tilemaps/green-pyramid.png")]
		public static const TILEMAP:Class;
		[Embed(source="../res/content/maps/map1.csv",mimeType="application/octet-stream")]
		public static const MAP_1:Class;
		
		private var map:FlxTilemap;
		private var player:Player;
		private var gui:GUI;
		private var timeLeft:Number = 10;
		
		override public function create():void
		{
			FlxG.bgColor = 0xffaaaaaa;
			map = new FlxTilemap();
			map.loadMap(new MAP_1(), TILEMAP, 20, 20, FlxTilemap.OFF);
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