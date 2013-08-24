package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Player extends FlxSprite
	{
		
		public function Player() 
		{
			super(10,10);
			makeGraphic(10, 10, 0xffaa0000);
			maxVelocity.x = 80;
			drag.x = maxVelocity.x*4;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
			if(FlxG.keys.LEFT)
				acceleration.x = -maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				acceleration.x = maxVelocity.x*4;
		}
	}

}