package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class LevelMap extends FlxTilemap
	{
		[Embed(source="../res/gfx/tilemaps/green-pyramid.png")]
		public static const TILEMAP:Class;
		[Embed(source="../res/content/maps/map1.csv",mimeType="application/octet-stream")]
		public static const MAP_1:Class;
		
		
		public function LevelMap(levelNum:int = -1) 
		{
			if (levelNum != -1) {
				loadLevel(levelNum);
			}
		}
		
		public function load(map:Class, tiles:Class) :void
		{
			super.loadMap(new map(), tiles, 20, 20, OFF);
		}
		
		public function loadLevel(levelNum:int = 1) :void
		{
			//TODO: Load level based on level number
			load(MAP_1, TILEMAP);
		}
		
	}

}