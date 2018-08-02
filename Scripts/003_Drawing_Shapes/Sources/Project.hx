package;

import kha.Framebuffer;
import kha.input.KeyCode;
import kha.Color;
using kha.graphics2.GraphicsExtension;

class Project {
	public function new(){
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		
		g.color = Color.Blue; // change the color
		g.drawRect(32,32,64,32,2); // x, y, width, height, strength

		g.color = Color.Pink;
		g.fillRect(128,64,32,65);

		// with kha.graphics2.GraphicsExtension
		g.drawCircle(256,256,50,2,6); //x, y, radius, strength, segments
		g.drawCircle(256,256,55,2);

		g.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
	}

	public function onKeyUp(keyCode:KeyCode):Void {
	}
}