package;

import kha.Framebuffer;

class Project {
	public function new(){
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		g.fillRect(32, 32, 128, 128);
		g.end();
	}
}