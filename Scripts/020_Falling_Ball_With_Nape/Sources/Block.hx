package;


import kha.graphics2.Graphics;
import kha.Color;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;

class Block{
	private var body:Body;
	private var shape:Polygon;
	private var width:Float;
	private var height:Float;

	public function new(space:Space, ?x:Float =0, ?y:Float=0, ?width:Float=16, ?height:Float=16, ?angle:Float=0){
		this.width = width;
		this.height = height;
		this.body = new Body(BodyType.STATIC, new Vec2(x,y));
		this.body.shapes.add(new Polygon(Polygon.box(width,height)));
		this.body.rotate(new Vec2(x,y), angle);	
		this.body.space = space;		
	}

	public function update(){
	}

	public function render(graphics:Graphics){
		graphics.color = Color.White;
		graphics.pushRotation(body.rotation, body.position.x, body.position.y);
		graphics.fillRect(body.position.x - width / 2, body.position.y - height / 2, width, height);
		graphics.popTransformation();
	}
}