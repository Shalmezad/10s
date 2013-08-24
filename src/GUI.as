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
		}
	}

}