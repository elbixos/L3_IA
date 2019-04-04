## TP1 : découverte Matlab et premiers pas.

Pour débuter ce TP, je vous laisse un premier fichier que nous allons détailler
ensemble :
- [un premier fichier matlab](premierMatlab.m)
- [un exemple de fonction en matlab](mafonction.m)

Vous trouverez également ci dessous deux cours sur matlab, que j'ai pioché sur
le net, mais je vous conseille surtout de chercher sur le net les informations
dont vous aurez besoin :
- [un cours sur matlab](matlab.pdf)
- [un autre cours sur matlab](initiation_matlab.pdf)


### Enoncé du TP

#### Le début début.

1. Connectez vous sous windows
2. lancez matlab.
3. Créez le répertoire de votre choix et placez y les deux fichiers *.m*
précédemment cités.
4. lancez l'execution du fichier premierMatlab.m
5. Regardez le code et écoutez ce que j'ai a en dire !

#### La base d'exemples

Nous allons travailler avec sur la base d'exemple IRIS, très connue en Machine
Learning (quoiqu'un peu vieillote et très facile)

Elle est relativement bien décrite ici :
[http://archive.ics.uci.edu/ml/datasets/iris](http://archive.ics.uci.edu/ml/datasets/iris)

- Elle contient 150 exemples de plantes (des Iris).
- chaque plante est caractérisée par 4 caractéristiques :
  - la longueur des sépales (...)
  - la largeur des sépales
  - la longueur des pétales
  - la largeur des pétales

  Les Iris peuvent appartenir à 3 variétés : Iris Setosa, Versicolour ou Virginica

Il s'agira donc de réaliser quelques programmes de **classification**.

**Ouvrez un nouveau fichier pour effectuer les opérations suivantes**

#### Lecture des données

Les exemples sont contenus dans le fichier
[bezdekIris.data.vp.csv](bezdekIris.data.vp.csv).
Un fichier csv est composé comme suit :
- un exemple par ligne
- les caractéristiques sont séparées par des virgules.
- la classe est sur la derniere colonne.

Pour lire ce fichier, vous disposez des fonctions Matlab *csvread* ou
*readmatrix* (dépend de la version installée). A l'université, il faudra sans doute
utiliser *csvread*.

Trouvez de la documentation, lisez ce fichier et affichez les données.

#### Visualisation des données

##### Visualisation 2D
A l'aide de la fonction **plot** de matlab,

1. Visualisez les caractéristiques longueur des pétales / largeur des pétales
pour chaque classe avec une couleur par classe.
2. Sur une autre figure, visualisez longueur des sépales / largeur des sépales

##### Visualisation 3D
A l'aide de la fonction **plot3** de matlab,
1. Visualisez les caractéristiques longueur des pétales / largeur des pétales
/ longueur des sépales.
2. Visualisez les autres triplets de caractéristiques.

Quelles sont les 3 caractéristiques les plus intéressantes pour la
classification ?

#### Création des bases d'apprentissage et de généralisation.

faites un programme *createDatabases.m* qui aura pour objet de
séparer les exemples en 2 fichiers
- un fichier *learningBase.csv*
- un fichier *testBase.csv*

Vous aurez sans doute besoin de la fonction *writecsv* (ou *writematrix*) de
matlab.
