package;

import kha.graphics2.Graphics;
import kha.Color;
import Timer;

class Rectangle{

	private var x:Float;
	private var y:Float;
	private var size:Int;	
	public var color:Color;
	public var lastUpdate:Float;

	public function new(?x:Float = 0, ?y:Float = 0, ?size:Int = 16, ?color:Color = Color.White){
		this.x = x;
		this.y = y;
		this.size = size;
		this.color = color;
		lastUpdate = 0;
	}

	public function render(graphics:Graphics){
		graphics.color = color;
		graphics.fillRect(x,y,size,size);
	}
	
	public function overlap(other:Rectangle){
		return x <= other.x + other.size && x + size >= other.x && y <= other.y + other.size && y + size >= other.y;
	}
}
