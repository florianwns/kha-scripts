package;

import kha.Framebuffer;
import kha.input.Mouse;

import opfx.audio.Metronome;
import opfx.gui.*;

class Project {
	private var metronome:Metronome = new Metronome();
	private var scrollWheel:ScrollWheel;
	private var tapButton:Button;
	private var tempoText:Text;
	public function new(){
			Mouse.get().notify(onMouseDown, onMouseUp, onMouseMove, onMouseWheel, onMouseLeave);
			scrollWheel = new ScrollWheel(200,200,100,CustomColor.LightBlue, function(){ trace("yeah");});
			tempoText = new Text(Std.string(metronome.getTempo()),300,100,null,20,CustomColor.Pink);
			
			tapButton = new Button(400,200,100,200,CustomColor.Pink, function(){
				metronome.tapTempo();
				tempoText.text = Std.string(metronome.getTempo());
			});
	}

	public function update():Void {
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		scrollWheel.render(graphics);
		tapButton.render(graphics);
		tempoText.render(graphics);
		graphics.end();
	}

	public function onMouseDown(button:Int, x:Int, y:Int):Void {
		scrollWheel.onMouseDown(button,x,y);
		tapButton.onMouseDown(button,x,y);
	}

	public function onMouseUp(button:Int, x:Int, y:Int):Void {
	}

	public function onMouseMove(x:Int, y:Int, cx:Int, cy:Int):Void {
	}

	public function onMouseWheel(direction:Int):Void {
	}

	public function onMouseLeave():Void {
	}
}