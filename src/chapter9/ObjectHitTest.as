package chapter9
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter6.model.Ball;

	public class ObjectHitTest extends Sprite
	{
		private var ball1:Ball;
		private var ball2:Ball;
		
		public function ObjectHitTest()
		{
			init();
		}
		private function init():void {
			ball1 = new Ball();
			this.addChild(ball1);
			ball1.x = stage.stageWidth / 2;
			ball1.y = stage.stageHeight / 2;
			
			ball2 = new Ball();
			this.addChild(ball2);
			ball2.startDrag(true);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			if(ball1.hitTestObject(ball2)){
				trace("hit");
			}
		}
	}
}