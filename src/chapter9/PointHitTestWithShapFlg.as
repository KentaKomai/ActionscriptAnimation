package chapter9
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import chapter6.model.Ball;
	
	public class PointHitTestWithShapFlg extends Sprite
	{
		private var ball:Ball;
		
		public function PointHitTestWithShapFlg()
		{
			init();
		}
		private function init():void {
			ball = new Ball();
			this.addChild(ball);
			ball.x = stage.stageWidth / 2;
			ball.y = stage.stageHeight / 2;
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			if(ball.hitTestPoint(mouseX, mouseY, true)) {
				trace("HIT!");
			}
		}
	}
}