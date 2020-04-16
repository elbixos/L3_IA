<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>


# Les types de caractéristiques
*(niveau 2)*

Dans tous les exemples que j'ai pris, les caractéristiques sont des nombres.
Ces nombres peuvent être réels ou entiers, mais pas seulement.
Voyons un peu les différentes possibilités et ce qu'elles impliquent.

La typologie des caractéristiques est en fait celle des **Variables Aléatoires**.
Je remplacerais donc ici le terme **caractéristique** par **VA** (par variable aléatoire)

## Les VA Numériques
Ce sont des VA dont la valeur est un nombre. C'est le cas le plus courant (...)
et le plus simple. On s'y ramènera souvent si l'on n'est pas dans ce cas.

### Les VA continues.

Ce sont des VA qui peuvent prendre des valeurs continues, souvent dans $$R$$.
La taille par exemple. On peut avoir une taille de 1.78 m. Mais aussi de 1.781
1.78075.

### Les VA discrètes.
Ce sont des VA qui peuvent prendre des valeurs dans un espace discret.
Disons l'age, par exemple. On a 3 ans, 62 ans, mais pas 62.5 ans (on pourrait
mais vous voyez l'idée)


### Calculs possibles sur les VA numériques
Pour un ensemble d'exemples, on peut calculer une moyenne, une variance,
tout ceci a un sens. On peut aussi calculer des moyennes pondérées, pour des réseaux de neurones par exemple. On peut enfin calculer des distances.

**Attention** : dans le cas général, la moyenne d'exemples discrets n'appartient
pas à l'ensemble des valeurs possibles. (3 ans, 62 ans => moyenne de 31.5 ans).
C'est le plus souvent sans conséquences.

## Les VA Catégorielles.

Ce sont des VA dont le réalisations prennent pour valeur des **modalités** ou des **catégories**. Je vais prendre deux exemples :

- niveau de vie : {pauvre, moyen, riche, très riche}
- couleur des yeux : {bleu, vert, marron}

En fait, le premier cas n'est pas vraiment une variable catégorielle au sens strict.
Je conserve ce nom, mais sachez qu'il n'est pas tout à fait correct.

Ces deux exemples sont très différents, et je vais les séparer encore en 2 types

**On ne peut pas directement calculer une moyenne sur ces variables, cela n'aurait
aucun sens.**

### Les variables quantitatives

Le niveau de vie en est un exemple.
Il existe la notion d'ordre pour ces variables. $$pauvre < moyen < riche...$$

Cela veut dire que je peux remplacer ces variables par des entiers, et éventuellement
calculer une distance entre deux exemples. *(attention à éventuellement normaliser mes données...)*

### Les variables catégorielles pures

La couleur des yeux en est un exemple.
Il n'y a pas de notions d'ordre ni de distance.
$$bleu$$ n'est pas mieux ou moins bien que
$$vert$$ ou $$marron$$. Je ne peux pas dire que $$marron$$ est plus proche
de $$bleu$$ que $$vert$$.

Si je remplace ces catégories par des entiers, mes algos risquent de faire ce type
de comparaisons, sans qu'elles aient de sens (pensez au ppv, par exemple)

Comment faire alors ? on peut utiliser ce qui sera souvent noté sous le nom de **One hot vector**. On remplace la caractéristique par un vecteur ayant la taille du nombre
valeurs possibles.

Exemple : Je dois coder la couleur des yeux d'individus. Les valeurs possibles
sont {bleu, vert, marron}.
à la place de ma caracteristique *couleurYeux*, j'aurais un vecteur de taille 3.

voici les codages pour chaque catégorie possible
- yeux bleus : $$[1,0,0]$$
- yeux verts : $$[0,1,0]$$
- yeux marrons : $$[0,0,1]$$

Ainsi :
- 2 exemples ayant des yeux de la meme couleur sont séparés par une distance nulle.
- 2 exemples ayant des yeux de couleurs différentes sont séparés par une distance 1.

*(je n'ai pas traité le cas des yeux vairons...)*
