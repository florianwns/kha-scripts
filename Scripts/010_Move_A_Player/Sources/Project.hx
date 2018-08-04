package;

import kha.Framebuffer;
import kha.input.Keyboard;
import kha.input.KeyCode;
import Player;

class Project {
	public var player:Player;

	public function new(){
		player = new Player();
		Keyboard.get().notify(onKeyDown, onKeyUp, null);
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
}