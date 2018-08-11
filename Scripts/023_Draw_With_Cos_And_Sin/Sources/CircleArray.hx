package;

import kha.graphics2.Graphics;

@:forward(push, pop, length, iterator)
abstract CircleArray(Array<Circle>) {
  public inline function new(?length:Int = 40, ?size:Int = 5) {
    this = [for(i in 0...length) new Circle(0,0,size)];
  }

	@:arrayAccess
	public inline function get(key:Int) {
		return this[key];
	}

	public function update():Void {
	}

	public function render(graphics:Graphics){
		for(circle in this){
			circle.render(graphics);
		}
	}	
}