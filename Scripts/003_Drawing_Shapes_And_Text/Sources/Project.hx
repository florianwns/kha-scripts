package;

import kha.Framebuffer;
import kha.Assets;
import kha.Color;
import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Project {
	public function new(){
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		drawGraphics(framebuffer.g2);
	}

	private function drawGraphics(g:Graphics):Void {
		g.begin();
		{
			g.color = Color.Blue; // change the color
			g.drawRect(32,32,64,32,2); // x, y, width, height, strength

			g.color = Color.Pink;
			g.fillRect(128,64,32,65);

			g.color = Color.White;
			g.font = Assets.fonts.OpenSans; // Use TTF
			g.fontSize = 50;
			g.drawString("Bonjour", 400, 200);

			// with kha.graphics2.GraphicsExtension
			g.drawCircle(256,256,50,2,6); //x, y, radius, strength, segments
			g.drawCircle(256,256,55,2);
		}
		g.end();		
	}
}