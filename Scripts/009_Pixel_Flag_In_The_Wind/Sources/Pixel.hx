package;

import kha.graphics2.Graphics;
import kha.Color;

class Pixel{
	private var x:Int;
	private var y:Int;
	private var colorIndex:Int;

	static public var SIZE:Int = 64;
	static private var COLORS:Array<Color> = [Color.White];

	public function new(x:Int, y:Int){
		this.x = x * SIZE;
		this.y = y * SIZE;	
		this.colorIndex = Std.int((x + y) / 2) % Pixel.COLORS.length;
	}

	static public function initColors(nb:Int){
		if(nb <= 0) return;
		
		var base = Color.White;
		var alphaStep = 0.9 / nb;
		var alpha = 1.0;
		for (i in 0...nb){
			if(i % 2 == 0){
				Pixel.COLORS.push(Color.fromFloats(base.R,base.G,base.B,alpha));			
				alpha -= alphaStep;
			}
			else
			{
				Pixel.COLORS.unshift(Color.fromFloats(base.R,base.G,base.B,alpha));			
			}
		}
	}

	public function nextColor(){
		this.colorIndex = (Pixel.COLORS.length + this.colorIndex - 1) % Pixel.COLORS.length;
	}

	public function render(graphics:Graphics){ 
		graphics.color = Pixel.COLORS[colorIndex];
		graphics.fillRect(x,y,SIZE,SIZE);
	}
}