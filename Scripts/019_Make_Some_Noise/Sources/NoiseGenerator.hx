package;

import kha.audio2.Buffer;

enum Noise{
	None;
	White;
	Pink;
	Brown;
}


class NoiseGenerator {
	private var noise:Noise;

	public function new(){
		this.noise = None;
	}

	public function setNoise(noise:Noise){
		this.noise = noise;
	}

	public function render(samples:Int, buffer:Buffer){
		switch(noise){
			case White : whiteNoise(samples, buffer);
			case Pink  : pinkNoise(samples, buffer);
			case Brown : brownNoise(samples, buffer);
			case None  : emptyNoise(samples, buffer); 
			default : return;			
		}
	}

	public function emptyNoise(samples:Int, buffer:Buffer){
		for (i in 0 ... samples) {
			buffer.data.set(buffer.writeLocation, 0);
			buffer.writeLocation += 1;
			if (buffer.writeLocation >= buffer.size) {
				buffer.writeLocation = 0;
			}
		}
	}

	public function whiteNoise(samples:Int, buffer:Buffer){
		for (i in 0 ... samples) {
			var white = Math.random() * 2 - 1;
			buffer.data.set(buffer.writeLocation, white);
			buffer.writeLocation += 1;
			if (buffer.writeLocation >= buffer.size) {
				buffer.writeLocation = 0;
			}
		}
	}

	public function pinkNoise(samples:Int, buffer:Buffer){
		var b0:Float = 0;
		var b1:Float = 0;
		var b2:Float = 0;
		var b3:Float = 0;
		var b4:Float = 0;
		var b5:Float = 0;
		var b6:Float = 0;
		for (i in 0 ... samples) {
			var white = Math.random() * 2 - 1;
			b0 = 0.99886 * b0 + white * 0.0555179;
			b1 = 0.99332 * b1 + white * 0.0750759;
			b2 = 0.96900 * b2 + white * 0.1538520;
			b3 = 0.86650 * b3 + white * 0.3104856;
			b4 = 0.55000 * b4 + white * 0.5329522;
			b5 = -0.7616 * b5 - white * 0.0168980;
			var pink:Float = b0 + b1 + b2 + b3 + b4 + b5 + b6 + white * 0.5362;
			b6 = white * 0.115926;
			buffer.data.set(buffer.writeLocation, pink * 0.11);
			buffer.writeLocation += 1;
			if (buffer.writeLocation >= buffer.size) {
				buffer.writeLocation = 0;
			}
		}
	}

	public function brownNoise(samples:Int, buffer:Buffer){
		var latest = 0.0;
		for(i in 0 ... samples){
			var white = Math.random() * 2 - 1;
			var brown = (latest + (0.02 * white)) / 1.02;			
			latest = brown; 
			buffer.data.set(buffer.writeLocation, brown);
			buffer.writeLocation += 1;
			if(buffer.writeLocation >= buffer.size){
				buffer.writeLocation = 0;
			}
		}
	}
}