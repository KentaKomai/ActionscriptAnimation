package chapter4
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class MultiCurves2 extends Sprite
	{
		private var numPoint:uint = 21;
		private var timer:Timer = new Timer(3000);
		
		public function MultiCurves2()
		{
			init();

			//optional
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			timer.addEventListener(TimerEvent.TIMER, onTimer);
			timer.start();
		}
		
		private function init():void {
			var points:Array = new Array();
			for(var i:int =0; i<numPoint; i++){
				points[i] = new Object();
				points[i].x = Math.random() * stage.stageHeight;
				points[i].y = Math.random() * stage.stageHeight;
			}
			
			this.graphics.lineStyle(1);
			this.graphics.moveTo(points[0].x, points[0].y);
			
			for(i=1; i<numPoint-2; i++){
				var xc:Number = (points[i].x + points[i+1].x) / 2;
				var yc:Number = (points[i].y + points[i+1].y) / 2;
				graphics.curveTo(points[i].x, points[i].y, xc,yc);
			}
			graphics.curveTo(points[i].x, points[i].y, points[i+1].x, points[i+1].y);
		}
		private function onEnterFrame(e:Event):void {
			init();
		}
		private function onTimer(e:TimerEvent):void {
			this.graphics.clear();
		}
	}
}