package chapter9
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter9.model.Box;

	public class Boxes extends Sprite
	{
		private var box1:Box;
		private var box2:Box;
		private var boxes:Array;
		private var gravity:Number = 80;
		
		public function Boxes()
		{
			init();
		}
		private function init():void {
			boxes = new Array();
			createBox1();
			createBox2();
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			box1.vy += gravity;
			box1.y += box1.vy;
			box2.vy += Math.random() * gravity + 0.25;
			box2.y += box2.vy;
			if(box1.y + box1.height / 2 > stage.stageHeight){
				box1.y = stage.stageHeight - box1.height / 2;
				createBox1();
			}
			if(box2.y + box2.height / 2 > stage.stageHeight){
				box2.y = stage.stageHeight - box2.height / 2;
				createBox2();
			}
			
			for(var i:uint =0; i<boxes.length; i++){
				if(box1 != boxes[i] && box1.hitTestObject(boxes[i])){
					box1.y = boxes[i].y - boxes[i].height / 2 - box1.height / 2;
					createBox1();
				}
			}
			for(i=0; i<boxes.length; i++){
				if(box2 != boxes[i] && box2.hitTestObject(boxes[i])){
					box2.y = boxes[i].y - boxes[i].height / 2 - box2.height / 2;
					createBox2();
				}
			}
		}

		private function createBox1():void{
			var color:uint = getRandomColor();
			box1 = new Box(Math.random() * 1 + 1, Math.random() * 40 + 10, color);
			box1.x = Math.random() * stage.stageWidth;
			this.addChild(box1);
			boxes.push(box1);
		}
		private function createBox2():void{
			var color:uint = getRandomColor();
			box2 = new Box(Math.random() * 1 + 1, Math.random() * 40 + 10, color);
			box2.x = Math.random() * stage.stageWidth;
			this.addChild(box2);
			boxes.push(box2);
		}
		private function getRandomColor():uint {
			var r:uint = Math.random() * 255;
			var g:uint = Math.random() * 255;
			var b:uint = Math.random() * 255;
			var color:uint = r << 16 | g << 8 | b;
			return color;
			
		}
	}
}