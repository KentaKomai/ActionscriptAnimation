package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import chapter3.model.Ball;

	public class Acceleration2 extends Sprite
	{
		private var ball:Ball;
		private var vx:Number = 0;
		private var ax:Number = 0;
		
		public function Acceleration2()
		{
			init();
		}
		
		private function init():void {
			ball = new Ball();
			this.addChild(ball);
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onEnterFrame(event:Event):void {
			vx += ax;
			trace(vx);
			ball.x += vx;
		}
		private function onKeyDown(event:KeyboardEvent):void {
			if(event.keyCode == Keyboard.LEFT )
				ax = -0.5;
			else if(event.keyCode == Keyboard.RIGHT)
				ax = 0.5;
		}
		private function onKeyUp(event:KeyboardEvent):void {
			ax = 0;
		}
	}
}