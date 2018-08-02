package;

import kha.Framebuffer;
import kha.input.Mouse;
import kha.input.Keyboard;
import kha.input.KeyCode;

class Project {
	public function new(){
			Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, onMouseWheel, onMouseLeave);
			Keyboard.get().notify(onKeyDown, onKeyUp, onKeyPress);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
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
		trace("Key Down : " + keyCode);
	}

	public function onKeyUp(keyCode:KeyCode):Void {
		trace("Key Up : " + keyCode);
	}
	
	public function onKeyPress(key:String):Void {
		trace("Key Press : " + key);
	}
}