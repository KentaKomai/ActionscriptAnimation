package chapter7
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import chapter6.model.Ball;

	public class MouseMoveDrag extends Sprite
	{
		private var ball:Ball;
		public function MouseMoveDrag()
		{
			init();
		}
		private function init():void {
			ball = new Ball();
			ball.x = 100;
			ball.y = 100;
			
			this.addChild(ball);
			
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		}
		
		private function onMouseDown(e:MouseEvent):void {
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		private function onMouseUp(e:MouseEvent):void {
			this.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		private function onMouseMove(e:MouseEvent):void {
			ball.x = mouseX;
			ball.y = mouseY;
		}
	}
}