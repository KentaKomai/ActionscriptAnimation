package chapter9.model
{
	import flash.display.Sprite;

	public class Box extends Sprite
	{
		private var w:Number;
		private var h:Number;
		private var color:uint;
		public var vx:Number = 0;
		public var vy:Number = 0;
		
		public function Box(width:Number=50, height:Number = 50, color:uint=0x11ff00)
		{
			this.w = width;
			this.h = height;
			this.color = color;
			init();
		}
		private function init():void {
			this.graphics.beginFill(color);
			this.graphics.drawRect(-w/2, -h/2, w,h);
			this.graphics.endFill();
		}
	}
}