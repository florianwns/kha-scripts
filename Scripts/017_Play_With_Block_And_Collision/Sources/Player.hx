package;

import kha.Color;
import kha.input.KeyCode;
import Timer;
import Rectangle;

@:enum
abstract PlayerState(Int){
	var Idle 			= 0;
	var MoveLeft 	= 1;
	var MoveRight = 2;
	var MoveUp 		= 4;
	var MoveDown 	= 8;

	@:op(A & B)
  public function and(other:PlayerState):PlayerState;

	@:op(A | B)
  public function or(other:PlayerState):PlayerState;

	@:op(~A)
  public function not():PlayerState;

	@:op(A == B)
  public function equals(other:PlayerState):Bool{
		var i = cast(other,Int);
		return this & i == i;
	}
}

class Player extends Rectangle{
	public var speed:Float;
	public var state:PlayerState;
	
	public function new(?x:Float = 0, ?y:Float = 0, ?size:Int = 16, ?color:Color = Color.White, ?speed:Float = 300){
		super(x,y,size,color);
		this.speed = speed;
		this.state = Idle;
	}

	public function update(timer:Timer){
		if(state == MoveLeft){
			x -= Math.round(speed * timer.delta);
		} else if(state == MoveRight){
			x += Math.round(speed * timer.delta);
		}

		if(state == MoveDown){
			y += Math.round(speed * timer.delta);
		}else if(state == MoveUp){
			y -= Math.round(speed * timer.delta);
		}
		trace(x + " : " + y);
	}

	public function onKeyDown(keyCode:KeyCode){
		switch(keyCode){
			case Left : state |= MoveLeft;
			case Right: state |= MoveRight;			
			case Up 	: state |= MoveUp;
			case Down : state |= MoveDown;
			default 	: return;
		}
	}

	public function onKeyUp(keyCode:KeyCode){
		switch(keyCode){
			case Left : state &= ~MoveLeft;
			case Right: state &= ~MoveRight;		
			case Up 	: state &= ~MoveUp;
			case Down : state &= ~MoveDown;
			default : return;
		}
	}
}
	
