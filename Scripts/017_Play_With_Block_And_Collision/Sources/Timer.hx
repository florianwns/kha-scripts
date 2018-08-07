package;

import kha.Scheduler;

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
}