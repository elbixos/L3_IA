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

### Application au Clustering

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

### Application au Clustering

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

### Application à la Régression
