package;

import kha.Framebuffer;
import Metronome;

class Project {
	private var metronome:Metronome = new Metronome();
	public function new(){
	}

	public function update():Void {
		metronome.update();
	}

	public function render(framebuffer:Framebuffer):Void {
	}
}