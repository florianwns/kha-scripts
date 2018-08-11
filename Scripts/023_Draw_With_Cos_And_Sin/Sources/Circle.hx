package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;

class Circle{
	public var x:Float;
	public var y:Float;
	public var size:Float;

	public function new(?x:Float = 0, ?y:Float = 0, ?size:Float = 10){
		this.x = x;
		this.y = y;
		this.size = size;
	}

	public function update(){
	}

	public function render(graphics:Graphics){
		graphics.fillCircle(x,y,size);
	}

}