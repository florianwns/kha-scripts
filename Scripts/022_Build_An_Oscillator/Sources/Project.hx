package;

import kha.Framebuffer;
import kha.audio2.Audio;
import kha.input.Mouse;
import kha.System;
import Oscillator;

class Project {
	public var oscillator:Oscillator;
	
	public function new() {
		oscillator = new Oscillator();
		Audio.audioCallback = oscillator.nextAudioBlock;
		Mouse.get().notify(onMouseDown, null, onMouseMove, null);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		oscillator.render(graphics);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		if(button ==0) oscillator.changeType();
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){
		var freqMin = 20;
		var freqMax = 1000;
		var width = System.windowWidth();
		var ratio = Math.min(width,Math.max(0,x)) / width;
		oscillator.targetFrequency = freqMin + (freqMax - freqMin) * ratio;
	}
}