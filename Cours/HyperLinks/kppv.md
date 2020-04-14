<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# Algorithme des K Plus Proches Voisins
*(niveau 1)*

C'est une variante de l'algorithme du [ppv](ppv.md). Je reprendrais ici les notations
de la page qui y est associée.

Il s'agit simplement ici de régler le problème illustré par la *basketteuse**.


## Principe
L'algorithme des k plus proches voisins (*K Nearest Neigbors* en anglais)
appliqué a un problème de classification consiste simplement à :

1. calculer un tableau de distance $$distances = \[d(X,E_i)\]$$
2. trier ce tableau pour conserver les k plus proches voisins de M
3. Combiner les labels de ces voisins pour prendre une décision.

## variantes
Ces variantes portent sur la façon dont on combine les labels des voisins trouvés.
On peut envisager un vote dans lequel chaque voisin vote pour son label :
- avec le même poids (un voisin = 1 vote)
- avec un poids décroissant avec sa distance à l'inconnu (les plus proches compte plus)

## Problèmes de cette approche

- Comme pour tout algorithme basé sur une distance, il faut se méfier des données
non normalisées.

- Comme pour le ppv, cet algorithme souffre d'un temps de calcul en prédiction
parfois rédhibitoire.

- **Comment fixer k** ? En fait, le plus simple est d'essayer...

Cela reste un des algorithmes dont le ratio complexité de mise en oeuvre / efficacité
est parmi les meilleurs.

## Application à la régression :
Elle est immédiate aussi. Il suffit de combiner les prédictions associées a chacun des voisins les plus proches. On peut faire une moyenne de ces prédictions, ou une moyenne pondérée par la distance au point inconnu.
