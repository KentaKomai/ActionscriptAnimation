package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter3.model.Ball;

	public class VelocityAngle extends Sprite
	{

		private var ball:Ball;
		private var angle:Number = 20;
		private var speed:Number = 3;

		public function VelocityAngle()
		{
			init();
		}

		private function init():void
		{
			ball = new Ball();
			this.addChild(ball);
			ball.x = 50;
			ball.y = 100;

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var radians:Number = angle * Math.PI / 180;
			var vx:Number = Math.cos(radians) * speed;
			var vy:Number = Math.sin(radians) * speed;
			ball.x += vx;
			ball.y += vy;
		}
	}
}
