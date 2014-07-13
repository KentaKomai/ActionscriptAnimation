package chapter8
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter3.model.Ball;

	public class Easing1 extends Sprite
	{
		private var ball:Ball;
		private var easing:Number = 0.2;
		private var targetX:Number = stage.stageWidth / 2;
		private var targetY:Number = stage.stageHeight / 2;

		public function Easing1()
		{
			init();
		}

		private function init():void
		{
			ball = new Ball();
			this.addChild(ball);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var vx:Number = (targetX - ball.x) * easing;
			var vy:Number = (targetY - ball.y) * easing;
			ball.x += vx;
			ball.y += vy;
		}
	}
}