package chapter8
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import chapter6.model.Ball;

	public class MultiSpring extends Sprite
	{
		private var ball:Ball;
		private var handles:Array;
		private var spring:Number = 0.1;
		private var friction:Number = 0.8;
		private var numHandles:Number = 5;
		
		public function MultiSpring()
		{
			init();
		}
		private function init():void {
			ball = new Ball();
			this.addChild(ball);
			
			handles = new Array();
			for(var i:uint=0; i<numHandles; i++){
				var handle:Ball = new Ball(10, 0x0000ff);
				handle.x = Math.random() * stage.stageWidth;
				handle.y = Math.random() * stage.stageHeight;
				handle.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
				this.addChild(handle);
				handles.push(handle);
			}
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.addEventListener(MouseEvent.MOUSE_UP, onRelease);
		}
		private function onEnterFrame(e:Event):void {
			for(var i:uint = 0; i<numHandles; i++){
				var handle:Ball = handles[i] as Ball;
				var dx:Number = handle.x - ball.x;
				var dy:Number = handle.y - ball.y;
				ball.vx += dx * spring;
				ball.vy += dy * spring;
			}
			
			ball.vx *= friction;
			ball.vy *= friction;
			ball.x += ball.vx;
			ball.y += ball.vy;
			
			this.graphics.clear();
			this.graphics.lineStyle(1);
			for(i=0; i<numHandles; i++){
				this.graphics.moveTo(ball.x, ball.y);
				this.graphics.lineTo(handles[i].x, handles[i].y);
			}
		}
		private function onPress(e:MouseEvent):void {
			e.target.startDrag();
		}
		private function onRelease(e:MouseEvent):void {
			e.target.stopDrag();
		}
	}
}