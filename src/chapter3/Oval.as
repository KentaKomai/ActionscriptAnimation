package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter3.model.Ball;

	public class Oval extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		private var centerX:Number = 200;
		private var centerY:Number = 200;
		private var radiusX:Number = 200;
		private var radiusY:Number = 100;
		private var speed:Number = .1;
		
		public function Oval()
		{
			init();
		}
		private function init():void {
			ball = new Ball();
			this.addChild(ball);
			ball.x = 0;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			ball.x = centerX + Math.sin(angle) * radiusX;
			ball.y = centerX + Math.sin(angle) * radiusY;
			angle += speed;
		}
	}
}