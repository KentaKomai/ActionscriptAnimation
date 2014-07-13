package chapter8
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter6.model.Ball;

	public class Spring1 extends Sprite
	{
		private var ball:Ball;
		private var spring:Number = 0.4;
		private var friction:Number = 0.95;
		private var targetX:Number = stage.stageWidth / 2;
		private var vx:Number = 0;

		public function Spring1()
		{
			init();
		}
		private function init():void { 
			ball = new Ball();
			this.addChild(ball);
			ball.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			var dx:Number = targetX - ball.x;	//ターゲットまでの距離
			var ax:Number = dx * spring;		//ターゲットまでの距離にばね係数をかける
			vx += ax;							//加速していく
			vx *= friction;						//摩擦係数をかける
			ball.x += vx;						//ボールが移動する
		}
	}
}