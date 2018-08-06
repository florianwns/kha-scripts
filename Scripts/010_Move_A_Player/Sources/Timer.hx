package;

import kha.Scheduler;
import kha.graphics2.Graphics;
import kha.Color;
import kha.Assets;

class Timer{
	public var delta:Float;
	public var time:Float;
	
	public function new():Void{
		delta = 0.0;
		time = Scheduler.time();
	}

	public function update():Void{
		var newTime = Scheduler.time();
		delta = newTime - time;
		time = newTime;
	}

	public function render(graphics:Graphics):Void{
			graphics.color = Color.White;
			graphics.font = Assets.fonts.OpenSans; 
			graphics.fontSize = 20;
			graphics.drawString("Time : " + time, 10, 10);
			graphics.drawString("Delta Time : " + delta, 10, 30);
	}
}