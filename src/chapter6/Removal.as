package chapter6
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class Removal extends Sprite
	{
		private var count:int = 30;
		private var balls:Array;

		public function Removal()
		{
			init();
		}

		private function init():void
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;

			balls = new Array();
			for (var i:int = 0; i < count; i++)
			{
				balls[i] = new Ball();
				balls[i].x = Math.random() * stage.stageWidth;
				balls[i].y = Math.random() * stage.stageHeight;
				balls[i].vx = Math.random() * 2 - 1;
				balls[i].vy = Math.random() * 2 - 1;

				this.addChild(balls[i]);
			}

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			for (var i:Number = 0; i < balls.length; i++)
			{
				var ball:Ball = Ball(balls[i]);
				ball.x += ball.vx;
				ball.y += ball.vy;

				if (ball.x - ball.radius > stage.stageWidth || ball.x + ball.radius < 0 || ball.y - ball.radius > stage.stageHeight || ball.y + ball.radius < 0)
				{

					this.removeChild(ball);
					balls.splice(i, 1);
					if (balls.length <= 0)
					{
						this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
					}
				}

			}
		}
	}
}
