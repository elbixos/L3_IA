<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# Algorithme du Plus Proche Voisin
*(niveau 1)*

Cet algo est le plus simple auquel on puisse penser en apprentissage automatique.
Voyons son application à la classification :

On dispose de N exemples de points, définis par leurs caractéristiques, au nombre de $$d$$ :
$$E_i = \[x_{i,1}, x_{i,2}...x_{i,d}\]$$,
$$i$$ étant le numéro le numéro de l'exemple et le second chiffre l'indice d'une caractéristique.

Pour chaque exemple, on dispose également de son **label** $$y_i$$ (sa véritable classe)

On cherche à établir à quelle classe appartient un point
$$M = \[x_1,x_2,...,x_d\]$$.

L'algo du Plus Proche Voisin (ou *Nearest Neighbor** en anglais)
consiste à trouver, parmi tous les exemples, celui qui est le plus proche
de $$M$$. On choisira alors pour M le label associé à cet exemple.

Plus mathématiquement :
1. On calcule $$imin = argmin_i (d(X,E_i))$$
2. on prend la décision $$prediction = y_imin$$

Il faut évidemment avoir sous la main une distance, et éventuellement se méfier des données non normalisées.

## Problèmes de cette approche

Les principaux problèmes sont de deux ordres :

- sur apprentissage
- temps de calcul

## Sur apprentissage :
En fait, cet algo nécessite de connaitre "par coeur" toute la base d'apprentissage.
Imaginons une basketteuse au sein de notre problème de discrimination hommes / femmes sur la base des informations (taille, poids).

Dans nos prédictions, toute personne dont les caractéristiques seront suffisamment proches de cette basketteuse sera automatiquement labelisé comme une femme.
Or il n'y a pas tant que ca de femmes de 1.82m...

Il pourrait être intéressant de diminuer un peu la préférence accordée au plus proche voisin, pour regarder également les autres voisins du point inconnu.
C'est ce que fait l'algorithme des [kppv](kppv.md).

## Temps de calcul
C'est le gros point noir de cet algorithme (et des kppv).
Il n'y a pas a proprement parler de **phase d'apprentissage**.
On passe directement à la **phase de prédiction**.

Pour chaque décision à prendre, il faut mesurer la distance entre le point à
classifier et **chaque exemple** de la base d'apprentissage.
La durée du calcul de cette distance augmente avec le **nombre de caractéristiques**.

Si la base contient une centaine d'exemples, dans un espace de dimension 10, c'est peut être acceptable, mais pour des bases de 60000 exemples de 1000 caractéristiques chacun, cela peut devenir rédhibitoire.
