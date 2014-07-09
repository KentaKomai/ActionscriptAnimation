package chapter8
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import chapter6.model.Ball;

	public class Easing2 extends Sprite
	{
		private var ball:Ball;
		private var easing:Number = 0.2;
		private var targetX:Number = stage.stageWidth / 2;
		private var targetY:Number = stage.stageHeight / 2;

		public function Easing2()
		{
			init();
		}

		private function init():void
		{
			ball = new Ball();
			this.addChild(ball);
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onMouseDown(e:MouseEvent):void
		{
			ball.startDrag();
			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}

		private function onMouseUp(e:MouseEvent):void
		{
			ball.stopDrag();
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
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
