package chapter4
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;

	public class DrawingApp extends Sprite
	{
		public function DrawingApp()
		{
			init();
		}
		
		private function init():void {
			this.graphics.lineStyle(1);
			
			this.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			this.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		private function onMouseDown(event:MouseEvent):void {
			this.graphics.moveTo(mouseX, mouseY);
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		private function onMouseUp(event:MouseEvent):void {
			this.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		}
		private function onMouseMove(event:MouseEvent):void {
			this.graphics.lineTo(mouseX, mouseY);
		}
	}
}