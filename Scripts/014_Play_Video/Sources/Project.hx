package;

import kha.Framebuffer;
import kha.Video;
import kha.Assets;
import kha.input.Keyboard;
import kha.input.KeyCode;

class Project {
	public var video:Video;
	public var isPlaying:Bool;

	public function new(){
		video = Assets.videos.Interlaced_Crop;		
		isPlaying = false;
		Keyboard.get().notify(onMouseDown,null,null);		
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		graphics.drawVideo(video, 0, 0, video.width(),video.height());
		graphics.end();
	}

	public function onMouseDown(keyCode:KeyCode){
		switch(keyCode){
			case KeyCode.Space 	: playVideo();
			default : return;
		}
	}

	public function playVideo(){
		if(isPlaying){
			video.pause();
			isPlaying = false;			
		}else{
			video.play();
			isPlaying = true;
		}
	}
}