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
		
		public const TILE_WIDTH:int = 20;
		public const TILE_HEIGHT:int = 20;
		
		public const START_TILE:int = 8;
		public const END_TILE:int = 9;
		
		public var playerStart:FlxPoint;
		public var endPoints:Array;
		
		public function LevelMap(levelNum:int = -1) 
		{
			if (levelNum != -1) {
				loadLevel(levelNum);
			}
		}
		
		public function load(map:Class, tiles:Class) :void
		{
			super.loadMap(new map(), tiles, TILE_WIDTH, TILE_HEIGHT, OFF);
			
			//find start and end.
			var start:Array = getTileInstances(START_TILE);
			if (start.length > 0) {
				var x:int = start[0] % widthInTiles;
				var y:int = start[0] / widthInTiles;
				playerStart = new FlxPoint(x, y);
				playerStart.x *= TILE_WIDTH;
				playerStart.y *= TILE_HEIGHT;
			}
			else {
				playerStart = new FlxPoint(20, 20);
			}
			endPoints = getTileInstances(END_TILE);
			
			
			//replace the start/end points
			changeTiles(START_TILE, 0);
			changeTiles(END_TILE, 0);
		}
		
		public function changeTiles(search:int, replace:int):void
		{
			var tiles:Array = getTileInstances(search);
			if(tiles != null){
				for (var a:int = 0; a < tiles.length; a++)
				{
					this.setTile(tiles[a]%widthInTiles, tiles[a]/widthInTiles, replace);
				}
			}
		}
		
		public function loadLevel(levelNum:int = 1) :void
		{
			//TODO: Load level based on level number
			load(MAP_1, TILEMAP);
		}
		
	}

}