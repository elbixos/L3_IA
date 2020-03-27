# Principe des algorithmes de descente stochastiques
(niveau 1)

## Principe de base

Par algorithme de descente, j'entends un algo qui cherche le minimum
d'une fonction.

Ils sont tous basés sur le principe suivant, avec des variantes (voir [Algos de
descente](algosDescente.md)), que l'on a déja vu dans le [cours 2](../02_cours2.md) :

```python
configTestee = pointDepart # pointDepart peut, au pire, etre choisi aléatoirement

bestResu = math.inf
bestConfig = None
n=0
while (bestResu > valMin or n> nMax):
  print (configTestee, bestConfig, bestResu)

  resu = aMinimiser(configTestee)
  if resu < bestResu:
    bestConfig = configTestee
    bestResu = resu

  configTestee = genererNouvelleConfig(bestConfig, pas)
  n+=1
```

Imaginons que je souhaite trouver le minimum de la fonction suivante.

![fonction a minimiser](../images/aMinimiser.png)

Ce qui nous intéresse est cette fonction *genererConfig* qui va présenter au
programme la nouvelle configuration à tester. Au plus simple :

je me déplace, de la quantité *pas*, soit à gauche soit à droite (direction tirée au hasard).

Voici une figure qui présente les meilleurs solutions trouvées lors d'une descente :
- Le point de départ est indiqué en vert
- le pas était de 3
- nMax valait 5

![une descente](../images/uneDescente1.png)

Evidemment, une fois arrivé en x=18,
l'algo ne peut pas faire mieux.
- Soit il retourne en 15 (moins bien)
- soit il part en 21 (moins bien)

Donc on trouve une solution proche du minimum, mais pas très proche.

## Choix d'un pas

Vous vous direz peut être qu'il suffit de baisser le **pas** :

oui, mais :
- au départ, je n'ai aucune idée de la
précision qu'il me faut choisir. En soi, 3 n'est pas mieux ou moins bien que 0.01. La forme spécifique de ma fonction à minimiser influe sur le choix optimal de *pas*
- si on part de plus loin que 12, on en 5 itérations, on ne va pas
explorer suffisamment de points pour s'approcher du minimum. Dans les cas courants, je n'ai aucune idée de la distance qui sépare mon point de départ du minimum (je ne sais pas ou est ce minimum).

Vous me direz qu'il suffit d'augmenter
le nombre d'itérations :

Oui, mais le **temps de calcul va potentiellement augmenter de facon
énorme**

Pour mieux comprendre ce qui précède (et la suite), vous pouvez vous rendre sur Colab, je vous ai préparé [cet exemple](https://drive.google.com/open?id=14X1XDchFWoQZZnSW6Jnwp89hqGV0ySCC), que vous pourrez exécuter, modifier...
Je vous conseille **vivement** de tester des choses.

*De façon générale, dans la vie, je conseille vivement de tester des choses (si ce n'est pas trop dangereux)*

Vous pouvez déja retenir que :
**Le choix du pas résulte d'un compromis entre qualité de la solution et temps de calcul**

## Minimum Global et Minimum Local

TODO (urgemment)

## Méthodes plus élaborées de descente stochastiques
(Niveau 2)

descente du gradient et ses amis.

TODO
