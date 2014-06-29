package chapter3
{
	import flash.display.Sprite;
	
	import chapter3.model.Ball;

	public class Oval extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		private var centerX:Number;
		private var centerY:Number;
		private var radiusX:Number = 200;
		private var radiusY:Number = 100;
		private var speed:Number = .1;
		
		public function Oval()
		{
		}
	}
}