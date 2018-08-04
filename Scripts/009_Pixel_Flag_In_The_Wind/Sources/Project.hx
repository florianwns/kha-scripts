package;

import kha.Framebuffer;
import kha.System;
import kha.graphics2.Graphics;
import Pixel;

class Project {
	private var pixelsInWidth:Int;
	private var pixelsInHeight:Int;
	private var arPixel:Array<Pixel>;
	private var startTime:Float;
	

	public function new(w:Int, h:Int){
		pixelsInWidth  = Std.int(w / Pixel.SIZE);
		pixelsInHeight = Std.int(h / Pixel.SIZE);
		arPixel = new Array<Pixel>();
		
		// Init Pixel Colors
		Pixel.initColors(Std.int((pixelsInWidth + pixelsInHeight) / 2));
		
		// Init Pixel Flag
		for (i in 0...pixelsInWidth){
			for (j in 0...pixelsInHeight){
				if ((i + j) % 2 == 0){
					arPixel.push(new Pixel(i, j));
				}
			}
		}

		// Init Time
		startTime = System.time;				
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics:Graphics = framebuffer.g2;

		// We change the colors of the flag according to time
		var now = System.time;
		var timeDifference = now - startTime;
		var nextColor = false;
		if(timeDifference > 0.08)
		{
			startTime = now;
			nextColor = true;
		}

		// Drawing
		graphics.begin();
		for (i in 0...arPixel.length){
			if(nextColor) arPixel[i].nextColor();
			arPixel[i].render(graphics);
		}
		graphics.end();
	}
}