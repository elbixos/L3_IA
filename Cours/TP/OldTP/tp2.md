## TP2 : Plus proches voisins et Performances

### Enoncé du TP

#### Création des bases d'apprentissage et de généralisation.

faites un programme *createDatabases.m* qui aura pour objet de
séparer les exemples en 2 fichiers
- un fichier *learningBase.csv*
- un fichier *testBase.csv*

Vous aurez sans doute besoin de la fonction *writecsv* (ou *writematrix*) de
matlab.

#### Algo du plus proche voisin

L'idée est simple :
- on charge la base contenue dans *learningBase.csv*
- pour chaque exemple contenu dans *testBase.csv*, on regarde quel point parmi
les exemples d'apprentissage est le plus proche et on choisit la classe de ce point.

Mettez ceci en oeuvre.

#### Evaluation des Performances

Il vous faudra une procédure qui, pour un paquet d'exemple donné, mesure la **probabilité de classification correcte** d'un algorithme.
Pour réaliser cette évaluation,
- on regarde la liste des décisions de l'algorithme pour le paquet d'exemple.
- on regarde la liste des vérités terrains pour ce meme paquet

et on en déduit la probabilité de classification correcte.

Quelle sont les performances de l'algorithme du PPV
- sur la base d'apprentissage ?
- sur la base de généralisation ?
