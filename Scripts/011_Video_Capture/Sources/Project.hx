package;

import kha.Framebuffer;
import kha.capture.VideoCapture;
import kha.Video;
import kha.System;

class Project {
	private var video:Video;

	public function new(){
		VideoCapture.init(init, error);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		if(video != null)
		{
			graphics.drawVideo(video,0,0,System.windowWidth(),System.windowHeight());
		}
		graphics.end();
	}

	public function init(video:Video){
		this.video = video;
	}

	public function error(){
		trace("Error when initializing the video");
	}
}