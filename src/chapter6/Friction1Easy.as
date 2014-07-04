package chapter6
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class Friction1Easy extends Sprite
	{
		private var ball:Ball;
		private var vx:Number;
		private var vy:Number;
		private var friction:Number = 0.95;

		public function Friction1Easy()
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
			var speed:Number = Math.sqrt(vx * vx + vy + vy);
			var angle:Number = Math.atan2(vy, vx);

			vx *= friction;
			vy *= friction;
			ball.x += vx;
			ball.y += vy;

			trace(vx);
			trace(vy);
			trace(ball.x)
			trace(ball.y)
		}
	}
}
