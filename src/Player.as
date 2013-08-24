package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class Player extends FlxSprite
	{
		//vertical movement
		private const JUMP_VELOCITY:Number = -500;
		private const GRAVITY:Number = 300;
		private const TERMINAL_VELOCITY:Number = 200;
		
		//horizontal movement
		private const HORIZONTAL_ACCEL:Number = 390;
		private const FRICTION:Number = 240;
		private const MAX_SPEED:Number = 80;
		
		public function Player() 
		{
			super(10,10);
			makeGraphic(10, 10, 0xffaa0000);
			maxVelocity.x = MAX_SPEED;
			drag.x = FRICTION;
			
			maxVelocity.y = TERMINAL_VELOCITY;
			acceleration.y = GRAVITY;
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x = 0;
			if(KEY_LEFT())
				acceleration.x = -1 * HORIZONTAL_ACCEL;
			if(KEY_RIGHT())
				acceleration.x = HORIZONTAL_ACCEL;
			if(KEY_JUMP() && isTouching(FlxObject.FLOOR))
				velocity.y = JUMP_VELOCITY;
		}
		
		private function KEY_LEFT():Boolean {
			return FlxG.keys.LEFT || FlxG.keys.A;
		}
		private function KEY_RIGHT():Boolean {
			return FlxG.keys.RIGHT || FlxG.keys.D;
		}
		private function KEY_JUMP():Boolean {
			return FlxG.keys.UP || FlxG.keys.SPACE || FlxG.keys.W;
		}
	}

}