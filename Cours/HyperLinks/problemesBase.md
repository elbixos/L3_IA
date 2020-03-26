# Problèmes dans les bases de données.

Dans la pratique réelle, le plus souvent, les personnes attaquant un problème de Machine Learning récupèrent leur base de deux façons possibles :

- auprès d'experts du domaine, si ils travaillent sur une application particulière (ex : diagnostiquer la drépanocytose dans les Antilles Françaises, reconnaître la présence d'un cachalot dans des enregistrements sonore)
- sur un site de référence, si :
  - ils veulent mettre au point assez vite un algo pour une application particulière, mais n'ont pas encore les données.
  Ils vont alors récupérer une base qui ressemble un peu à celle qu'ils auront à traiter (ex : diagnostiquer des cancers, reconnaître des chiens ou des chats dans des enregistrements sonores)
  - ils veulent mettre au point un algorithme général pour faire progresser la recherche en informatique.

Si vous cherchez un site contenant des bases d'exemples toutes prêtes, plus ou moins bien faites, vous pouvez par exemple aller voir sur le site [https://www.kaggle.com/](https://www.kaggle.com/). C'est de là que sortent mes exemples de cours (sauf ceux que j'ai vraiment bricolé à la main).

Ceci donne lieu à ce que j'appellerais la règle 1 du Machine Learning :
"Les bases d'exemples des vrais études posent **toujours** problème."
Sinon, c'est que c'est juste un exemple préparé par un prof, pour un cours.

Parmi ces problèmes, voici quelques cas classiques :

## Base mal documentée

Soit vous avez des données mais vous n'avez aucune information sur ce qu'elles représentent. Votre fichier csv présente des lignes comme :
```
0.00124,127.4,petite,13,5,3
```
et vous ne savez même pas ou est le label de classe dans la ligne,
soit vous avez une documentation erronée (nous verrons un exemples en TP).

## Données manquantes

il peut arriver que certaines lignes ne soient pas renseignées,
parce que l'expert n'avait pas l'information par exemple.
Dans des données sociologiques ou médicales, c'est souvent le cas.

La donnée sera alors souvent remplacée par un **NaN** (Not a number), ou par rien:
```
0.00124,127.4,petite,13,5,3
0.00233,127.4,petite,,5,3
```

Les méthodes de lecture actuelles convertissent le plus souvent
ce dernier cas en une valeur **NaN**.
Le module *Panda* de python, par exemple, fait cela très bien
et facilement.

La solution la plus simple consiste alors souvent a minima supprimer les enregistrements correspondant à ces données.
Encore une fois, le module *Panda* de python, fait cela très bien et facilement.

Le problème est que si votre base est déjà petite, elle va le devenir encore plus.

*Remarque : le traitement des données manquantes est en soi un domaine de recherche...*

## Données erronées

Des erreurs, il y en a, sauf pour des bases très petites et tellement vieilles qu'elles ont été corrigées. Mais ces bases sont tellement vieilles qu'elle sont inadaptées aux techniques actuelles. Elles sont soit :
- trop petites (avant, on ne pouvait pas traiter autant de données que maintenant). C'est le cas de la base *IRIS* qui contient 150 exemples.
- trop faciles (les techniques actuelles ne se trompent pas dessus, ou ont toute atteintes les meilleurs résultats possibles sur cette base. C'est le cas de la base *MNIST* sur laquelle tous les algorithmes récents ont des taux de réussite de plus de 99%

Ces bases restent excellentes comme outils pédagogiques et vous les retrouverez un peu partout.

Revenons à nos erreurs.
Elle peuvent être :
- dans les classes (erreur au moment de l'étiquetage). Dans ce premier cas, pas grand chose à faire si vous ne pouvez pas contacter les personnes ayant crée la base.
- dans les caractéristiques (une erreur de mesure). Dans ce cas, vous pourrez parfois les voir si elles font apparaître des **points aberrents**. Pensez par exemple à un taux d'alcoolémie > 5.3 ou une combinaison de caractéristiques "type de métier"/"salaire mensuel" de ("ouvrier"/4537). Cela ne provient pas nécessairement d'une erreur mais constitue néanmoins une exception notable.

Vous pouvez parfois :
1. Les repérer lors de la [visualisation des données](visualiseData.md)
2. les éliminer de votre jeu de donnée pour voir si les performances ne s'améliorent pas d'un coup. Attention néanmoins a ne pas générer vous même un **biais de sélection** (voir  [Biais des bases](baseBias.md))

## Base trop petite

Il arrive très fréquemment que la base ne contient pas assez d'exemples (en fait une base ne contient jamais trop d'exemples, mais c'est parfois très problématique. (Voir [La malédiction de la dimensionalité](curseOfDim.md)). Malheureusement, les experts ne peuvent pas forcément en ajouter autant que vous voudriez. Il faudra sans doute [Réduire le nombre de caractéristiques](featureReduction) et au moins faire attention au [sur-apprentissage](overfitting.md) pour votre algorithme.


## Classes mal équilibrées

La base contient peu d'exemples de certaines classes. Du coup,sur ces classes, on ne dispose finalement que de peu d'information et les exemples de ces classes peuvent être très dispersés dans l'[espace des caractéristiques](espaceCarac.md).

Certains algorithmes sont très sensibles à cela, et il conviendra de [choisir son algorithme](choiceAlgo.md) avec soin.

De façon général, une bonne base contient a peu près autant d'exemples de chaque classe possible.

Il faudra y faire particulièrement attention au moment ou vous allez [Séparer votre base en base](baseSplit.md) car il se pourrait que votre algorithme apprenne le plus souvent sur les exemples de certaines classes et qu'il soit évalué en validation ou en test plus souvent sur d'autres.

## Les données n'ont pas la forme que vous voudriez.

Vous avez l'habitude des algorithmes qui travaillent avec
des valeurs numériques, mais votre base contient des données
de type *str* pour décrire un champ.

### Cas 1 : Type de caractéristiques mal définis

Par exemple, vous avez :
- une caractéristique *age* et ses valeurs possibles sont "jeune" / "adulte" / "senior".
- une caractéristiques *couleur des yeux* et ses valeurs possibles sont "0 / 1 / 2". La doc vous dit que 0 signifie "bleu", 1 signifie marron, 2 signifie vert.

Ceci peut être pénible pour plusieurs raisons :
- si toutes les caractéristiques ne sont pas de même type (numérique ou str), certaines anciennes fonctions de lecture posaient problème. Ceci tend à disparaitre.
- Cela peut être pénible à traiter, car vos nuages de points seront moins faciles à tracer.

Il faudra vraisemblablement prétraiter vos données pour les mettre en forme correcte. Veillez bien à ne pas commettre d'erreur dans les [types de caractéristiques](featuresTypes.md)

### Cas 2 : le tutoriel et votre base semblent incompatibles.

C'est un cas que vous rencontrerez souvent :
Vous avez trouvé un super tutoriel sur la base MNIST,
qui
1. charge la base MNIST (format inconnu), et la transforme en un beau Dataframe du module Panda de Python.
2. présente un algorithme super efficace (disons un [réseau de neurone convolutionnel](CNN.md)
3. l'entraine et le teste.

Vous souhaitez l'appliquer à une autre base d'images et ca tombe bien, vous avez un autre tutoriel qui :
1. charge cette autre base (format un gros zip avec les exemples de chaque classe regroupés dans des répertoires différents) et la transforme en un Dataset du module TensorFlow de Python
2. applique de l'[augmentation de données](dataAugmentation) sur le Dataset
3. présente un algorithme franchement perfectible
4. l'entraine et le teste.

Vous pensez donc que mixer les deux va vous prendre quelques minutes, ou quelques heures au pire, vous vous préparez à de grandes désillusions. Il vous faudra lire des pelles de documentations, de tutoriels mal fichus, ajouter vos propres bugs dans tout ca et sans doute perdre quelques cheveux dans la bataille.

Néanmoins, si vous y arrivez, vous serez officiellement un vrai pratiquant du Machine Learning... La bonne nouvelle, c'est que vous n'êtes pas le seul a être passés par là, on a tous galéré.
