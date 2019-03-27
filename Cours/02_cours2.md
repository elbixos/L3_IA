
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
- une phase de **Test** ou de **Généralisation** sur laquelle nous reviendrons plus loin.
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
