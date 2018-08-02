package;

import kha.Framebuffer;
import kha.input.KeyCode;
import kha.Sound;
import kha.audio1.Audio;
import kha.audio1.AudioChannel;
import kha.Assets;

class Project {
	public var sound:Sound;
	public var audioChannel:AudioChannel;

	public function new(){
		sound = Assets.sounds.tone;
		audioChannel = Audio.play(sound, true);
		// => audioChannel = Audio.play(Assets.sounds.tone, true);

		audioChannel.volume = 0.3;
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		
	}

	public function onKeyDown(keyCode:KeyCode):Void {
	}

	public function onKeyUp(keyCode:KeyCode):Void {
	}
}