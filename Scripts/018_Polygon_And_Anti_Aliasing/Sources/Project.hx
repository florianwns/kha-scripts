package;

import kha.Framebuffer;
import kha.math.Vector2;
using kha.graphics2.GraphicsExtension;

class Project {
	public function new(){
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.drawCircle(0,0,512);
		graphics.drawPolygon(0, 0, [new Vector2(300,100), new Vector2(500,100), new Vector2(300,150)]);
		graphics.end();
	}
}