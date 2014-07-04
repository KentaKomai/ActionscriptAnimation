package chapter6
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class Bouncing extends Sprite
	{

		private var ball:Ball;
		private var vx:Number;
		private var vy:Number;
		private var bounce:Number = -0.5;

		public function Bouncing()
		{
			init();
		}

		private function init():void
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;

			ball = new Ball();
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;

			vx = Math.random() * 20 - 10;
			vy = Math.random() * 20 - 10;

			this.addChild(ball);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			trace(vx);
			trace(vy);
			ball.x += vx;
			ball.y += vy;

			var left:Number = 0;
			var right:Number = stage.stageWidth;
			var top:Number = 0;
			var bottom:Number = stage.stageHeight;

			if (ball.x + ball.radius > right)
			{
				ball.x = right - ball.radius;
				//vx *= -1;
				vx *= bounce;
			}
			else if (ball.x - ball.radius < left)
			{
				ball.x = left + ball.radius;
				//vx *= -1;
				vx *= bounce;
			}

			if (ball.y + ball.radius > bottom)
			{
				ball.y = bottom - ball.radius;
				//vy *= -1;
				vy *= bounce;
			}
			else if (ball.y - ball.radius < top)
			{
				ball.y = top + ball.radius;
				//vy *= -1;
				vy *= bounce;
			}
		}
	}
}
