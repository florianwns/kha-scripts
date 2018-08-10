package;

import kha.audio2.Buffer;
import kha.graphics2.Graphics;
import kha.Assets;
import kha.Color;
import kha.System;
import kha.arrays.Float32Array;

class Oscillator {
	public var currentSampleRate:Float;
	public var currentAngle:Float;
	public var angleDelta:Float;
	public var currentFrequency:Float;
	public var targetFrequency:Float;
	public var bufferData:Float32Array;

	public function new(?frequency:Float = 0){
		this.currentSampleRate = 48000;
		this.currentAngle = 0.0;
		this.angleDelta = 0.0;
		this.currentFrequency  = frequency;
		this.targetFrequency   = frequency;
		updateAngleDelta();
	}

	public function updateAngleDelta(){
		var cyclesPerSample:Float = this.currentFrequency  / this.currentSampleRate;
		this.angleDelta = cyclesPerSample * 2 * Math.PI;
	}

	public function nextAudioBlock(samples:Int, buffer:Buffer){
		var nbSamples = Std.int(samples/buffer.channels);	
		var localTargetFrequency = this.targetFrequency;
		if(this.targetFrequency != this.currentFrequency)
		{
			var frequencyIncrement = (localTargetFrequency - this.currentFrequency) / nbSamples;

			for (i in 0 ... nbSamples) {
				var currentSample = Math.sin(currentAngle);
				this.currentFrequency += frequencyIncrement;
				updateAngleDelta();
				this.currentAngle += angleDelta;
				buffer.data.set(buffer.writeLocation, currentSample);
				buffer.writeLocation += 1;
				buffer.data.set(buffer.writeLocation, currentSample);
				buffer.writeLocation += 1;
				if (buffer.writeLocation >= buffer.size) {
					buffer.writeLocation = 0;
				}
			}

			this.currentFrequency = localTargetFrequency;
		}
		else
		{
			for (i in 0 ... nbSamples) {
				var currentSample = Math.sin(currentAngle);
				this.currentAngle += angleDelta;
				buffer.data.set(buffer.writeLocation, currentSample);
				buffer.writeLocation += 1;
				buffer.data.set(buffer.writeLocation, currentSample);
				buffer.writeLocation += 1;
				if (buffer.writeLocation >= buffer.size) {
					buffer.writeLocation = 0;
				}
			}
		}

		this.bufferData = buffer.data;
	}

	public inline static function getY(y:Float, height:Int):Float {
			return ((-1 * y) + 1) * height / 2;
	}

	public function render(graphics:Graphics){
		if(this.bufferData == null){
			return;
		}

		graphics.color = Color.White;
		var width = System.windowWidth();
		var height = System.windowHeight();

		var i:Int = 0;
		var y1:Float = 0.0;
		var y2:Float = 0.0;
		var ratioWidth = this.bufferData.length / width;		
		var pos = 0;
		while(i < width) {
			pos = Std.int(i * ratioWidth);
			if(pos >= this.bufferData.length) break;

			if(i == 0){
				y1 = getY(this.bufferData[pos], height);
			}
			y2 = getY(this.bufferData[pos], height);
			graphics.drawLine(i,y1,i++,y2);			
			y1 = y2;
		}

		graphics.color = Color.Red;
		graphics.font = Assets.fonts.OpenSans;
		graphics.fontSize = 20;
		graphics.drawString("Frequency : " +  this.currentFrequency +" Hz", 10, 10);		
	}
}