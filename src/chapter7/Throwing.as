package chapter7
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import chapter6.model.Ball;

	public class Throwing extends Sprite
	{
		private var ball:Ball;
		private var vx:Number;
		private var vy:Number;
		private var bounce:Number = -0.7;
		private var gravity:Number = .5;
		private var oldX:Number;
		private var oldY:Number;

		public function Throwing()
		{
			init();
		}

		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;

			ball = new Ball();
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			vx = Math.random() * 10 - 5;
			vy = -10;

			this.addChild(ball);
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onMouseDown(e:MouseEvent):void
		{
			oldX = ball.x;
			oldY = ball.y;

			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			ball.startDrag();
			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.addEventListener(Event.ENTER_FRAME, trackVelocity);
		}

		private function onMouseUp(e:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			ball.stopDrag();
			this.removeEventListener(Event.ENTER_FRAME, trackVelocity);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function trackVelocity(e:Event):void
		{
			vx = ball.x - oldX;
			vy = ball.y - oldY;
			oldX = ball.x;
			oldY = ball.y;
		}

		private function onEnterFrame(e:Event):void
		{
			vy += gravity;
			ball.x += vx;
			ball.y += vy;

			var left:Number = 0;
			var right:Number = stage.stageWidth;
			var top:Number = 0;
			var bottom:Number = stage.stageHeight;

			if (ball.x + ball.radius > right)
			{
				ball.x = right - ball.radius;
				vx *= bounce;
			}
			else if (ball.x - ball.radius < left)
			{
				ball.x = left + ball.radius;
				vx *= bounce;
			}

			if (ball.y + ball.radius > bottom)
			{
				ball.y = bottom - ball.radius;
				vy *= bounce;
			}
			else if (ball.y - ball.radius < top)
			{
				ball.y = top + ball.radius;
				vy *= bounce;
			}
		}
	}
}
