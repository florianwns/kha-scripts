package;

import kha.Framebuffer;
import kha.Assets;
import kha.input.Mouse;
import kha.input.Keyboard;
import kha.input.KeyCode;
import kha.graphics2.Graphics;
import kha.Color;
import kha.System;

class Project {
	public var arrows:Array<Bool>;
	public var text:String;

	public function new(){
			Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, onMouseWheel, onMouseLeave);
			Keyboard.get().notify(onKeyDown, onKeyUp, onKeyPress);
			arrows = [false,false,false,false]; // up, right, down, left
			text = "";
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		drawGraphics(framebuffer.g2);
	}

	private function drawGraphics(g:Graphics){
		g.begin();
		{
			g.color = Color.White;
			g.font = Assets.fonts.OpenSans;
			g.fontSize = 25;
			var w = kha.System.windowWidth();
			var h = kha.System.windowHeight();

			if(arrows[0] == true) g.drawString("UP", w / 2, h / 4);
			if(arrows[1] == true) g.drawString("RIGHT", w * 3/4, h / 2);
			if(arrows[2] == true) g.drawString("DOWN", w / 2, h * 3/4);
			if(arrows[3] == true) g.drawString("LEFT", w / 4, h / 2);
			if(text != ""){
				g.drawString(text, 10, 10);
				//this.text = "";
			}
		}
		g.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		trace("Mouse Down : " + button);
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
		trace("Mouse Up : " + button);
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int):Void {
	}

	public function onMouseWheel(direction:Int):Void {
		trace(direction); // -[1, 1]
	}

	public function onMouseLeave():Void {
		trace("Mouse Leave");
	}

	public function onKeyDown(keyCode:KeyCode):Void {
		switch(keyCode){
			case KeyCode.Up 		: arrows[0] = true;
			case KeyCode.Right 	: arrows[1] = true;
			case KeyCode.Down  	: arrows[2] = true;
			case KeyCode.Left  	: arrows[3] = true;
			case Escape : System.stop();
			default: return; // Important 
		}
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		switch(keyCode){
			case KeyCode.Up 		: arrows[0] = false;
			case KeyCode.Right 	: arrows[1] = false;
			case KeyCode.Down  	: arrows[2] = false;
			case KeyCode.Left  	: arrows[3] = false;			
			default: return; // Important 
		}
	}
	
	public function onKeyPress(key:String):Void {
		this.text += key;
	}
}