package chapter9
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import chapter9.model.Box;

	public class MyBoxes extends Sprite
	{
		private var dynamicBoxes:Array;
		private var staticBoxes:Array;
		private var gravity:Number = 3;
		private var numDynamic:Number = 7;
		
		public function MyBoxes()
		{
			init();
		}
		private function init():void {
			staticBoxes = new Array();
			dynamicBoxes = new Array();
			createDynamicBox();
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		private function onEnterFrame(e:Event):void {
			
			for(var i:uint=0; i<dynamicBoxes.length; i++){
				var box:Box = dynamicBoxes[i];
				box.vy += Math.random() * gravity + 8;
				box.y += box.vy;
				if(box.y + box.height / 2 > stage.stageHeight){
					box.y = stage.stageHeight - box.height / 2;
					dynamicBoxes.splice(i, 1);
					i--;
					staticBoxes.push(box);
					createBox();
				}
				for(var j:uint =0; j<staticBoxes.length; j++){
					if(box.hitTestObject(staticBoxes[j])){
						trace("static");
						box.y = staticBoxes[j].y - staticBoxes[j].height / 2 - box.height / 2;
						dynamicBoxes.splice(j, 1);
						j--;
						staticBoxes.push(box);
						createBox();
					}
				}
			}
		}
		private function createBox():void{
			var color:uint = getRandomColor();
			var box:Box = new Box(Math.random() * 1 + 1, Math.random() * 40 + 10, color);
			box.x = Math.random() * stage.stageWidth;
			this.addChild(box);
			dynamicBoxes.push(box);
		}

		private function createDynamicBox():void{
			for(var i:uint=0; i<numDynamic; i++){
				trace("added");
				var color:uint = getRandomColor();
				var box:Box = new Box(Math.random() * 1 + 1, Math.random() * 40 + 10, color);
				box.x = Math.random() * stage.stageWidth;
				this.addChild(box);
				dynamicBoxes.push(box);
			}
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