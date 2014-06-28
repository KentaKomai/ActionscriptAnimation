package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	

	public class Pulse extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		private var centerScale:Number = 1;
		private var range:Number = .5;
		private var speed:Number = .2;
		
		public function Pulse()
		{
			init();
		}
		
		private function init():void {
			this.ball = new Ball();
			this.addChild(ball);
			
			this.ball.x = stage.stageWidth / 2;
			this.ball.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			//this.ball.scaleX = this.scaleY = this.centerScale + Math.sin(angle) * range;
			var alpha:Number = 0.5 + Math.sin(angle) * 0.5;
			trace(alpha);
			this.ball.alpha = alpha;
			this.angle += this.speed;
		}
	}
}