# Création d'un métronome

Envie de faire un petit métronome assez basique pour mieux prendre en main les buffer audio.

Au lieu d'utiliser un timer comme je voie sur la plupart des algorithmes du net, ce qui n'est pas vraiment précis je trouve (1/60 => 16 ms) 
Je préfère incrémenter une variable temps au remplissage du buffer, la précision est alors de 1/48000 (nombre de sample par seconde) => 0.02 ms.
La précision est donc nettement meilleure.

## TO DO

### Bugs 


### Liste des évolutions

Au niveau des fonctionnalités futures : 
- Changer de son
- Taper le tempo sur l'écran au clic ou touch
- Ajouter le pan et le volume
- Renseigner le tempo de manière numérique (chiffre à virgule)
- Incrémenter le tempo en faisant un slide
- Avoir le nom des tempos en italien avec leur correspondance.
- Pouvoir mettre des temps fort où l'on souhaite sur les beats
- Implémentation des divisions de temps 4 / 8 
- Un boutton play / stop
- Lumière flash en fond d'écran sur le beat


## Liens 
- https://fr.wikipedia.org/wiki/Tempo