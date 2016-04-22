package 
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Animation extends MovieClip
	{
		public var selectedItem:Object = null;

		private const scalePercent:Number = 0.05;
		private const rotatePercent:uint = 45;
		private const alphaPercent:Number = 0.10;

		public function select(evt:MouseEvent):void
		{
			selectedItem = evt.currentTarget;
			//trace (selectedItem);
		}

		public function scaleUp(evt:MouseEvent):void
		{
			selectedItem.scaleX = selectedItem.scaleY +=  scalePercent;
		}

		public function scaleDown(evt:MouseEvent):void
		{
			selectedItem.scaleX = selectedItem.scaleY -=  scalePercent;
		}

		public function Rotate(evt:MouseEvent):void
		{
			selectedItem.rotation +=  rotatePercent;
		}

		public function Hide(evt:MouseEvent):void
		{
			selectedItem.visible = false;
		}


		public function Show(evt:MouseEvent):void
		{
			selectedItem.visible = true;
		}

		public function fadeOut(evt:MouseEvent):void
		{
			if (selectedItem.alpha > 0){
				selectedItem.alpha -=  alphaPercent;
			}
		}

		public function fadeIn(evt:MouseEvent):void
		{
			if (selectedItem.alpha < 1){
				selectedItem.alpha +=  alphaPercent;
			}
		}

		public function selectedIndicator():String
		{
			var desc:String = "";
			return desc;
		}

	}
}