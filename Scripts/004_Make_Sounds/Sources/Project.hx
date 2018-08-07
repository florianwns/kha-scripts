package;

import kha.Framebuffer;
import kha.Assets;
import kha.System;
import kha.Color;
import zui.Zui;
import zui.Id;
import SoundManager;

class Project {
	public var ui:Zui;
	public var arSoundManager:Array<SoundManager>;
	public var arColor:Array<Color>;

	public function new(){
		arSoundManager = [
			new SoundManager(Assets.sounds.Alien),
			new SoundManager(Assets.sounds.Alien1),
			new SoundManager(Assets.sounds.bubbles1),
			new SoundManager(Assets.sounds.bubbles2)
		];

		arColor = [Color.White,Color.Cyan,Color.Magenta,Color.Orange];
		
		ui = new Zui({ font : Assets.fonts.Abel_Regular, khaWindowId : 0, scaleFactor : 1.0});
	}


	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var windowHeight = System.windowHeight();
		var graphics = framebuffer.g2;
		graphics.begin();
		for(i in 0...arSoundManager.length){
			var c = arColor[i % arColor.length];
			graphics.color = Color.fromFloats(c.R, c.G, c.B, arSoundManager[i].audioChannel.volume);
			graphics.fillRect(200 + i * 100, 0, 100, arSoundManager[i].audioChannel.position / arSoundManager[i].audioChannel.length * windowHeight);
		}			
		graphics.end();

		ui.begin(graphics);
		if(ui.window(Id.handle(),0,0,200,windowHeight)){
			if(ui.panel(Id.handle({selected:true}),'Sound Manager')){
				arSoundManager[0].audioChannel.volume = ui.slider(Id.handle({value: 1.0}), 'volume', 0.0, 1.0, true);
				arSoundManager[0].play(ui.check(Id.handle(), 'off/on'));
				arSoundManager[1].audioChannel.volume = ui.slider(Id.handle({value: 1.0}), 'volume', 0.0, 1.0, true);
				arSoundManager[1].play(ui.check(Id.handle(), 'off/on'));
				arSoundManager[2].audioChannel.volume = ui.slider(Id.handle({value: 1.0}), 'volume', 0.0, 1.0, true);
				arSoundManager[2].play(ui.check(Id.handle(), 'off/on'));
				arSoundManager[3].audioChannel.volume = ui.slider(Id.handle({value: 1.0}), 'volume', 0.0, 1.0, true);
				arSoundManager[3].play(ui.check(Id.handle(), 'off/on'));
			}
		}
		ui.end();
	}
}