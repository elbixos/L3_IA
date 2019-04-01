### L'instant Philo.

Notre intelligence vs intelligence Artificielle :
Interaction des modules...
Retour sur les medecins.


### Formalisation

Rappelons l'objectif, pour l'exemple de la classification :

Ce que nous cherchons à mettre au point n'est pas un programme qui reconnaisse
au mieux les hommes et les femmes sur la base de leur poids et de leur taille,
mais un programme qui, si on lui donne des exemples de (taille, poids, sexe)
sera capable de choisir un sexe pour n'importe quelle valeur (taille, poids).

Il s'agit donc de se détacher du problème précis, pour trouver des solutions plus
ou moins universelles à ces problèmes généraux.

Mais comme nous devons discuter de ces problèmes, il nous faut un peu de vocabulaire...

#### Le vecteur de caractéristiques

Tout d'abord, nous étudions un objet ou une situation, défini par des nombres.
Ces nombres sont rangés dans un *vecteur*, que l'on nomme **vecteur de caractéristiques**, ou encore **feature vector** en anglais.

Dans les exemples que nous avons vu, notre vecteur de caractéristiques
était le vecteur [taille, poids] pour les applications de clustering et de classification. Dans le cas de la régression présentée, ce vecteur était le vecteur *[nbClopes]*

La taille de ce vecteur est extrêmement importante (plus ce vecteur sera grand, plus il faudra d'exemples). Cette taille est la **dimension** de l'espace des caractéristiques dont nous allons parler maintenant.


#### L'espace des caractéristiques

Si on considère les caractéristiques de chaque exemple comme un vecteur, ce vecteur appartient à un espace vectoriel : l'**espace des caractéristiques**.
C'est l'ensemble de positions possibles pour nos exemples.

Pour simplifier, on pourrait considérer que cet espace des caractéristiques est
- R² lorsque le vecteur de caractéristiques est [tailles, poids]
- R lorsque le vecteur de caractéristiques est [nbClopes]

Notez que nous travaillerons couramment avec des espaces de caractéristiques de
dimensions 3,4, 10 ou 100. Une branche complète de l'apprentissage automatique
s'intéresse aux espaces de grandes dimensions, c'est ce que l'on nomme **Big Data** (qui ne sera pas abordé ici).

Notez également que l'on ne peut pas visualiser réellement des exemples dans des
espaces de dimension > 3. Ce qui ne nous empêche pas de réfléchir et de calculer
dessus.


#### Apprentissage Supervisé vs Apprentissage Non Supervisé

Si on regarde les choses de loin, on peut remarquer quelque chose :
dans l'application de **clustering**, nous ne disposons à propos de nos exemples que de leur **vecteur de caractéristiques**.

Le problème de clustering est un problème dit d'**Apprentissage Non Supervisé** (ou *unsupervised learning* en anglais).
Le programme doit apprendre avec les données, sans savoir ce que l'on attend de lui.

En revanche, pour de la **classification** ou la **régression**, nos
informations à propos de nos exemples sont leur **vecteur de caractéristiques**
et une **vérité terrain** :
- pour la classification, cette **vérité** est la catégorie de l'exemple (le sexe de la personne pour notre application). On parle de la **Classe** de l'exemple.
- pour la régression, cette **vérité** est la valeur à prédire (l'espérance de vie pour notre application)

Les problèmes de classification et de régression sont des problèmes dits d'**Apprentissage Supervisé** (*supervised learning* en anglais): notre programme va devoir apprendre sur des exemples qui sont fournis avec la "vraie" réponse attendue, comme si un enseignant lui indiquait la réponse qu'il devrait
fournir pour cet exemple.

#### Apprentissage / Test / Prédiction

Un programme d'**Apprentissage supervisé** comporte en général 3 phases plus ou moins successives :
- une phase d'**Apprentissage** pendant laquelle le programme apprend à partir des exemples qu'on lui a donné.
- une phase de **Test** ou de **Généralisation** sur laquelle nous évaluerons
l'algorithme sur des exemples qu'il n'a jamais vu.
- une phase de **Prédiction** dans laquelle on fournit au programme des exemples inconnus et pour lesquels il doit indiquer sa décision.

Dans le cas d'un algorithme du plus proche voisin, il n'y a pas a proprement parler de phase d'apprentissage. On peut directement passer à la prédiction,
qui elle, regarde chacun des exemples.

Nous allons modifier notre algorithme pour que :
1. une première phase extraie des informations de la base d'exemples.
2. une seconde phase prenne la décision en se basant exclusivement sur :
  - le vecteur de caractéristiques de l'objet inconnu
  - les informations apprises en phase 1.

Je remet ici le schéma initial :
![Poids et des tailles par sexe en france, le retour](../Sources/taillePoidsClassif2.png)

Une des façon d'appendre des choses des exemples est de ne retenir
que ce qu'est un "homme moyen" et une "femme moyenne"

![Poids et des tailles par sexe en france et moyennes](../Sources/taillePoidsClassif2Bary.png)

Il est alors très rapide de comparer un vecteur de caractéristiques à ce que nous avons retenu :
![Prediction par distance aux barycentres](../Sources/taillePoidsClassif2BaryPredict.png)

Dans ce cas :
- la phase d'apprentissage est un calcul de moyenne.
- la phase de prédiction compare le vecteur a ces moyennes.

Il est aussi possible d'apprendre tout un tas d'autres choses comme, au choix :
- la droite qui sépare au mieux les exemples
- la succession de tests

### Classification : Formalisation

Les catégories dans lesquelles on doit ranger chaque objet sont appelées des
**classes**. Il y aura par exemple, la classe *Homme* et la classe *Femme*.
Chaque classe portera souvent un numéro pour simplifier le problème et on parlera
de la classe 0 et de la classe 1...

Nous pouvons maintenant formaliser le problème de classification de 2 façons.

#### Régions de décisions
On peut considérer que classifier, c'est *partitionner l'espace des
caractéristiques en* **régions de décisions**. Chaque **classe** (*i*) est
représentée par une région *Ri* et la prise de décision se fait de la façon
suivante :
```python
for i in classes :
  if x in Ri :
    decision = i
```

Par exemple, un algorithme qui trouve la meilleure droite fonctionne comme cela.

#### Fonctions discriminante.
On peut également raisonner en termes de **fonctions discriminantes** :
Chaque classe *i* dispose d'une fonction *fi(x)* qui calcule le score d'un objet
qui est potentiellement de sa classe.

l'algorithme est le suivant :
```latex
decision = argmin_{i} f_i(x)
```

Cette version est beaucoup plus souple que les régions de décisions.

- L'algorithme du plus proche voisin travaille par exemple avec comme fonctions discriminantes :
```latex
f_i(x) = - min_{P in C_i} d(x,P)
```
- L'algorithme des k plus proches voisins travaille par exemple avec comme fonctions discriminantes :
```latex
f_i(x) = nbVoisins in C_i
```

- Je pourrais illustrer ceci par des réseaux de neurones, comme en cours, mais
je n'ai pas le temps tout de suite...

### Evaluation de performances

Quoiqu'il en soit, nous allons essayer de construire des algorithmes aussi bons
que possible pour un problème donné.
Il sera donc nécessaire d'évaluer les performances de nos différents algorithmes.

#### Performance en classification

Tout d'abord, il convient de disposer de 2 bases d'exemples, avec leurs classes
associées.

##### Apprentissage et Généralisation (ou Test)
- la **base d'apprentissage** contenant des exemples (et leur vraie classe) qui
servira à l'algorithme pour apprendre à reconnaitre les différentes classes.

- la **base de Généralisation** ou **base de test** qui contient également des
exemples et leur véritable classe mais que l'algorithme n'a jamais vu. Cette base
servira pour évaluer les performances attendues de l'algorithme en utilisation
réelle.

Si vous ne disposez que d'une seule base d'exemples, coupez la en deux bases.
Une répartition raisonnable serait : 2/3 des exemples pour apprendre, 1/3 pour
tester. Si vous avez beaucoup d'exemples, vous pourrez aller jusqu'à 4/5 pour
apprendre, 1/5 pour tester.

##### Probabilité de succès ou probabilité d'erreur.

La première question est : si j'ai 2 algorithmes, lequel est le meilleur ?
Une réponse raisonnable est :
*Celui qui, en moyenne, à le plus souvent raison*.

Ceci est complètement équivalent à *celui qui, en moyenne, se trompe le moins*.

Nous disposons donc d'une première mesure si l'on dispose d'un algorithme et
d'une base d'exemples avec leurs classe associée qui sera le nombre moyen d'erreurs de notre algorithme sur ces exemples. Ce chiffre est assimilable à une
**probabilité d'erreur**.

Lors d'un apprentissage, il peut être nécessaire de faire plusieurs passes de
la base d'apprentissage pour que l'algorithme ait le temps de trouver les *bons paramètres*. Auquel cas on peut observer la probabilité de succès sur la **base d'apprentissage** au fur et à mesure du temps.
On mesure ainsi les **performances en apprentissage**
Elle doivent (si tout se passe bien) évoluer de la façon suivante :

La figure suivante est tirée des tests effectués par l'un d'entre vous sur
de la reconnaissance de caractères à partir d'images. Il y a 10 classes possibles, l'algorithme a donc, en tirant au hasard sa réponse, une probabilité
de succès de 0.1. Ce sont les performances au début de l'apprentissage. On voit qu'il progresse, puis stagne.

![exemple de proba d'erreur en apprentissage](scalarFMnistMono.png)

On voit que notre algorithme a atteint, à la fin de son apprentissage, une
probabilité de classification correcte en apprentissage d'à peu près 0.80.
La valeur finale est peu importante (elle dépend de la qualité de l'algorithme
et de la difficulté du problème). Par contre, on voit qu'il ne sert plus à rien
de continuer à entrainer cet algorithme, il a déja atteint ses limites depuis longtemps.

Ces performances ne sont toutefois pas une image correcte de ce que ferait notre
algorithme en situations réelles, car il est ici évalué sur des exemples qu'il connait déja.
On mesure alors sa probabilité de classification correcte sur la **base de généralisation** constituées d'exemples qu'il ne connait pas.

Ces performances en généralisation sont logiquement inférieures aux performances
en apprentissage, mais pas trop. Dans le cas correspondant à l'image présentée ci
dessus, la probabilité de classification correcte en généralisation était de
0.76...
