package chapter5.model
{
	import flash.display.Sprite;

	public class Ball extends Sprite
	{
		public var radius:Number;
		public var color:uint;

		public function Ball(radius:Number = 40, color:uint = 0xff0000)
		{
			this.radius = radius;
			this.color = color;
			init();
		}

		private function init():void
		{
			this.graphics.beginFill(color);
			this.graphics.drawCircle(0, 0, radius);
			this.graphics.endFill();
		}
	}
}
