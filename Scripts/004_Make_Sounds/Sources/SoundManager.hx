package;

import kha.Sound;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;

class SoundManager{
	public var sound:Sound;
	public var audioChannel:AudioChannel;
	public var isPlaying:Bool;

	public function new(sound:Sound){
		this.sound = sound;
		this.audioChannel = Audio.play(this.sound, true);
		this.audioChannel.pause();
		this.isPlaying = false;
	}

	public function play(value:Bool){
		if(isPlaying == value) return;

		if(value) audioChannel.play();
		else audioChannel.pause();

		isPlaying = value;
	}
}