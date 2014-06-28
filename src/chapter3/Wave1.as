package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	import chapter3.model.Ball;
	
	
	public class Wave1 extends Sprite
	{
		private var ball:Ball;
		private var angle:Number = 0;
		private var range:Number = 50;
		private var centerY:Number = 200;
		private var centerX:Number = 50;
		private var xSpeed:Number = 5;
		private var ySpeed:Number = .1;
		
		public function Wave1()
		{
			init();
		}
		
		private function init():void {
			this.ball = new Ball();
			this.addChild(ball);
			this.ball.x = 0;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			this.ball.x += this.xSpeed;
			this.ball.y =  this.centerY + Math.sin(this.angle) * this.range;
			this.angle += this.ySpeed;
		}
	}
}