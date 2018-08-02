package;

import kha.Framebuffer;
import kha.input.KeyCode;
import kha.Assets;
import kha.Image;

class Project {
	public var image:Image;

	public function new(){
		image = Assets.images.Haxe_Logo;
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		g.drawImage(image, 30, 30);
		g.end();
	}

	public function onKeyDown(keyCode:KeyCode):Void {
	}

	public function onKeyUp(keyCode:KeyCode):Void {
	}
}