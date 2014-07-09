package chapter7
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import chapter6.model.Ball;

	public class MouseEvents extends Sprite
	{
		public function MouseEvents()
		{
			init();
		}
		
		private function init():void {
			var ball:Ball = new Ball();
			ball.x = 100;
			ball.y = 100;
			
			this.addChild(ball);
			
			ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBall);
			ball.addEventListener(MouseEvent.MOUSE_UP, onMouseUpBall);
			ball.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveBall);
			
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownStage);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpStage);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveStage);
		}
		
		private function onMouseDownBall(e:MouseEvent):void {
			trace("mouse down - ball");
		}
		private function onMouseUpBall(e:MouseEvent):void {
			trace("mouse up - ball");
		}
		private function onMouseMoveBall(e:MouseEvent):void {
		
			trace("mouse move - ball");
		}
		private function onMouseDownStage(e:MouseEvent):void {
			trace("mouse down - stage");
		}
		private function onMouseUpStage(e:MouseEvent):void {
			trace("mouse up - stage");
		}
		private function onMouseMoveStage(e:MouseEvent):void {
			trace("mouse move - stage");
		}
	}
}