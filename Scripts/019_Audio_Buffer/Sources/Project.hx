package;

import kha.Framebuffer;
import kha.Color;
import kha.Assets;
import kha.audio2.Audio;
import kha.audio2.Buffer;

class Project {
	public function new() {
		Audio.audioCallback = DSP;
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.end();
	}

	public function DSP(samples:Int, buffer:Buffer){
		for (i in 0 ... samples) {
			buffer.data.set(buffer.writeLocation, Math.random() * 2 - 1);
			buffer.writeLocation += 1;
			if (buffer.writeLocation >= buffer.size) {
				buffer.writeLocation = 0;
			}
		}
	}
}