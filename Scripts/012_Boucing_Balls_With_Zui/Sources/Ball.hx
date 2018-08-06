package;

import kha.graphics2.Graphics;
import kha.Color;

using kha.graphics2.GraphicsExtension;

class Ball{
	public var x:Float;
	public var y :Float;
	public var dirX:Float;
	public var dirY:Float;
	public var size:Float;
	public var segments:Int;
	public var color:Color;

	public function new(x:Float, y:Float, ?dirX:Float = 6, ?dirY:Float = 6, ?size:Float= 16, ?segments:Int = 0, ?color:Color = Color.White){
		this.x = x;
		this.y = y;
		this.dirX = dirX;
		this.dirY = dirY;
		this.size = size;
		this.color = color;
		this.segments = segments;
	}

	public function update(){
		x += dirX;
		y += dirY;
	}

	public function render(graphics:Graphics){
		graphics.color = color;
		GraphicsExtension.fillCircle(graphics, x, y, size, segments);
	}

}