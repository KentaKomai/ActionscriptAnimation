package chapter3
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.ui.Mouse;

	public class MouseDistance extends Sprite
	{
		private var sprite1:Sprite;
		private var textField:TextField;
		
		public function MouseDistance()
		{
			init();
		}
		
		private function init():void {
			this.sprite1 = new Sprite();
			this.addChild(sprite1);
			
			sprite1.graphics.beginFill(0x000000);
			sprite1.graphics.drawRect(-2,-2,4,4);
			sprite1.graphics.endFill();
			sprite1.x = stage.stageWidth / 2;
			sprite1.y = stage.stageHeight / 2;
			
			this.textField = new TextField();
			this.addChild(textField);
			
			this.stage.addEventListener(MouseEvent.MOUSE_MOVE , onMouserMove);
		}
		
		private function onMouserMove(e:MouseEvent):void {
			this.graphics.clear();
			this.graphics.lineStyle(1,0,1);
			this.graphics.moveTo(sprite1.x, sprite1.y);
			this.graphics.lineTo(mouseX, mouseY);
			
			var dx:Number = sprite1.x - mouseX;
			var dy:Number = sprite1.y - mouseY;
			var dist:Number = Math.sqrt(dx*dx+dy*dy);
			textField.text = dist.toString();
		}
	}
}