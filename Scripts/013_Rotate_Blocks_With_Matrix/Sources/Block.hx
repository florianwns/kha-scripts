import kha.Color;

class Block{
	public var x:Float;
	public var y:Float;
	public var size:Float;
	public var angle:Float;
	public var color:Color;

	public function new(x:Float, y:Float, ?size:Float = 16, ?angle:Float = 0, ?color:Color = Color.White){
		this.x = x;
		this.y = y;
		this.size = size;
		this.angle = angle;
		this.color = color;
	}
}