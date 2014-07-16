package chapter10
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class Rotate3 extends Sprite
	{
		private var balls:Array;
		private var numBalls:uint = 200;
		private var degreeAngle:Number = 1;
		private var vr:Number = .05; //degreeAngle * Math.PI / 180;

		public function Rotate3()
		{
			init();
		}

		private function init():void
		{
			balls = new Array();
			for (var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = new Ball(Math.random() * 15, Math.random() * 0xffffff);
				balls.push(ball);
				this.addChild(ball);

				ball.x = Math.random() * stage.stageWidth + 20;
				ball.y = Math.random() * stage.stageHeight + 20;
			}
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var angle:Number = (mouseX - stage.stageWidth / 2) * 0.001;
			var cos:Number = Math.cos(angle);
			var sin:Number = Math.sin(angle);

			for (var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = balls[i];
				var x1:Number = ball.x - stage.stageWidth / 2;
				var y1:Number = ball.y - stage.stageHeight / 2;
				var x2:Number = cos * x1 - sin * y1;
				var y2:Number = cos * y1 + sin * x1;
				ball.x = stage.stageWidth / 2 + x2;
				ball.y = stage.stageHeight / 2 + y2;
			}
		}
	}
}
