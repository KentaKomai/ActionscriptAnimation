package chapter9
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;

	import chapter6.model.Ball;

	public class DistanceHit extends Sprite
	{
		private var ball1:Ball;
		private var ball2:Ball;
		private var debugTextField:TextField;

		public function DistanceHit()
		{
			init();
		}

		private function init():void
		{
			debugTextField = new TextField();
			this.addChild(debugTextField);

			ball1 = new Ball();
			this.addChild(ball1);
			ball1.x = stage.stageWidth / 2;
			ball1.y = stage.stageHeight / 2;

			ball2 = new Ball();
			this.addChild(ball2);
			ball2.startDrag(true);

			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var dx:Number = ball2.x - ball1.x;
			var dy:Number = ball2.y - ball1.y;
			var distance:Number = Math.sqrt(dx * dx + dy * dy);

			if (distance < 80)
			{
				debugTextField.text = "hit!";
			}
			else
			{
				debugTextField.text = "";
			}
		}
	}
}
