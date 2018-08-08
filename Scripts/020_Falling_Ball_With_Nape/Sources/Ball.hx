package;

import kha.graphics2.Graphics;
using kha.graphics2.GraphicsExtension;
import kha.Color;
import kha.System;

import nape.space.Space;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Circle;
import nape.phys.Material;


class Ball{
	private var body:Body;
	private var shape:Circle;
	private var radius:Float;

	public function new(space:Space, ?x:Float =0, ?y:Float=0, ?radius:Float=16, ?angle:Float=0){
		this.radius = radius;
		this.body = new Body(BodyType.DYNAMIC, new Vec2(x,y));
		this.body.shapes.add(new Circle(radius));
		body.setShapeMaterials(Material.steel());
		this.body.rotate(new Vec2(x,y), angle);	
		this.body.space = space;		
	}

	public function update(){
		if(body.position.y > System.windowHeight() + radius)
		{
			body.position.set(new Vec2(body.position.x, - radius));
		}
	}

	public function render(graphics:Graphics){
		graphics.pushRotation(body.rotation, body.position.x, body.position.y);
		graphics.color = Color.White;
		graphics.fillCircle(body.position.x, body.position.y, radius);
		graphics.color = Color.Black;
		graphics.fillCircle(body.position.x, body.position.y + radius / 2, radius / 2);
		graphics.popTransformation();
	}
}