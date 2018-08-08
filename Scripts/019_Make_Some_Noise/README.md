# Faire un peu de bruit

Voici un petit script générateur de 3 bruits (Blanc, Rose, Brun).
Ici on utilise kha.audio2

```
import kha.audio2.Audio;
import kha.audio2.Buffer;

Audio.audioCallback = maFonction;
[...]
public function maFonction(samples:Int, buffer:Buffer)
```

Encore Merci à Lewis Lepton pour dont j'ai trouvé un boût de script sur codegists.com 
 
## Liens 
- https://www.codegists.com/snippet/haxe/projecthx_lewislepton_haxe
- https://noisehack.com/generate-noise-web-audio-api/
- http://www.robots.ox.ac.uk/~gari/CODE/NOISE/
