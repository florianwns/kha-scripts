package;

import kha.Framebuffer;
import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.Color;
import Rectangle;
import Player;
import Timer;

class Project {
	public var player:Player;
	public var arBlock:Array<Rectangle>;
	public var timer:Timer;

	public function new(width:Int, height:Int){
		timer = new Timer();		
		player = new Player(0,0,32,Color.Red, 300);

		var blockSize = 16;
		var blocksInWidth  = Std.int(width / blockSize);
		var blocksInHeight = Std.int(height / blockSize);
		arBlock = [];
		for (i in 0...blocksInWidth){
			for (j in 0...blocksInHeight){
				if ((i + j) % 2 == 0){
					arBlock.push(new Rectangle(i * blockSize, j * blockSize, blockSize, Color.White));
				}
			}
		};
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void{
		timer.update();
		player.update(timer);

		for(block in arBlock){
			if(player.overlap(block)){
				block.color = Color.Red;
				block.lastUpdate = timer.time;
			} else if(timer.time > block.lastUpdate + 3){
				block.color = Color.White;
			}
		}
	}

	public function render(framebuffer:Framebuffer):Void{
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		for(block in arBlock){
			block.render(graphics);
		}
		graphics.end();
	}

	
	public function onKeyDown(keyCode:KeyCode){
		player.onKeyDown(keyCode);
	}

	public function onKeyUp(keyCode:KeyCode){
		player.onKeyUp(keyCode);
	}
}