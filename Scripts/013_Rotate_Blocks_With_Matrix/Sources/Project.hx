package;

import kha.Framebuffer;
import kha.Color;
import kha.System;
import kha.math.FastMatrix3;
import Block;

class Project {
	public var arBlock:Array<Block>;
	public var arColor:Array<Color>;

	public function new(width:Int,height:Int){
		arColor = [0xddffffff,0xff00ffff];
		arBlock = [];
		for(i in 0...30){
			var size = 32+32*i;
			arBlock.push(new Block(-size/2,-size/2,size,0,arColor[i%arColor.length]));
		}
	}

	public function update():Void {
		for(i in 0...arBlock.length){			
			arBlock[i].angle += i * 0.0005;
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		var center = { x : Std.int(System.windowWidth() / 2), y : Std.int(System.windowHeight() / 2) };
		graphics.begin();
		var i = arBlock.length;
		while(i > 0) {
			var block = arBlock[--i];
			// translation at center and block rotation
			graphics.pushTransformation(new FastMatrix3(
				Math.cos(block.angle), -Math.sin(block.angle), center.x,
				Math.sin(block.angle), Math.cos(block.angle), center.y,
				0, 0, 1));
			graphics.color = block.color;
      graphics.fillRect(block.x,block.y,block.size,block.size);
			graphics.popTransformation();
    }
		graphics.end();
	}
}