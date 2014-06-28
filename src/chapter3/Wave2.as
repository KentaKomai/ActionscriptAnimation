package chapter3
{
	import flash.display.Sprite;
	import flash.events.Event;
	

	public class Wave2 extends Sprite
	{
		private var angle:Number = 0;
		private var centerY:Number = 200;
		private var range:Number = 50;
		private var xSpeed:Number = 2;
		private var ySpeed:Number = .1;
		private var xPos:Number;
		private var yPos:Number;
		
		public function Wave2()
		{
			init();
		}
		private function init():void {
			xPos = 0;
			this.graphics.lineStyle(1,0,1);
			this.graphics.moveTo(0, centerY);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			xPos += xSpeed;
			angle += ySpeed;
			yPos = centerY + Math.sin(angle) * range;
			this.graphics.lineTo(xPos, yPos);
		}
	}
}