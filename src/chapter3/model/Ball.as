package chapter3.model
{
	import flash.display.Sprite;

	public class Ball extends Sprite
	{
		private var radius:Number;
		private var color:uint;

		public function Ball( radius:Number = 40, color:uint = 0xff0000)
		{
			this.radius = radius;
			this.color = color;
			init();
		}
		
		public function init():void{
			graphics.beginFill(this.color);
			graphics.drawCircle(0,0, this.radius);
			graphics.endFill();
		}
		
		
	}
}