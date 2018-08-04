package;

import kha.Framebuffer;
import kha.Color;

class Project {
	public var colors:Array<Color>;

	public function new(){
		colors = [
			Color.Green, 								// Initialisation avec une couleur prédéfinie
			Color.fromBytes(125,0,124,255),				// Initialisation avec des entiers de 0 à 255 (RGBA)
			Color.fromFloats(0.3,0.1,0.2,0.8),			// Initialisation avec des nombre à virgule 0 à 1 (RGBA)
			Color.fromValue(0xffffff00),				// Initialisation avec un entier codé sur 32 bits (ARGB)
			Color.fromString("#ffffff00"),				// Initialisation avec un entier codé 32 bits (ARGB)
			Color.fromString("#ff00ff")					// Initialisation avec un entier codé 24 bits (RGB)
		];
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var g = framebuffer.g2;
		g.begin();
		for (i in 0...colors.length)
		{
			g.color = colors[i];
			var pos = i * 64;
			g.fillRect(pos, pos,64,64);
		}
		g.end();
	}
}