package;

import kha.Framebuffer;
import kha.System;
import kha.Color;
import kha.Assets;
import kha.graphics2.Graphics;
import kha.input.Mouse;

import zui.Zui;
import zui.Id;

import Ball;

class Project {
	public var arBall:Array<Ball>;
	public var ui:Zui;
	public var size:Float;
	public var segments:Int;
	public static var SPEED:Float = 6;

	public function new(windowWidth, windowHeight){
		size = 16;
		segments = 0;
		addBall(size, size);
		
		ui = new Zui({ font: Assets.fonts.Abel_Regular, khaWindowId: 0, scaleFactor: 1.0 });
		Mouse.get().notify(onMouseDown, null, null, null);
	}

	public function update():Void {
		var windowWidth = System.windowWidth();
		var windowsHeight = System.windowHeight();
		for(i in 0...arBall.length){
			arBall[i].update();
			bounce(arBall[i], windowWidth, windowsHeight);
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		for(i in 0...arBall.length){
			arBall[i].render(graphics);
		}
		graphics.end();

		gui(graphics);
	}

	public function gui(graphics:Graphics):Void {
		ui.begin(graphics);
		if(ui.window(Id.handle(), 0, 0, 300, 300, true)) {
			if(ui.panel(Id.handle({selected:true}), 'Parameters')){
				updateSize(ui.slider(Id.handle({value: size}),'Size', 6, 50, true, 1, true));
				updateSegments(ui.slider(Id.handle({value: segments}),'Segments', 0, 20, true, 1, true));
			}
		}
		ui.end();		
	}

	public function bounce(ball:Ball, windowWidth:Int, windowsHeight:Int){
		if(ball.x < ball.size || ball.x > windowWidth - ball.size){
			ball.dirX = -ball.dirX;
		}

		if(ball.y < ball.size || ball.y > windowsHeight - ball.size){
			ball.dirY = -ball.dirY;
		}
	}

	public function updateSize(size:Float)
	{
		if(this.size != size){
			this.size = size;
			for(i in 0...arBall.length){
				arBall[i].size = this.size;
			}
		}
	}

	public function updateSegments(segments:Float)
	{
		if((segments == 0 || segments >= 3) == false) return;
		
		var iSegments = Std.int(segments);
		if(this.segments != iSegments){
			this.segments = iSegments;
			for(i in 0...arBall.length){
				arBall[i].segments = this.segments;
			}
		}
	}

	public function addBall(x:Float, y:Float)
	{
		if(x < 0 || y < 0) return;
		if(arBall == null) arBall = [];
		var windowWidth = System.windowWidth();
		var windowsHeight = System.windowHeight();

		arBall.push(new Ball(
				(x < size)? size : (x > windowWidth - size)? windowWidth - size : x, 
				(y < size)? size : (y > windowsHeight - size) ? windowsHeight - size : y,
				Project.SPEED, 
				Project.SPEED,
				size,
				segments,
				Color.fromFloats(Math.random(),Math.random(),Math.random(),0.8)));
	}

	public function removeBall()
	{
		if(arBall == null || arBall.length == 0) return;
		arBall.pop();
	}

	public function onMouseDown(button:Int, x:Int, y:Int){
		if(button == 0){
			addBall(x,y);
		}else if(button == 1){
			removeBall();
		}
	}	
}