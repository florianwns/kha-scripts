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
		var frequency = computeFrequency(x);
		oscillator.setFrequency(frequency);
	}

	public function computeFrequency(x:Int, ?min:Float = 20, max:Float = 800):Float{
		var width = System.windowWidth();
		var ratio = Math.min(width,Math.max(0,x)) / width;
		return min + (max - min) * ratio;
	}
}