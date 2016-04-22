package
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	public class Animation extends MovieClip
	{
		private const scalePercent:Number = 0.05;
		private const rotatePercent:uint = 45;
		private const alphaPercent:Number = 0.10;

		public function scaleUp(evt:MouseEvent):void
		{
			this.scaleX = this.scaleY +=  scalePercent;
		}

		public function scaleDown(evt:MouseEvent):void
		{
			this.scaleX = this.scaleY -=  scalePercent;
		}

		public function Rotate(evt:MouseEvent):void
		{
			this.rotation +=  rotatePercent;
		}

		public function Hide(evt:MouseEvent):void
		{
			this.visible = false;
		}


		public function Show(evt:MouseEvent):void
		{
			this.visible = true;
		}

		public function fadeOut(evt:MouseEvent):void
		{
			if (this.alpha > 0){
				this.alpha -=  alphaPercent;
			}
		}

		public function fadeIn(evt:MouseEvent):void
		{
			if (this.alpha < 1){
				this.alpha +=  alphaPercent;
			}
		}

		public function selectedIndicator():String
		{
			var desc:String = "";
			return desc;
		}

	}
}