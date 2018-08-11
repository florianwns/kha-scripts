package;

import kha.Framebuffer;
import kha.System;
import kha.Scheduler;
import kha.Color;
import kha.input.Mouse;
import CircleArray;

class Project {
	public var arCircleArray:Array<CircleArray>;
	public var arGetY:Array<Float->Float>;
	public var arColor:Array<Color> = [Color.White, Color.Cyan, Color.Purple, Color.Green];
	public var amplitude:Float = 0;
	public var amplitudeTarget:Float = 0;

	public function new(){
		arGetY = [
			Math.sin, 
			Math.cos, 
			function(x:Float){ return Math.sin(x +  Math.PI);},
			function(x:Float){ return Math.cos(x +  Math.PI);}];
		
		arCircleArray = [for(i in 0...arGetY.length) new CircleArray()];

		Mouse.get().notify(null,null,onMouseMove,null);
	}

	public function update():Void {
		// Smooth amp
		if(amplitude != amplitudeTarget){
			var amplitudeIncr = (amplitudeTarget - amplitude) / 60;
			amplitude += amplitudeIncr;
		}

		for(k in 0...arCircleArray.length){	
			var arCircle = arCircleArray[k];
			
			var distance = System.windowWidth() / 2 / arCircle.length;
			var delta = 2 * Math.PI / arCircle.length;
			var middle = System.windowHeight() / 2;
			var time = Scheduler.time();

			for(i in 0...arCircle.length){
				arCircle[i].x = distance + 2 * i * distance;
				arCircle[i].y = middle + (arGetY[k](i * delta + time) * (middle - arCircle[i].size) * amplitude);
			}
		}		
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		var i = 0;
		for(arCircle in arCircleArray){
			graphics.color = arColor[i++ % arColor.length];
			arCircle.render(graphics);
		}
		graphics.end();
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int){
			var amp = Math.max(0,Math.min(System.windowHeight(), y)) / System.windowHeight();
			amplitudeTarget =  2 * Math.abs(0.5 - amp);
	}
}