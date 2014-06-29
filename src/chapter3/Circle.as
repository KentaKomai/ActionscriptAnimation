package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter3.model.Ball;

	public class Circle extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		private var centerX:Number;
		private var centerY:Number;
		private var radius:Number = 50;
		private var speed:Number = -.4;
		
		public function Circle()
		{
			init();
		}
		private function init():void {
			this.centerX = 200;
			this.centerY = 200;
			this.ball = new Ball();
			this.addChild(ball);
			
			this.ball.x = 0;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			ball.x = centerX + Math.sin(angle) * radius;
			ball.y = centerY + Math.cos(angle) * radius;
			angle += speed;
		}
	}
}