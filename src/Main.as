package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter3.Arrow;
	
	public class Main extends Sprite
	{
		private var arrow:Arrow;
		public function Main()
		{
			init();
		}
		
		private function init():void {
			
			this.arrow = new Arrow();
			this.addChild(arrow);
			this.arrow.x = stage.stageWidth / 2;
			this.arrow.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			var dx:Number = this.mouseX - this.arrow.x;
			var dy:Number = this.mouseY - this.arrow.y;
			var radians:Number = Math.atan2(dy, dx);
			trace(radians* 180/Math.PI);
			this.arrow.rotation = radians * 180/Math.PI;
		}
	}
}