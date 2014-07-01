package chapter6
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class Fountain extends Sprite
	{
		private var count:int = 300;
		private var gravity:Number = 0.5;
		private var balls:Array;

		public function Fountain()
		{
			init();
		}

		private function init():void
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE
			this.stage.align = StageAlign.TOP_LEFT;
			balls = new Array();
			for (var i:int = 0; i < count; i++)
			{
				var ball:Ball = new Ball(3, Math.random() * 0xffffff);
				ball.x = stage.stageWidth / 2;
				ball.y = stage.stageHeight;
				ball.vx = Math.random() * 2 - 1;
				ball.vy = Math.random() * -20 - 20;
				this.addChild(ball);
				balls.push(ball);
			}
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			for (var i:Number = 1; i < balls.length; i++)
			{
				var ball:Ball = Ball(balls[i]);
				ball.vy += gravity;
				ball.x += ball.vx;
				ball.y += ball.vy;

				if (ball.x - ball.radius > stage.stageWidth || ball.x + ball.radius < 0 || ball.y - ball.radius > stage.stageHeight || ball.y + ball.radius < 0)
				{
					ball.x = stage.stageWidth / 2;
					ball.y = stage.stageHeight;
					ball.vx = Math.random() * 2 - 1;
					ball.vy = Math.random() * -20 - 20;
				}
			}
		}
	}
}
