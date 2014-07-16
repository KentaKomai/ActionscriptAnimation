package chapter10
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter6.model.Ball;

	public class Rotate2 extends Sprite
	{
		private var ball:Ball;
		private var vr:Number = .1;
		private var degreeAnglePerFrame:Number = 10;
		private var cos:Number = Math.cos(degreeAnglePerFrame * Math.PI / 180);
		private var sin:Number = Math.sin(degreeAnglePerFrame * Math.PI / 180);

		public function Rotate2()
		{
			init();
		}

		private function init():void
		{
			ball = new Ball();
			this.addChild(ball);

			ball.x = Math.random() * stage.stageWidth;
			ball.y = Math.random() * stage.stageHeight;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var x1:Number = ball.x - stage.stageWidth / 2; //中心点を(0,0)とした場合のオブジェクトのx座標
			var y1:Number = ball.y - stage.stageHeight / 2; //中心点を(0,0)とした場合のオブジェクトのy座標
			var x2:Number = cos * x1 - sin * y1; //中心点(0,0) angle=0.5で回転したときの新しいx座標
			var y2:Number = cos * y1 + sin * x1; //中心点(0,0) angle=0.5で回転したときの新しいy座標

			//中心点をステージの中心に戻して代入
			ball.x = stage.stageWidth / 2 + x2;
			ball.y = stage.stageHeight / 2 + y2;
		}
	}
}
