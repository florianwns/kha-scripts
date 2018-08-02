package;

import kha.Framebuffer;
import kha.Assets;
import kha.Image;

class Project {
	public var image:Image; 

	public function new(){
		image = Assets.images.Haxe_Logo; //original image 230 x 314
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		g.drawImage(image, 0, 0);
		g.drawScaledImage(image, 240, 0, image.width/2, image.height/2); 
		g.drawScaledSubImage(image, 0, 0, image.width/2, image.height/2, 240, 157, image.width/2, image.height/2);
		g.end();
	}
}