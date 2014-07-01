package chapter6.model
{
	import flash.display.Sprite;

	public class Ball extends Sprite
	{
		private var _radius:Number;
		private var _color:uint;
		private var _vx:Number = 0;
		private var _vy:Number = 0;

		/**
		 * Accessors
		 *
		 */
		public function get radius():Number
		{
			return _radius;
		}

		public function set radius(n:Number):void
		{
			_radius = n;
		}

		public function get color():Number
		{
			return _color;
		}

		public function set color(n:Number):void
		{
			_color = n;
		}

		public function get vx():Number
		{
			return _vx;
		}

		public function set vx(n:Number):void
		{
			_vx = n;
		}

		public function get vy():Number
		{
			return _vy;
		}

		public function set vy(n:Number):void
		{
			_vy = n;
		}

		public function Ball(radius:Number = 40, color:uint = 0xff0000)
		{
			this.radius = radius;
			this.color = color;
			init();
		}

		private function init():void
		{
			this.graphics.beginFill(color);
			this.graphics.drawCircle(0, 0, radius);
			this.graphics.endFill();
		}
	}
}
