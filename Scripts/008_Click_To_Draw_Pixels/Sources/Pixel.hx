package;

import kha.graphics2.Graphics;

class Pixel{
	private var x:Int;
	private var y:Int;
	static public var size:Int = 64;

	public function new(x:Int, y:Int){
		this.x = x;
		this.y = y;
	}

	public static function getOrigin(x:Int, y:Int){
		return { x : Std.int(x / Pixel.size) * Pixel.size, y : Std.int(y / Pixel.size) * Pixel.size};
	}

	public function amIHere(x:Int, y:Int){
		return this.x == x && this.y == y;
	}

	public function render(graphics:Graphics){ 
		graphics.fillRect(x,y,size,size);
	}
}