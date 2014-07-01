package chapter6
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class MyFountain extends Sprite
	{
		private var balls:Array;
		private var ballCount:Number = 600;
		private var gravity:Number = -0.5;

		public function MyFountain()
		{
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
			balls = new Array();
			for (var i:Number = 0; i < ballCount; i++)
			{
				var ball:Ball = new Ball(8, Math.random() * 0xffffff);
				ball.x = 0; //Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
				ball.vx = Math.random() * 50;
				ball.vy = Math.random() * 8 - 4;
				this.addChild(ball);
				balls.push(ball);
			}
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			trace("frame");
			trace(balls.length);
			for (var i:Number = 0; i < balls.length; i++)
			{
				trace(i);
				var ball:Ball = Ball(balls[i]);
				ball.vx += gravity;
				ball.x += ball.vx;
				ball.y += ball.vy;

				if (ball.x - ball.radius > stage.stageWidth || ball.x + ball.radius < 0 || ball.y - ball.radius > stage.stageHeight || ball.y + ball.radius < 0)
				{
					ball.x = 0; // Math.random() * stage.stageWidth;
					ball.y = Math.random() * stage.stageHeight;
					ball.vx = Math.random() * 50;
					ball.vy = Math.random() * 4;
				}
			}
		}
	}
}
