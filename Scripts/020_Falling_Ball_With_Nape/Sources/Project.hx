package;

import kha.Framebuffer;
import kha.System;

import nape.space.Space;
import nape.geom.Vec2;

import Block;
import Ball;

class Project {
	private var space:Space;
	private var arBlock:Array<Block>;
	private var ball:Ball;
	private var time:Float;

	public function new(width:Int,height:Int){
		space = new Space(new Vec2(0,400));
		arBlock = [ for(i in 0...6) 
			new Block(
				space, 
				(i%2 == 0) ? width/2 - 150 : width/2 + 150, 
				100 + i * 100, 
				300, 
				10, 
				(i%2 == 0) ? Math.random() / 2 + 0.2 : - Math.random() / 2 - 0.2
			)
		];

		ball = new Ball(space,width/2-100,-10,16);		

		time = System.time;
	}

	public function getDeltaTime():Float{
		var newTime = System.time;
		var deltaTime = newTime - time;
		time = newTime;
		return deltaTime;
	}

	public function update():Void {
		space.step(getDeltaTime());
		ball.update();
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for(block in arBlock){
			block.render(graphics);
		}
		ball.render(graphics);
		graphics.end();
	}
}