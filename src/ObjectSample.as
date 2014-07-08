package
{
	import flash.display.Sprite;

	public class ObjectSample extends Sprite
	{
		public function ObjectSample()
		{
			var obj:Array = [{label: "日本語", locale: "ja_JP"}, {label: "English", locale: "en_US"}, {label: "簡体字", locale: "zh_CN"}];
			trace(obj.length);
			trace(obj);
			trace(Object(obj));
		}
	}
}
