
import kha.Assets;
import kha.input.KeyCode;

import kha2d.Animation;
import kha2d.Sprite;

enum PlayerState {
	RightWalk;
	LeftWalk;
	RightIdle;
	LeftIdle;
}

class Player extends Sprite {
	
	public var playerState:PlayerState;
	public var animations:Map<PlayerState, Animation>;

	public function new(?x:Float = 0,?y:Float = 0){
		super(Assets.images.playerAnim, 256, 256);
		this.x = x;
		this.y = y;
		
		animations = [
			RightWalk 	=> Animation.createRange( 0,  7,  4),
			LeftWalk 	=> Animation.createRange( 8, 15,  4),
			RightIdle 	=> Animation.createRange(16, 19,  8),
			LeftIdle 	=> Animation.createRange(24, 27,  8)
		];		
		playerState = RightIdle;
	}

	override public function update(){
		super.update();		
		setAnimation(animations[playerState]);
	}

	public function onKeyDown(keyCode:KeyCode){
		switch(keyCode){
			case Left 	: playerState = LeftWalk;
			case Right	: playerState = RightWalk;
			default : return;
		}
	}

	public function onKeyUp(keyCode:KeyCode){
		switch(keyCode){
			case Left 	: playerState = LeftIdle;
			case Right	: playerState = RightIdle;
			default : return;
		}
	}
}