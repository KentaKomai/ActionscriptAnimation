package chapter6
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter3.model.Arrow;

	public class RotationalVelocityWithFriction extends Sprite
	{
		private var arrow:Arrow;
		private var vr:Number = 5;
		private var friction:Number = 0.98;

		public function RotationalVelocityWithFriction()
		{
			init();
		}

		private function init():void
		{
			arrow = new Arrow();
			this.addChild(arrow);
			arrow.x = stage.stageWidth / 2;
			arrow.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(event:Event):void
		{
			vr *= friction;
			if (vr > 1 - friction)
			{
				arrow.rotation += vr;
			}
		}
	}
}
