package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter5.model.Ball;

	public class Acceleration1 extends Sprite
	{
		private var ball:Ball;
		private var vx:Number = 0;
		private var ax:Number = .2;
		
		public function Acceleration1()
		{
			init();
		}
		private function init():void {
			ball = new Ball();
			this.addChild(ball);
			ball.x = 50;
			ball.y = 100;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(event:Event):void {
			vx += ax;
			ball.x += vx;
		}
	}
}