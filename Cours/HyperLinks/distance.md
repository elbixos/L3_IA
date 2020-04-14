<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# Notions de distance
(niveau 1)

## Préambule pour les matheux

Par **distance**, j'entends bien une mesure qui respecte les 3 caractéristiques d'une distance mathématique :

- symétrique
- séparation
- inégalité triangulaire

A l'occasion, il peut être fait appel a des *pseudo-distance*, qui ne respectent pas l'une de ces conditions,
mais conservent l'idée générale : **Une mesure scalaire** (un nombre) **qui augmente lorsque les points testés sont dissemblables**.

Pour fixer les notations pour la suite, disons que l'on dispose
de deux points ($$X$$ et $$Y$$) de coordonnées respectives $$\[x_1,x_2,...x_n\]$$
et $$[y_1,y_2,...,y_n]$$ dans un espace de dimension $$n$$.

Les formules ci dessous fonctionnent quelle que soit la dimension de l'espace considéré.

Dans le cas du cours ou un point est un individu représenté par son couple (taille,poids), les coordonnées pourraient être $$X = [1.78,79]$$ et $$Y = [1.76,82]$$.

## Différentes distances
Aussi bizarre que cela puisse paraitre, on peut définir une infinité de distances
entre deux points. Il existe néanmoins de grands classiques.

### La distance euclidienne

C'est celle à laquelle vous pensez spontanément. On l'appelle aussi distance associée à la **norme L2**.
Sa formule est la suivante :

$$ d(X,Y) = \sqrt{ \sum_{i=1...n} {(x_i-y_i)^2}}$$

### La distance de Manhattan

Beaucoup plus rapide à calculer (pas de racine, pas de carré), elle est très utilisée en machine learning. C'est la distance associée à la **norme L1**
Sa formule est la suivante :

$$ d(X,Y) = \sum_{i=1...n} {|x_i-y_i|}$$

Sa formule peut être comprise comme un nombre de pas sur une grille ou l'on ne peut se déplacer que selon les axes, pas en diagonale (comme dans la ville de manhattan
ou l'on suit les blocs...).

### La distance associée à L0

Je la mets ici car c'est une curiosité rigolote. Je ne lui trouve pas d'autre intérêt.

$$ d(X,Y) = min_{i=1...N} {|x_i-y_i|}$$

## Intérêt et Problèmes associés

Dès que l'on dispose d'une distance (ou d'une pseudo-distance), on peut
faire énormément de choses en classification, régression ou clustering.
En effet, la distance permet de regarder, parmi tous les exemples,
**lesquels sont les plus proches**, donc sont les plus semblables.

Il faut noter qu'en fonction du choix de distance que l'on a fait, les résultats
de ces applications peuvent différer sensiblement.
On pourra avec profit tester les distances associées à L1 et L2 pour voir si
cela change quelque chose.

Attention néanmoins : dans les problèmes réels, les caractéristiques peuvent
présenter des **étendues** très variables. Prenons un exemple :

Prenons un exemple pour la taille et le poids, pour lequel j'ai trois individus :
- $$X = [1.78,79]$$
- $$Y = [1.78,82]$$
- $$Z = [1.58,78]$$

Vous conviendrez que $$X$$ et $$Y$$ se ressemblent vraisemblablement plus
que $$X$$ et $$Z$$.

Voyons maintenant les distances (manhattan) entre ces personnes :
- $$d(X,Y) = |1.78 - 1.78| + |79 - 82| = 0 + 3 = 3$$
- $$d(X,Z) = |1.78 - 1.58| + |79 - 78| = 0.2 + 1 = 1.2$$

Notre distance signale que $$X$$ et $$Z$$ **sont plus semblables** que $$X$$ et $$Y$$...

Le problème vient de l'échelle prise pour nos caractéristiques : le poids est indiqué en Kg, la taille en mètres. Les variations entre individus sont donc souvent de l'ordre de 10 pour le poids, alors qu'elles sont de l'ordre de 0.1 pour la taille.

Il est primordial de **veiller à ce que ceci ne se produise pas de façon fortuite** dans un problème de Machine Learning. Pour cela, on peut procéder à la [normalisation des données](normalise.md)

### Autres distances

En fonction des cas, il pourra être utile de développer nos propres distances
pour des usages spécifiques.
On pourrait ainsi avoir besoin de distances plus étranges pour
- comparer des images entre elles
- comparer des distributions de probabilité (c'est le cas de l'entropie croisée par exemple)
