package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;

	import chapter3.model.Arrow;

	public class FollowMouse extends Sprite
	{

		private var arrow:Arrow;
		private var speed:Number = 5;

		public function FollowMouse()
		{
			init();
		}

		private function init():void
		{
			arrow = new Arrow();
			this.addChild(arrow);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}

		private function onEnterFrame(e:Event):void
		{
			var dx:Number = mouseX - arrow.x;
			var dy:Number = mouseY - arrow.y;
			var angle:Number = Math.atan2(dy, dx);
			arrow.rotation = angle * 180 / Math.PI;
			var vx:Number = Math.cos(angle) * speed;
			var vy:Number = Math.sin(angle) * speed;
			arrow.x += vx;
			arrow.y += vy;
		}
	}
}
