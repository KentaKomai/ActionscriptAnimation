package chapter5
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	import chapter5.model.Ship;

	public class ShipSim extends Sprite
	{
		
		private var ship:Ship;
		private var vr:Number = 0;
		private var thrust:Number = 0;
		private var vx:Number = 0;
		private var vy:Number = 0;
		
		public function ShipSim()
		{
			init();
		}
		
		private function init():void {
		
			ship = new Ship();
			this.addChild(ship);
			ship.x = stage.stageWidth / 2;
			ship.y = stage.stageHeight / 2;
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyDown(e:KeyboardEvent):void {
			switch(e.keyCode){
				case Keyboard.LEFT:
					vr = -5;
					break;
				case Keyboard.RIGHT:
					vr = 5;
					break;
				case Keyboard.UP:
					thrust = 0.2;
					ship.draw(true);
					break
				default:
					break;
			}
		}
		private function onKeyUp(e:KeyboardEvent):void {
			vr = 0;
			thrust = 0;
			ship.draw(false);
		}
		private function onEnterFrame(e:Event):void {
			ship.rotation += vr;
			var angle:Number = ship.rotation * Math.PI / 180;
			var ax:Number = Math.cos(angle) * thrust;
			var ay:Number = Math.sin(angle) * thrust;
			
			vx += ax;
			vy += ay;
			ship.x += vx;
			ship.y += vy;
		}
	}
}