## Principes de l'Apprentissage automatique

Içi, sans trop détailler, je vais essayer de vous expliquer les principes de
l'apprentissage automatique, et même vous orienter vers des débuts de solutions
classiques aux trois problèmes évoqués dans l'introduction.

Commençons par un peu de philosophie : Nous cherchons  à concevoir une solution
pour qu'un programme apprenne, sur la base d'exemples, à prendre une décision
concernant un objet ou une situation.

Pour avancer dans ce problème, il nous faut impérativement une image mentale
de notre problème. Qu'est ce qui peut nous fournir une image mentale sur laquelle
nous pourrons ensuite faire des calculs : Les **mathématiques**.

### Les Applications

#### Application au Clustering

Re-simplifions notre exemple de l'introduction, et intéressons nous par exemple
au problème du **clustering** qui consiste à regrouper nos exemples en
groupes (des **clusters**). Nous voudrions visualiser nos exemples.

Un exemple sera ici constitué de 2 informations :
- taille
- poids

On peut penser chaque exemple comme un point (ou un vecteur) dans un espace de
dimension 2.
Dans le tableau qui suit : chaque ligne est une personne (homme ou femme indifférenciés) et sur une ligne, on trouve le **vecteur de caractéristiques**
[taille, poids] de la personne. Nos données ont la forme suivante :


Taille | Poids
------ | -----
1.8707 |  68.7103
1.5430 |  63.2235
1.8442 |  88.0109
1.6772 |  70.5969
...    |  ...
1.6072 |  66.1378

Avec ce tableau, je pourrais faire toutes sortes de calculs, mais je peux surtout
visualiser mes données :

![Repartition des poids et des tailles (modifiée) en france](../Sources/taillePoidsCluster.png)

*Remarque : pour que l'exemple soit plus parlant, j'ai modifié les valeurs réelles
de taille et de poids des francais. Je reviendrais plus tard aux véritables
valeurs.*

Voyez vous deux groupes de personnes ?

#### Application au Clustering

Reprenons notre exemple simplifié précédent. Nous voudrions à partir d'exemples
connus, apprendre à déduire le sexe d'un individu inconnu. Pour cela, il faut impérativement que pour chaque exemple connu, nous sachions quel est son sexe.

Nous aurons donc des exemples connus :

Taille | Poids    | catégorie
------ | -----    | ---------
1.8707 |  68.7103 | homme
1.5430 |  63.2235 | femme
1.8442 |  88.0109 | homme
1.6772 |  70.5969 | femme
...    |  ...
1.6072 |  66.1378 | femme

et enfin un ou plusieurs exemples inconnus à propos desquels il faudra prendre
une décision :

Taille | Poids
------ | -----
1.60 |  72

Encore une fois, avec ce tableau, je pourrais faire toutes sortes de calculs, mais je peux surtout visualiser mes données :

![Repartition des poids et des tailles (modifiée) par sexe en france](../Sources/taillePoidsClassif.png)

*Remarque : pour que l'exemple soit plus parlant, j'ai modifié les valeurs réelles
de taille et de poids des francais. Je reviendrais plus tard aux véritables
valeurs.*

Pouvez vous prendre une décision concernant le point inconnu ?
Pourriez vous décrire un programme qui prenne cette décision ?

#### Application à la Régression

Encore une fois, je vais re-simplifier l'exemple précédent pour des questions
de visualisation. La version complète arrivera plus tard.

Nous disposons d'exemples connus dont nous connaissons le nombre de cigarettes
qu'ils fument par jour. Nous voudrions, pour un individu inconnu, déduire son espérance de vie. Pour cela, il faut impérativement que pour chaque exemple connu, nous sachions quel est son espérance de vie.

*Notez qu'ici, j'ai littéralement complètement inventé les chiffres utilisés
pour mes exemples...*

Nous aurons donc des exemples connus :

nb Clopes | Esperance de vie
------ | -----
22  |   74
0   | 45
0   | 84
22  | 51
0   | 90
10  | 72
4   | 67
... | ...
0   | 69

Et nous voulons savoir quelle serait l'espérance de vie d'un inconnu dont les caractéristiques sont les suivantes :

nb Clopes : 14

Encore une fois, avec ce tableau, je pourrais faire toutes sortes de calculs, mais je peux surtout visualiser mes données : Notre programme doit choisir une valeur en ordonnée sur la ligne noire.

![Esperance de vie en fonction du nombre de cigarettes (modifiée)](../Sources/clopesRegression.png)

### Formalisation

Rappelons l'objectif, pour l'exemple de la classification :

Ce que nous cherchons à mettre au point n'est pas un programme qui reconnaisse
au mieux les hommes et les femmes sur la base de leur poid et de leur taille,
mais un programme qui, si on lui donne des exemples de (taille,poids,sexe)
sera capable de choisir un sexe pour n'importe quelle valeur (taille, poids).

Il s'agit donc de se détacher du problème précis, pour trouver des solutions plus
ou moins universelles à ces problèmes généraux.

Mais comme nous devons discuter de ces problèmes, il nous faut un peu de vocabulaire...

#### Le vecteur de caractéristiques

Tout d'abord, nous étudions un objet ou une situation, défini par des nombres.
Ces nombres sont rangés dans un *vecteur*, que l'on nomme **vecteur de caractéristiques**, ou encore **feature vector** en anglais.

Dans les exemples que nous avons vu, notre vecteur de caractéristiques
était le vecteur [taille, poids] pour les applications de clustering et de classification. Dans le cas de la régression présentée, ce vecteur était le vecteur [nbClopes]


#### L'espace des caractéristiques

Si on considère les caractéristiques de chaque exemple comme un vecteur, ce vecteur appartient à un espace vectoriel : l'**espace des caractéristiques**.
C'est l'ensemble de positions possibles pour nos exemples.

Pour simplifier, on pourrait considérer que cet espace des caractéristiques est
- R² lorsque le vecteur de caractéristiques est [tailles, poids]
- R lorsque le vecteur de caractéristiques est [nbClopes]

Notez que nous travaillerons couramment avec des espaces de caractéristiques de
dimensions 3,4, 10 ou 100. Une branche complète de l'apprentissage automatique
s'intéresse aux espaces de grandes dimensions, c'est ce que l'on nomme **Big Data** (qui ne sera pas abordé ici).

Notez également que l'on ne peut pas visualiser réellement des examples dans des
espaces de dimension > 3. Ce qui ne nous empêche pas de réfléchir et de calculer
dessus.

#### Apprentissage Supervisé vs Apprentissage Non Supervisé

Si on regarde les choses de loin, on peut remarquer quelque chose :
dans l'application de **clustering**, nous ne disposons à propos de nos exemples que de leur **vecteur de caractéristiques**.

En revanche, pour de la **classification** ou la **régression**, nos
informations à propos de nos exemples sont leur **vecteur de caractéristiques**
et une **vérité terrain** :
- pour la classification, cette **vérité** est la catégorie de l'exemple (le sexe de la personne pour notre application)
- pour la régression, cette **vérité** est la valeur à prédire (l'espérance de vie pour notre application)

Les problèmes de classification et de régression sont des problèmes dits d'**Apprentissage Supervisé** : notre programme va devoir apprendre sur des exemples qui sont fournis avec la "vraie" réponse attendue, comme si un prof lui
indiquait la bonne réponse qu'il devrait fournir pour cet exemple.

Le problème de clustering est un problème dit d'**Apprentissage Non Supervisé**.
Le programme doit apprendre avec les données, sans savoir ce que l'on attend de lui.

Par la suite, nous nous concentrerons plutôt sur les problèmes de classification.
