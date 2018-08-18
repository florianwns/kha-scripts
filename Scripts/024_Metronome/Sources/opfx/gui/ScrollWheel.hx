package opfx.gui;

import kha.graphics2.Graphics;
import kha.Color;
using kha.graphics2.GraphicsExtension;

class ScrollWheel{
	private var x:Int;
	private var y:Int;
	private var radius:Int;
	private var color:Color;
	private var callback:Void->Void;

	public function new(x:Int, y:Int, radius:Int, color:Color, callback:Void->Void){
		this.x = x;
		this.y = y;
		this.radius = radius;
		this.color = color;
		this.callback = callback;
	}

	public function update(){
	}

	public function render(graphics:Graphics){
		graphics.color = color;
		graphics.fillCircle(x,y,radius);
	}

	public function mouseIsOnMe(x:Int, y:Int):Bool {
		return Math.sqrt(Math.pow(this.x - x, 2) + Math.pow(this.y - y, 2)) <= this.radius;
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Bool {
		if(mouseIsOnMe(x,y))
		{
			if(callback != null) callback();
			return true;
		}
		return false;
	}
}