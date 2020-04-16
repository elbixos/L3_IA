# Apprentissage Supervisé
*(niveau 2)*

En fait, il s'agit, comme vous le savez, d'apprendre
à faire une prédiction, à partir d'exemples pour lesquels on dispose
de **caractéristiques**  et d'une **vérité** (appelée aussi *target* en anglais).

- dans le cas d'une classification, cette prédiction prend souvent la forme d'un
numéro de classe possible {0,1...n}
- dans le cas d'une régression, cette prédiction prend souvent la forme d'un nombre réel.

Il est donc envisageable de considérer une classification comme une régression,
dont les valeurs prédites sont discrètes. On **pourrait** donc ajouter à un algorithme de régression un étage de quantification pour discrétiser les valeurs prédites afin de faire de la classification.

Par exemple :
si l'algorithme de régression indique une sortie $$p(x)$$ de 4.23, on peut prendre l'entier le plus proche (4) et décider que la classe prédite est 4.

On retrouve souvent cette possibilité pour les classifications a 2 classes.
On utilise alors une prédiction de classe du type (ou un équivalent...)
- si p(x) > 0 => classe 1
- si p(x) < 0 => classe 0.

**Je déconseille de le faire !**

## Pourquoi, et que faire, alors ?

En général, on préférera, pour une classification, avoir autant de sorties
que de classes, suivant le modèle des [fonctions discriminantes](discriminantFunctions.md). La décision prise la classe qui a
obtenu la sortie la plus grande.

Ceci est :
- beaucoup plus souple (si on veut ajouter une classe par exemple)
- beaucoup plus simple pour l'algorithme. Il doit simplement apprendre a donner une valeur grande pour la sortie correspondant à la bonne classe, et faible sinon. En régression, l'algo devrait de plus donner une sortie précise numériquement.

## Algorithmes multiclasse.

Il existe de nombreux algorithmes prévus pour comparer 2 classes (svm entre autres).
Pour les étendre à la discrimination multi classes, on peut envisager les choses suivantes :

- On entraine un classifieur par classe. Chaque classifieur est spécialisé
dans la reconnaissance "classe $$i$$ vs les autres". Un classifieur multi classe est alors dérivé de ces classifieurs en prenant le classifieur ayant la sortie la plus grande.
- on entraine un classifieur par couple de classe possible. Chaque classifieur est spécialisé dans la reconnaissance de "classe $$i$$ vs la classe $$j$$". Un classifieur multi classe est alors dérivé en prenant le classifieur ayant la sortie la plus grande.

La seconde solution évite certains problèmes liés a l'inhomogénéité de la classe "les autres". Mais c'est un peu pénible a mettre en oeuvre, sauf si vous disposez
d'une librairie qui le fait tout seul. Le Python Scykit implémente les 2 approches
pour les SVM...
