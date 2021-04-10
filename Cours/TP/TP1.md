# Travaux Pratiques pour l'introduction à l'IA

## TP 1

Dans ce TP, vous devrez mettre au point un ou plusieurs programmes
d'apprentissage automatique pour résoudre un problème.

En l'occurence,
il s'agit de traiter le jeu de donnée proposé pour cette étude :

```
P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis.
Modeling wine preferences by data mining from physicochemical properties.
In Decision Support Systems, Elsevier, 47(4):547-553, 2009.
```

Il s'agira donc d'établir un indice de qualité d'un vin, compte tenu de ses
propriétés chimiques. L'indice de qualité est un entier allant de 1 a 10

- La description du dataset est [ici](winequality.names)
- le dataset en lui même est composé de deux fichiers
([vins rouges](winequality-red.csc) et [vins blancs](winequality-red.csc) )

Pour des raisons de facilité de comparaison, je vous demanderais de traiter
obligatoirement les vins rouges.

Vous pouvez éventuellement utiliser les vins blancs pour voir si votre algorithme
est généralisable à ce point.

*Quelques indices* :
- Vous devrez vous demander notamment sous quelle forme
classique vous allez traiter ce problème
  - Si vous pensez à un problème de classification, vous pouvez vous orienter vers
  les choix suivants : knn, svm, réseaux de neurones
  - Si vous pensez à un problème de régression, vous pouvez vous orienter vers
  les choix suivants : knn, approximation polynomiale, réseaux de neurones
  - si vous pensez à un algorithme de clustering, relisez votre cours.

Argumentez sur l'intérêt respectif des deux choix possibles.

- Mettez en oeuvre au moins 2 algorithmes (knn, réseaux de neurones)

- Evaluez leurs performances et essayez de régler leurs paramètres pour obtenir
les meilleures performances possibles.

- pensez à tester d'eventuels pré traitements des données...
