package;

import kha.audio2.Buffer;
import kha.graphics2.Graphics;
import kha.Assets;
import kha.Color;
import kha.System;
import kha.arrays.Float32Array;

enum TypeOSC{
	Sine;
	Square;
	SawTooth;
	Triangle;
}

class Oscillator {
	private var sampleRate:Float = 48000;
	private var delta:Float = 0.0;
	private var freq0:Float; // current frequency
	private var freq1:Float; // target frequency
	private var data:Float32Array;
	private var type:TypeOSC = Sine;
	private var t:Float = 0;

	public function new(?frequency:Float = 0){
		this.freq0  = frequency;
		this.freq1  = frequency;
		update();
	}

	public function changeType(){
		switch(this.type){
			case Sine 		: this.type = Square;
			case Square 	: this.type = SawTooth;
			case SawTooth : this.type = Triangle;
			case Triangle : this.type = Sine;
			default 			: return;
		}
	}

	public function setFrequency(frequency:Float){
		this.freq1  = frequency;
	}

	private function update(?refresh = false){
		if(refresh) {
			delta = freq0  / sampleRate;
		}
		t += delta;
	}

	private inline static function sign(value:Float):Float {
		return (value >= 0)? 1 : -1;
	}

	private function getValue():Float{
		var value = 0.0;
		switch(this.type){
			case Sine 		: value = Math.sin(2 * Math.PI * t);
			case Square 	: value = sign(Math.sin(2 * Math.PI * t));
			case SawTooth : value = 1 - 4 * Math.abs(Math.round(t - 0.25) - (t - 0.25));
			case Triangle : value = 2 * (t - Math.floor(t + 0.5));
			default 			: 
		}
		return value;
	}

	public function setValue(buffer:Buffer, value:Float):Void{
		for(i in 0...buffer.channels){
			buffer.data.set(buffer.writeLocation, value);
			buffer.writeLocation += 1;
		}
		if (buffer.writeLocation >= buffer.size) {
			buffer.writeLocation = 0;
		}
	}

	public function nextAudioBlock(samples:Int, buffer:Buffer){
		var nbSamples = Std.int(samples/buffer.channels);	
		if(freq1 != freq0)
		{
			var freqIncr = (freq1 - freq0) / nbSamples;
			for (i in 0 ... nbSamples) {
				setValue(buffer,getValue());
				freq0 += freqIncr;
				update(true);
			}
			freq0 = freq1;
		}
		else
		{
			for (i in 0 ... nbSamples) {
				setValue(buffer,getValue());
				update();
			}
		}

		data = buffer.data;
	}



	public inline static function getY(y:Float, height:Int):Float {
			return ((-1 * y) + 1) * height / 2;
	}

	public function render(graphics:Graphics){
		if(this.data == null){
			return;
		}

		graphics.color = Color.White;
		var width = System.windowWidth();
		var height = System.windowHeight();

		var i:Int = 0;
		var y1:Float = 0.0;
		var y2:Float = 0.0;
		var ratioWidth = data.length / width;		
		var pos = 0;
		while(i < width) {
			pos = Std.int(i * ratioWidth);
			if(pos >= data.length) break;
			if(i == 0){
				y1 = getY(data[pos], height);
			}
			y2 = getY(data[pos], height);
			graphics.drawLine(i,y1,i++,y2);			
			y1 = y2;
		}

		graphics.color = Color.Red;
		graphics.font = Assets.fonts.OpenSans;
		graphics.fontSize = 20;
		graphics.drawString("Frequency : " +  freq0 +" Hz", 10, 10);		
	}
}