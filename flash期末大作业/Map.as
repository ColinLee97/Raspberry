package {

	import flash.display.*;
	import flash.events.MouseEvent;
	
	//自定义类Map
	public class Map {

		public var board: Sprite = new Sprite();
		
		//实现地图拖拽
		public function startDragging(event: MouseEvent): void {
			board.startDrag();
		}

		public function stopDragging(event: MouseEvent): void {
			board.stopDrag();
			outOfSight();//检测是否出界
		}

		//防止地图被拖拽出舞台，作为一个私有函数，只能在类里面执行
		private function outOfSight(): void {
			if (board.x > 0) {
				board.x = 0;
			}
			if (board.x < 1440 - board.width) {
				board.x = 1440 - board.width;
			}
			if (board.y > 0) {
				board.y = 0;
			}
			if (board.y < 900 - board.height) {
				board.y = 900 - board.height;
			}
		}
	
		//实现地图缩放，这是花时间最长的一段代码:)
		public function zoom(event: MouseEvent): void {
			//（作为结尾算法的一部分被提前）先将地图坐标还原为1倍大小时的坐标，主要是因为整个算法要用到变形前的scaleX/Y参数，但如果新建一个变量只能引用scaleX/Y，本身不储存值，所以只好把计算拆开。
			board.x = (board.x - 720) / board.scaleX + 720;
			board.y = (board.y - 450) / board.scaleY + 450;
			//地图放大
			if (event.delta > 0) {
				//最大倍数1.75，步进0.05
				if (board.scaleX >= 1.7) {
					board.scaleY = board.scaleX = 1.75
				} else {
					board.scaleY = board.scaleX = board.scaleX + 0.05;
				}
			}
			//地图缩小
			if (event.delta < 0) {
				//最小倍数0.85，步进0.05
				if (board.scaleX <= 0.9) {
					board.scaleY = board.scaleX = 0.85
				} else {
					board.scaleY = board.scaleX = board.scaleX - 0.05;
				}
			}
			//保持地图缩放时，视野范围不变
			board.x = (board.x - 720) * board.scaleX + 720;
			board.y = (board.y - 450) * board.scaleY + 450;
			outOfSight();//检测是否出界
			//因为只用scaleX/Y来缩放的话，是以(0,0)为原点进行缩放的，必然会导致视野的变化。前后两条对board.x/y的计算就是用来保持地图视野在正中，产生一种在正中缩放的错觉。
		}
	}
}