package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import chapter5.model.Ball;

	public class Acceleration3 extends Sprite
	{
		
		private var ball:Ball;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var ax:Number = 0;
		private var ay:Number = 0;
		
		public function Acceleration3()
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
			vy += ay;
			ball.x += vx;
			ball.y += vy;
		}
		private function onKeyDown(event:KeyboardEvent):void {
			switch(event.keyCode){
				case Keyboard.LEFT:
					ax = -0.2;
					break;
				case Keyboard.RIGHT:
					ax = 0.2;
					break;
				case Keyboard.UP:
					ay = -0.2;
					break;
				case Keyboard.DOWN:
					ay = 0.2;
					break;
				default:
					break;
			}
		}
		private function onKeyUp(event:KeyboardEvent):void {
			ax = 0;
			ay = 0;
		}
	}
}