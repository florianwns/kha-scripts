package;

import kha.Framebuffer;
import kha.audio2.Audio;
import kha.input.Mouse;
import kha.Color;
import NoiseGenerator;
import Button;

class Project {
	public var noiseGenerator:NoiseGenerator;
	public var arButton:Array<Button>;
	
	public function new() {
		noiseGenerator = new NoiseGenerator();
		Audio.audioCallback = noiseGenerator.render;
		var arColor = [0xff222222,Color.White,Color.Pink,0xff625c27];
		arButton = [for(i in 0...arColor.length) new Button(10 , 10 + i * 30, 200, 30, arColor[i])];
		arButton[0].callback = function(){ noiseGenerator.setNoise(Noise.None); };
		arButton[1].callback = function(){ noiseGenerator.setNoise(Noise.White); };
		arButton[2].callback = function(){ noiseGenerator.setNoise(Noise.Pink); };
		arButton[3].callback = function(){ noiseGenerator.setNoise(Noise.Brown); };
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for(i in 0...arButton.length){
			arButton[i].render(graphics);
		}
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		for(i in 0...arButton.length){
			arButton[i].onMouseDown(button,x,y);
		}
	}
}