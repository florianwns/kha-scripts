package;

import kha.graphics2.Graphics;
import kha.Color;


class Button {
	public var x:Int;
	public var y:Int;
	public var width:Int;
	public var height:Int;
	public var color:Color;
	public var callback:Void->Void;
	public var isClicked:Bool;

	public function new(x:Int, y:Int, width:Int, height:Int, ?color:Color = Color.White){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
		this.color = color;
		this.callback = null;
		this.isClicked = false;
	}

	public function update(){
	}

	public function render(graphics:Graphics){
		graphics.color = color;
		graphics.fillRect(x,y,width,height);
		if(isClicked){
			graphics.color = Color.Yellow;
			graphics.drawRect(x,y,width,height,2);
		}
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		if(button == 0){
			if(x >= this.x && x <= this.x + this.width && y >= this.y && y <= this.y + this.height){
				if(callback != null) callback();
				this.isClicked = true;
				return;
			}
		}
		this.isClicked = false;
	}
}