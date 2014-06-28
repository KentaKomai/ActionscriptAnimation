package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	import chapter3.model.Ball;
	
	
	public class Bodding extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		
		public function Bodding()
		{
			init();
		}
		
		private function init():void {
			this.ball = new Ball();
			this.addChild(ball);
			
			this.ball.x = stage.stageWidth / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			this.ball.y = stage.stageHeight / 2 + Math.sin(angle) * 50;
			this.angle += .1;
		}
	}
}