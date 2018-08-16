package;

import kha.Sound;
import kha.audio2.Audio;
import kha.audio2.Buffer;
import kha.System;
import kha.graphics2.Graphics;
import kha.arrays.Float32Array;
import kha.Assets;

class Metronome{
	private var bpm:Float;
	private var interval:Float;
	private var time:Float;
	private var timeIncr:Float;
	private var samplesPerSecond:Int;
	private var metronomeBuffer:kha.arrays.Float32Array;
	private var metronomeIndex:Int;
	private var play:Bool;

	public function new(){
		setBpm(60);
		Audio.audioCallback = this.init;

		metronomeBuffer = Assets.sounds.Ableton_Metronome.uncompressedData;
		metronomeIndex = 0;

		//this.audioChannel = Audio.play(Assets.sounds.Ableton_Metronome, false);
		//this.audioChannel.pause();
	}

	public function init(samples:Int, buffer:Buffer){
		samplesPerSecond = buffer.samplesPerSecond;
		Audio.audioCallback = nextSample;
		time = 0;
		timeIncr = 1 / samplesPerSecond;
		play = true;
	}

	private function setBufferSample(buffer:Buffer, value:Float):Void{
		for(i in 0...buffer.channels){
			buffer.data.set(buffer.writeLocation, value);
			buffer.writeLocation += 1;
		}
		if (buffer.writeLocation >= buffer.size) {
			buffer.writeLocation = 0;
		}
	}

	public function nextSample(samples:Int, buffer:Buffer){
		var nbSamples = Std.int(samples/buffer.channels);
		for (i in 0 ... nbSamples) {
			time += timeIncr;
			if(time >= interval){
				time = 0;
				metronomeIndex = 0;
				play = true;
			}

			if(play == true){
				setBufferSample(buffer, metronomeBuffer[metronomeIndex]);
				metronomeIndex += 1;
				if(metronomeIndex >= metronomeBuffer.length){
					metronomeIndex = 0;
					play = false;
				}	
			}else{
				setBufferSample(buffer, 0);
			}
			
		}
	}

	public function update():Void {
		var delta:Float = System.time - time;
		if(delta >= interval){
			time = System.time;
		}
	}

	public function setBpm(bpm:Float):Void {
		this.bpm = bpm;
		this.interval = 60 / bpm;
	}

	public function render(graphics:Graphics):Void {
	}
}