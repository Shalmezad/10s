package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Spike extends FlxSprite
	{
		
		[Embed(source="../res/gfx/sprites/spike.png")]
		public static const SPIKE:Class;
		
		public function Spike() 
		{
			loadGraphic(SPIKE);
		}
		
	}

}