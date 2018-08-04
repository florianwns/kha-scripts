package;

import kha.graphics2.Graphics;

class Player{

	public var x:Int;
	public var y:Int;
	
	public var speed:Float = 6.0;

	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;

	public function new(){}
	
	public function update(){}

	public function render(graphics:Graphics){
		graphics.fillRect(x,y,32,32);
	}
}