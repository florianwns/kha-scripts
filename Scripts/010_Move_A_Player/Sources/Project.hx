package;

import kha.Framebuffer;
import kha.input.Keyboard;
import kha.input.KeyCode;
import kha.input.Gamepad;
import kha.System;

import Player;

class Project {
	public var player:Player;

	public function new(){
		player = new Player();
		Keyboard.get().notify(onKeyDown, onKeyUp, null);
		Gamepad.get().notify(onGamepadAxis, null);
	}

	public function update():Void {
		if(player.up){
			player.y -= Math.round(player.speed);
		}else if(player.down){
			player.y += Math.round(player.speed);
		}

		if(player.left){
			player.x -= Math.round(player.speed);
		}else if(player.right){
			player.x += Math.round(player.speed);
		}

		bounds();		
	}

	public function bounds():Void{
		if(player.x < 0){
			player.x = 0;
		}
		if(player.y < 0){
			player.y = 0;
		}

		var windowWidth = System.windowWidth();
		if(player.x + player.width > windowWidth){
			player.x = windowWidth - player.width;
		}

		var windowHeight = System.windowHeight();
		if(player.y + player.height > windowHeight){
			player.y = windowHeight - player.height;
		}

	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode){
		switch(keyCode){
			case Up    : player.up 	  = true;
			case Down  : player.down  = true;
			case Left  : player.left  = true;
			case Right : player.right = true;
			case Escape : System.stop();
			default: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode){
		switch(keyCode){
			case Up    : player.up 	  = false;
			case Down  : player.down  = false;
			case Left  : player.left  = false;
			case Right : player.right = false;
			default: return;
		}
	}

	public function onGamepadAxis(axis:Int, value:Float){
		if(axis == 0){
			player.left = (value <= -0.5);
			player.right = (value >= 0.5);
		} else if(axis == 1){
			player.down = (value <= -0.5);
			player.up = (value >= 0.5);
		}
	} 
}