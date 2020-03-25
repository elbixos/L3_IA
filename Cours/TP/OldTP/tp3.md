## TP3 : Plus proches Centres de classes et kppv

### Enoncé du TP

#### Description de la méthode des Centres de masse
Ici, nous allons déterminer le barycentre des exemples de chaque classe dans la
base d'apprentissage.
Ces barycentres seront notre seul apprentissage.
Pour effectuer une prédiction,
on regardera simplement quel barycentre est le plus proche du point a classifier.

#### Implémentation et tests

1. Implémentez cet algorithme pour la base **IRIS**
2. Evaluez les performances de cet algorithme sur cette base. Comparez avec
le plus proche voisin.

#### Quelques ajouts peut être utiles.
1. Calculez la **matrice de confusion** de cet algorithme (matlab propose une
  fonction pour cela). D'où proviennent les erreurs ?
2. Pouvez vous retrouver la probabilité de succès à partir de cette matrice ? La probabilité d'erreur ?
3. Normalisez vos données. Cela change-t-il quelque chose ?


#### K plus proches voisins
Pour tester les k plus proches voisins, récuperez le code ici : [https://fr.mathworks.com/matlabcentral/fileexchange/47033-knnclassification-m?s_tid=FX_rc2_behav](https://fr.mathworks.com/matlabcentral/fileexchange/47033-knnclassification-m?s_tid=FX_rc2_behav)


Testez la méthode des k plus proches voisins pour k= 3,5, 11
avec ou sans normalisation.

Quel algorithme a donné les meilleurs résultats sur la base **IRIS** ?
