package chapter8
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import chapter6.model.Ball;

	public class TripleSpring extends Sprite
	{
		private var ball0:Ball;
		private var ball1:Ball;
		private var ball2:Ball;
		private var ball0Dragging:Boolean = false;
		private var ball1Dragging:Boolean = false;
		private var ball2Dragging:Boolean = false;
		private var spring:Number = 0.1;
		private var friction:Number = 0.95;
		private var springLength:Number = 100;
		
		public function TripleSpring()
		{
			init();
		}
		private function init():void {
			ball0 = new Ball();
			ball0.x = Math.random() * stage.stageWidth;
			ball0.x = Math.random() * stage.stageHeight;
			ball0.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			this.addChild(ball0);
			
			ball1 = new Ball();
			ball1.x = Math.random() * stage.stageWidth;
			ball1.y = Math.random() * stage.stageHeight;
			ball1.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			this.addChild(ball1);
			
			ball2 = new Ball();
			ball2.x = Math.random() * stage.stageWidth;
			ball2.y = Math.random() * stage.stageHeight;
			ball2.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			this.addChild(ball2);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onRelease);
		}
		private function onEnterFrame(e:Event):void {
			if(!ball0Dragging){
				springTo(ball0, ball1);
				springTo(ball0, ball2);
			}
			if(!ball1Dragging){
				springTo(ball1, ball0);
				springTo(ball1, ball2);
			}
			if(!ball2Dragging){
				springTo(ball2, ball0);
				springTo(ball2, ball1);
			}
			
			this.graphics.clear();
			this.graphics.lineStyle(1);
			this.graphics.moveTo(ball0.x, ball0.y);
			this.graphics.lineTo(ball1.x, ball1.y);
			this.graphics.lineTo(ball2.x, ball2.y);
		}
		private function springTo(ballA:Ball, ballB:Ball):void {
			var dx:Number = ballB.x - ballA.x;
			var dy:Number = ballB.y - ballA.y;
			var angle:Number = Math.atan2(dy,dx);
			var targetX:Number = ballB.x - Math.cos(angle) * springLength;
			var targetY:Number = ballB.y - Math.sin(angle) * springLength;
			
			ballA.vx += (targetX - ballA.x) * spring;
			ballA.vy += (targetY - ballA.y) * spring;
			ballA.vx *= friction;
			ballA.vy *= friction;
			ballA.x += ballA.vx;
			ballA.y += ballA.vy;
		}
		private function onPress(e:MouseEvent):void {
			e.target.startDrag();
			if(e.target == ball0){
				ball0Dragging = true;
			}
			if(e.target == ball1){
				ball1Dragging = true;
			}
			if(e.target == ball2){
				ball2Dragging = true;
			}
		}
		private function onRelease(e:MouseEvent):void {
			ball0.stopDrag();
			ball1.stopDrag();
			ball2.stopDrag();
			ball0Dragging = false;
			ball1Dragging = false;
			ball2Dragging = false;
		}
	}
}