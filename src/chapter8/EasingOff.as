package chapter8
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class EasingOff extends Sprite
	{
		private var ball:Ball;
		private var easing:Number = 0.2;
		private var targetX:Number = stage.stageWidth / 2;

		public function EasingOff()
		{
			init();
		}

		private function init():void
		{
			ball = new Ball();
			this.addChild(ball);
			ball.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var dx:Number = targetX - ball.x;
			if (Math.abs(dx) < 1)
			{
				ball.x = targetX;
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			}
			else
			{
				var vx:Number = dx * easing;
				ball.x += vx;
			}
		}
	}
}
