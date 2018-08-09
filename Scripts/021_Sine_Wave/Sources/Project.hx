package;

import kha.Framebuffer;
import kha.audio1.Audio;
import kha.Sound;
import kha.arrays.Float32Array;

class Project {
	public function new() {
		var freq = 440;
		var sampleRate = 48000;
		var sound = new Sound();
		sound.uncompressedData = new Float32Array(sampleRate);
		var sampleFreq = sampleRate / freq;
		for (i in 0 ... sound.uncompressedData.length) {
			sound.uncompressedData[i] = Math.sin(i / (sampleFreq / (Math.PI*2)));
		}
		Audio.play(sound, true);
	}

	public function update():Void {
		
	}

	public function render(framebuffer:Framebuffer):Void {
	}
}