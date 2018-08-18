package opfx.gui;

import kha.graphics2.Graphics;
import kha.Color;

class Button{
	private var x:Int;
	private var y:Int;
	private var width:Int;
	private var height:Int;
	private var color:Color;
	private var callback:Void->Void;

	public function new(x:Int, y:Int, width:Int, height:Int, color:Color, callback:Void->Void){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.color = color;
		this.callback = callback;
	}

	public function update(){
	}

	public function render(graphics:Graphics){
		graphics.color = color;
		graphics.fillRect(x,y,width,height);
	}

	public function mouseIsOnMe(x:Int, y:Int):Bool {
		return this.x < x  && this.y < y && this.x + this.width >= x && this.y + this.height >= y;
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