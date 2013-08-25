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
		[Embed(source="../res/content/maps/map2.csv",mimeType="application/octet-stream")]
		public static const MAP_2:Class;
		[Embed(source="../res/content/maps/map3.csv",mimeType="application/octet-stream")]
		public static const MAP_3:Class;
		[Embed(source="../res/content/maps/map4.csv",mimeType="application/octet-stream")]
		public static const MAP_4:Class;
		[Embed(source="../res/content/maps/map5.csv",mimeType="application/octet-stream")]
		public static const MAP_5:Class;
		[Embed(source="../res/content/maps/map6.csv",mimeType="application/octet-stream")]
		public static const MAP_6:Class;
		[Embed(source="../res/content/maps/map7.csv",mimeType="application/octet-stream")]
		public static const MAP_7:Class;
		[Embed(source="../res/content/maps/map8.csv",mimeType="application/octet-stream")]
		public static const MAP_8:Class;
		[Embed(source="../res/content/maps/map9.csv",mimeType="application/octet-stream")]
		public static const MAP_9:Class;
		[Embed(source="../res/content/maps/map10.csv",mimeType="application/octet-stream")]
		public static const MAP_10:Class;
		
		public static const MAPS:Array = [	MAP_1, MAP_2,
											MAP_3, MAP_4,
											MAP_5, MAP_6,
											MAP_7, MAP_8,
											MAP_9, MAP_10];
		
		public const TILE_WIDTH:int = 20;
		public const TILE_HEIGHT:int = 20;
		
		public const SPIKE_TILES:int = 7;
		public const START_TILE:int = 8;
		public const END_TILE:int = 9;
		
		public var playerStart:FlxPoint;
		public var endPoints:Array;
		public var spikePoints:Array;
		
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
			if (endPoints == null) {
				endPoints = new Array();
			}
			spikePoints = getTileInstances(SPIKE_TILES);
			if (spikePoints == null) {
				spikePoints = new Array();
			}
			
			//replace the start/end points
			changeTiles(START_TILE, 0);
			changeTiles(END_TILE, 0);
			changeTiles(SPIKE_TILES, 0);
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
			var level:int = levelNum - 1;
			if (level < MAPS.length) {
				load(MAPS[level], TILEMAP);
			}
			else {
				load(MAPS[MAPS.length - 1], TILEMAP);
			}
		}
		
	}

}