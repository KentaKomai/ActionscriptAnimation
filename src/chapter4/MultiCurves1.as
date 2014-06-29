package chapter4
{
	import flash.display.Sprite;

	public class MultiCurves1 extends Sprite
	{
		private var numPoints:uint = 21;
		
		public function MultiCurves1()
		{
			init();
		}
		private function init():void {
			var points:Array = new Array();
			
			for(var i:int =0; i<numPoints; i++){
				points[i] = new Object();
				points[i].x = Math.random() * stage.stageWidth;
				points[i].y = Math.random() * stage.stageHeight;
			}
			this.graphics.lineStyle(1);
			this.graphics.moveTo(points[0].x , points[0].y);
			
			for(i=1; i<numPoints; i+=2){
				this.graphics.curveTo(points[i].x, points[i].y, points[i+1].x , points[i+1].y);
			}
		}
	}
}