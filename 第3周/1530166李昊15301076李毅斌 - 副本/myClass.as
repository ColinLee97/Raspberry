package {

	public class myClass {
		import flash.events.Event;
		import flash.events.MouseEvent;
		import flash.display.Shape;

		var color: Number;

		btn1.addEventListener(MouseEvent.CLICK, changePen);
		btn2.addEventListener(MouseEvent.CLICK, changePen);

		function changePen(e: MouseEvent): void {
			switch (e.currentTarget.name) {
				case "btn1":
					stage.addEventListener(MouseEvent.MOUSE_DOWN, startDrawDot);
					stage.addEventListener(MouseEvent.MOUSE_UP, stopDrawDot);
					stage.removeEventListener(MouseEvent.MOUSE_DOWN, startDrawLine);
					stage.removeEventListener(MouseEvent.MOUSE_UP, stopDrawLine);
					break;

				case "btn2":
					stage.addEventListener(MouseEvent.MOUSE_DOWN, startDrawLine);
					stage.addEventListener(MouseEvent.MOUSE_UP, stopDrawLine);
					stage.removeEventListener(MouseEvent.MOUSE_DOWN, startDrawDot);
					stage.removeEventListener(MouseEvent.MOUSE_UP, stopDrawDot);
					break;
			}
		}

		function startDrawDot(e: MouseEvent): void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, drawDot);
			color = Math.random() * 0xFFFFFF;
		}

		function stopDrawDot(e: MouseEvent): void {
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, drawDot);
		}

		function drawDot(e: MouseEvent): void {
			var Dot: Shape = new Shape();
			Dot.graphics.beginFill(color);
			Dot.graphics.drawEllipse(mouseX, mouseY, 10, 10);
			Dot.graphics.endFill();
			addChild(Dot);
		}

		var Line: Shape = new Shape();

		function startDrawLine(e: MouseEvent): void {
			color = Math.random() * 0xFFFFFF;
			Line.graphics.lineStyle(5, color, .75);
			Line.graphics.beginFill(color);
			Line.graphics.moveTo(mouseX, mouseY);
		}

		function stopDrawLine(e: MouseEvent): void {
			Line.graphics.lineTo(mouseX, mouseY);
			Line.graphics.endFill();
			addChild(Line);
		}

	}

}