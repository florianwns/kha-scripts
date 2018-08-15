package;

import kha.Sound;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;
import kha.System;
import kha.graphics2.Graphics;
import kha.Assets;

class Metronome{
	private var bpm:Float = 60;
	private var interval:Float = 1;
	private var time:Float;
	public var audioChannel:AudioChannel;

	public function new(){
		this.time = System.time;
		this.audioChannel = Audio.play(Assets.sounds.Ableton_Metronome, false);
		this.audioChannel.pause();
	}

	public function update():Void {
		var delta:Float = System.time - time;
		if(delta >= interval){
			time = System.time;
			this.audioChannel.play();
		}
	}

	public function setBpm(bpm:Float):Void {
		this.bpm = bpm;
		this.interval = 60 / bpm;
	}

	public function render(graphics:Graphics):Void {
	}
}