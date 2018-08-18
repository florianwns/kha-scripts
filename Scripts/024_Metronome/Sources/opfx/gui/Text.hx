package opfx.gui;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.graphics2.VerTextAlignment;
import kha.graphics2.HorTextAlignment;
import kha.Assets;
import kha.Font;
import kha.Color;

class Text{
	public var text:String;	
	private var x:Int;
	private var y:Int;
	private var font:Font;
	private var fontSize:Int;
	private var color:Color;

	public function new(text:String, x:Int, y:Int, ?font:Font, ?fontSize:Int = 20, ?color:Color = Color.White){
		this.text = text;
		this.x = x;
		this.y = y;
		this.font = (font != null) ? font : Assets.fonts.digital;
		this.fontSize = fontSize;
		this.color = color;
	}

	public function update(){
	}

	public function render(graphics:Graphics){
		graphics.color = color;
		graphics.fontSize = fontSize;
		graphics.font = font;
		graphics.drawAlignedString(text,x,y,HorTextAlignment.TextCenter,VerTextAlignment.TextMiddle);
	};	
}