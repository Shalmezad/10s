package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Shalmezad
	 */
	public class GUI extends FlxGroup
	{
		private var timeLeft:FlxText;
		public function GUI() 
		{
			timeLeft = new FlxText(20, 20, 50, "10.0");
			timeLeft.size = 20;
			add(timeLeft);
		}
		
		public function setTimeLeft(time:Number):void
		{
			if (time < 0) time = 0;
			var tempTime:int = time * 10;
			if (tempTime % 10 == 0) 
			{
				timeLeft.text = "" + tempTime/10.0 + ".0";
			}
			else 
			{
				timeLeft.text = "" + tempTime/10.0;
			}
			//if (time < 4.0) {
			//	timeLeft.color = 0xff0000;
			//}
			if(time < 5){
				timeLeft.color = 	(int)(255) << 16 |
									(int)(time / 5.0 * 255) << 8;
			}
			else {
				timeLeft.color = 	(int)((10 - time) / 5.0 * 255) << 16 |
									(int)(255) << 8;
			}
		}
	}

}