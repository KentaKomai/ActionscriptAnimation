package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	

	public class Random extends Sprite
	{
		private var ball:Ball;
		private var angleX:Number = 0;
		private var angleY:Number = 0;
		private var centerX:Number = 200;
		private var centerY:Number = 200;
		private var range:Number = 50;
		private var xSpeed:Number = .07;
		private var ySpeed:Number = .11;
		
		
		public function Random()
		{
			init();
		}
		
		public function init():void {
			ball = new Ball();
			this.addChild(ball);
			ball.x = 0;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			ball.x = centerX + Math.sin(angleX) * range;
			ball.y = centerY + Math.sin(angleY) * range;
			angleX += xSpeed;
			angleY += ySpeed;
		}
	}
}