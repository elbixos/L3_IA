# Introduction aux Réseaux de Neurones.
(*niveau de base*)


## Introduction
Ne nous le cachons pas, c'est ce à quoi l'on pense, ces jours ci,
lorsque l'on pense aux techniques d'IA.
Quand on parle de **Classification** ou de **Régression** (pas trop pour le
clustering), ils ont, à proprement parler **écrasé toutes les autres techniques**.

Il faut noter que **ce ne sera vraisemblablement pas toujours le cas**. Il y a eu des modes en machines learning (*la théorie bayesienne* du début a cédé la place
aux *arbres de décision* qui ont été parfois supplantés par les *svm*...).
Maintenant, ce sont les réseaux de neurones qui dominent le domaine de l'Apprentissage Automatique.

Pourtant, ces réseaux existent depuis 1960...
Ce qui a changé et a permis leur domination absolue actuelle, c'est une conjonction des facteurs suivants :
- des développements récents (pas si récents) : les réseaux convolutionnels...
- une augmentation énorme des puissances de calcul
- la possibilité d'accéder à des bases de données énormes et nombreuses (par exemple, www.kaggle.com, mais je ne suis pas là pour leur faire de la pub).
- des **frameworks de développement** très matures (*Tensor Flow*, *Torch*, ...)
qui rendent leur programmation suffisamment aisée pour que les entreprises puissent
envisager de les utiliser **sans avoir besoin d'un réel spécialiste**.

Il faut tout de même note que cette nouvelle *mode* se distingue des précédentes
par un point majeur que nous allons voir maintenant.

### Ampleur des améliorations obtenues avec eux
L'ampleur de l'amélioration qu'ils ont amenés (dans leurs formes récentes) est sans commune mesure avec les améliorations précédentes.

Avant, une amélioration permettait de gagner quelques points dans un pourcentage
de probabililité de correcte.

Les réseaux de neurones ont tellement bien réussi qu'il est difficile de les départager sur les anciennes bases d'exemples (sur la base *MNIST*, les versions
élaborées performent toutes au dessus de 0.98 par exemple).

Il a fallu **créer de nouvelles bases** constituant des problèmes plus difficiles.
Par exemple, un problème classique, avant, était la reconnaissance d'un chiffre
manuscrit (10 classes possibles) dans des images de taille identiques (28x28 pixels). Le problème correspondant à la base *Image.Net* est de reconnaitre
quels objets apparaissent (1000 classes possibles), dans des images de taille variable. Je n'ai pas connaissance d'algo autre que les réseaux de neurones
pouvant s'attaquer à cela (*je vais chercher parce que maintenant que je le dis,
il doit bien y avoir un gars quelque part qui essaye*).

Dans certains cas, ils ont, **de mon point de vue**, tué des champs de recherche !
Dans ma spécialité de recherche initiale, le traitement d'image, un bon chercheur
avait entre autres compétences, une très bonne capacité à savoir [extraire les caractéristiques](extractFeatures.md) des images à traiter. La complexité des méthodes d'extraction pouvait être redoutable. Le truc, c'est que les réseaux
de neurones choisissent eux même quelles caractéristiques extraire, mieux que
quiconque. Je considère donc que le traitement d'image est devenu, dans sa plus grande part et à l'heure actuelle, une simple application des réseaux de neurones.
(Certains de mes collègues ici ne sont vraisemblablement pas d'accord avec moi).

Sans forcément parler de révolution
(*seul l'avenir nous le dira, à l'échelle d'une vie humaine*),
nous sommes donc en train de vivre un saut technologique très net.

## Principe de fonctionnement.

TODO










TODO.
