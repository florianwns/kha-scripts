package;

import kha.Framebuffer;
import kha.System;
import kha.Color;
import kha.graphics2.Graphics;

class Project {
	private var pixelsInWidth:Int;
	private var pixelsInHeight:Int;
	private var start:Float;
	private var goUp:Bool;
	public static var SIZE:Int = 8;

	public function new(w:Int, h:Int){
		pixelsInWidth  = Std.int(w / SIZE);
		pixelsInHeight = Std.int(h / SIZE);
		start = System.time;		
		goUp = true;
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics:Graphics = framebuffer.g2;
		var now = System.time;
		var diff = now - start;
	
		if(diff > 0.3){
			goUp = !goUp;
			start = now;
		}
		
		graphics.begin();
		var alpha = diff % 1.0;
		for (i in 0...pixelsInWidth){
			for (j in 0...pixelsInHeight){
				if ((i + j) % 2 == 0){
					graphics.color = Color.fromFloats(1.0, 1.0, 1.0, (goUp)? alpha : 1 - alpha);
					graphics.fillRect(i * SIZE, j * SIZE, SIZE, SIZE);		
				}
			}
		}
	
		graphics.end();
	}
}