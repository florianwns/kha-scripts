# Activer l'anti-aliasing

Pour activer l'anti-aliasing, rajouter le paramètre 'samplesPerPixel' à l'initialisation de votre fenêtre (Main.hx)

```
System.start({
	title:'018_Polygon_And_Anti_Aliasing',
	width:WIDTH,
	height:HEIGHT,
	framebuffer: {
		samplesPerPixel: 10,
	}
},
```


## Liens 
- https://en.wikipedia.org/wiki/Jaggies
- https://en.wikipedia.org/wiki/Spatial_anti-aliasing