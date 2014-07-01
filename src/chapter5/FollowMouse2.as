package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter3.model.Arrow;

	public class FollowMouse2 extends Sprite
	{
		private var arrow:Arrow;
		private var vx:Number = 0;
		private var vy:Number = 0;
		private var force:Number = 0.5;
		
		public function FollowMouse2()
		{
			init();
		}
		
		private function init():void {
			arrow = new Arrow();
			this.addChild(arrow);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			var dx:Number = mouseX - arrow.x;
			var dy:Number = mouseY - arrow.y;
			var angle:Number = Math.atan2(dy, dx);
			arrow.rotation = angle * 180 / Math.PI;

			var ax:Number = Math.cos(angle) * force;
			var ay:Number = Math.sin(angle) * force;
			vx += ax;
			vy += ay;
			arrow.x += vx;
			arrow.y += vy;
		}
	}
}