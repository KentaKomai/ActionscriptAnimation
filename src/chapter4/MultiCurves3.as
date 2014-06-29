package chapter4
{
	import flash.display.Sprite;

	public class MultiCurves3 extends Sprite
	{
		private var numPoints:Number = 9;

		public function MultiCurves3()
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
			
			var xc1:Number = (points[0].x + points[numPoints-1].x) / 2;
			var yc1:Number = (points[0].y + points[numPoints-1].y) / 2;
			//this.graphics.lineStyle(1);
			this.graphics.moveTo(xc1, yc1);
			
			this.graphics.beginFill(0xFF0000);
			for(i=0; i<numPoints-1; i++){
				var xc:Number = (points[i].x + points[i+1].x) / 2;
				var yc:Number = (points[i].y + points[i+1].y) / 2;
				this.graphics.curveTo(points[i].x, points[i].y, xc, yc);
			}
			this.graphics.curveTo(points[i].x, points[i].y, xc1, yc1);
			this.graphics.endFill();
			
		}
	}
}