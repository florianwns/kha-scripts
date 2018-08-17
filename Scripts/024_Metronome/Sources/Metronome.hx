package;

import kha.Sound;
import kha.audio2.Audio;
import kha.audio2.Buffer;
import kha.System;
import kha.graphics2.Graphics;
import kha.arrays.Float32Array;
import kha.Assets;


// https://fr.wikipedia.org/wiki/Tempo

class Metronome{
	private var beats:Array<Bool>; // True is UpBeat, False is DownBeat
	private var beatIndex = 0;
	private var playBeat:Bool = true;

	private var downBeatBuffer:kha.arrays.Float32Array;	
	private var upBeatBuffer:kha.arrays.Float32Array;	
	private var beatBufferIndex:Int = 0;
	
	private var bpm:Float;
	private var interval:Float;
	private var time:Float;
	private var timeIncr:Float;
	private var samplesPerSecond:Int;
	

	public function new(){
		beats = [for(i in 0...4) i == 0];
		trace(beats);
		setBpm(120);
		Audio.audioCallback = this.init;

		downBeatBuffer 	= Assets.sounds.Cubase_Metronome.uncompressedData;
		upBeatBuffer 		= Assets.sounds.Cubase_MetronomeUp.uncompressedData;
	}

	public function init(samples:Int, buffer:Buffer){
		samplesPerSecond = buffer.samplesPerSecond;
		Audio.audioCallback = nextSample;
		time = 0;
		timeIncr = 1 / samplesPerSecond;
	}

	private function updateBeat(){
		beatIndex = (beatIndex + 1) % beats.length;
		playBeat = true;
		beatBufferIndex = 0;
		time = 0;		
		trace(beatIndex);
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
			if(time >= interval){
				updateBeat();
			}
			time += timeIncr;			

			if(playBeat == true){
				var tmpBuffer = (beats[beatIndex])? upBeatBuffer : downBeatBuffer;
				setBufferSample(buffer, tmpBuffer[beatBufferIndex]);
				beatBufferIndex += 2; // Always 2 Channels by Sound => /kha/Sound.hx:28
				if(beatBufferIndex >= tmpBuffer.length){
					beatBufferIndex = 0;
					playBeat = false;
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