package;

import kha.Framebuffer;
import kha.input.Mouse;
import Pixel;

class Project {
	private var arPixel:Array<Pixel>;

	public function new(){
		arPixel = new Array<Pixel>();
		Mouse.get().notify(onMouseDown,null,null,null);
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for(pixel in arPixel){
			pixel.render(graphics);
		}
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		switch(button){
			case 0 : createPixel(x,y);
			case 1 : destroyPixel(x,y);
			default : return;
		}
	}

	public function createPixel(x:Int, y:Int){
		var point = Pixel.getOrigin(x,y);
		
		for(i in 0 ... arPixel.length){
			if(arPixel[i].amIHere(point.x,point.y))
			{
				return;			
			}
		}
		arPixel.push(new Pixel(point.x,point.y));
	}

	public function destroyPixel(x:Int, y:Int){
		var point = Pixel.getOrigin(x,y);
		
		for(i in 0 ... arPixel.length){
			if(arPixel[i].amIHere(point.x,point.y))
			{
				arPixel.remove(arPixel[i]);
				return;			
			}
		}
	}
}