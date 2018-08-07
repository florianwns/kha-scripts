package;

import kha.Framebuffer;
import kha.input.Keyboard;
import kha.input.KeyCode;
import Player;

class Project {
	public var player:Player;

	public function new(width:Int,height:Int){
		player = new Player(width/2 - 128,height/2 - 128);
		Keyboard.get().notify(onKeyDown,onKeyUp);
	}

	public function update():Void {
		player.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}

	public function onKeyDown(keyCode:KeyCode){
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode){
		player.onKeyUp(keyCode);
	}

}