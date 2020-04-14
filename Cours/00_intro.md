## Introduction
(*niveau de base*)

### Préambule sur le fonctionnement de ce cours

Depuis le début de la crise du COVID-19, il m'a fallu mettre en place des cours à distance. Si je disposais déja de supports plus ou moins bien fait
pour accompagner mes cours en présentiel, ces supports se sont révélés immédiatement inadaptés à de l'enseignement à distance.

J'ai donc revu totalement l'organisation de ce cours et voila ce qui va se passer (oui, comme dans *le visiteur du futur*...) :

Ce support de cours sera, à terme, organisé comme suit :
- il est prévu pour être suivi dans l'ordre du [Sommaire](99_sommaire.md). A la fin d'un cours présentiel, je passe au cours suivant.
- Ces pages accessibles depuis le sommaire (ce sont les **pages de base** ne constituent qu'une petite partie des connaissances que vous devez acquérir. Pour se donner une idée, je dirais que les pages de bases vous permettent de comprendre la philosophie générale de l'IA et de l'apprentissage automatique et d'acquérir le vocabulaire suffisant pour ne pas avoir l'air trop ridicule si on vous demande de parler d'IA à l'apéro. Ce n'est pas l'objectif de cette formation. Dit autrement, si vous êtes étudiant a l'université des Antilles, avec les pages de bases seulement, vous devriez avoir entre 0 et 5 à l'examen final...
- Si vous avez la chance (?) de pouvoir assister aux cours présentiels, j'y détaille un certain nombre de points seulement effleurés dans les pages de base.
- Vous trouverez **dans les pages de bases** un certain nombre de **liens** qui correspondent :
  - à ces points vus en présentiels.
  - ou à d'autres points qui m'apparaissent importants mais que je n'ai pas directement vu en présentiel.
- ces pages, normalement toutes accessibles depuis les pages de base (mais pas sur que je n'en n'oublie pas), sont les **pages de niveau 1**.
- Avec ces pages de niveau 1, vous devriez connaître quelques algorithmes basiques d'Apprentissage Automatique, devriez pouvoir les coder, les appliquer à des cas particuliers et ne pas tomber dans les pièges les plus grossiers de cette discipline. Dit autrement, en ne lisant que les pages de niveau 0 et 1, vous pourriez au mieux avoir une note comprise entre 6 et 9.
- Dans les pages de niveau 1, vous trouverez d'**autres liens**, soit pour **naviguer vers d'autre notions de même niveau**, soit pour **accéder à des contenus plus avancés**, ou encore pour vous emmener vers **du code exécutable en ligne**, eventuellement avec des exercices à résoudre.
- le cheminement que vous choisirez, la profondeur que vous voudrez atteindre et le niveau de compétence en apprentissage automatique que vous allez acquérir n'appartient qu'à vous.
- pour vous aider à savoir ou vous en êtes, j'essayerais d'indiquer, dans la page destination d'un lien, à quel niveau on se situe.
- il arrivera qu'un page destination soit indiquée niveau 1 puis que certaines parties de cette page soient des détails plus techniques.

De cette façon, je vous laisse libre de plonger autant que possible dans le domaine. Si cela vous intéresse modérément, ce n'est pas problématique pour moi, ni pour ceux qui auraient envie d'en savoir plus (ce que je ne peux pas faire en présentiel, ou j'essaye de m'assurer que tout le monde a compris ce que je raconte)

- Si vous êtes étudiant de l'Université des Antilles :
  - Sachez que l'espace de cours "Intelligence Artificielle" de L3 Info sur [e-cursus](https://ecursus.univ-antilles.fr/) propose des questionnaires d'auto évaluation qui vous permettront de savoir si vous avez bien compris
ce que j'explique. Ils sont anonymes, non notés et vous pouvez les refaires autant que vous voulez.
  - Si vous voyez une erreur, constatez un problème, un manque de clarté ou que vous vous posez une question sur ce cours, contactez moi par l'intermédiaire de *e-cursus*. Soit dans les forums du cours, soit en m'envoyant un message.


- Si vous n'êtes pas étudiant de l'Université des Antilles, enchanté de vous avoir à bord et bonne lecture. Vous pouvez au besoin piocher toute ou partie de ce dépôt pour une application. Veillez a respecter [la licence](../LICENCE) associée à ce dépôt.

### L'instant Philo : Hal 9000, Skynet, Red Queen, Jarvis et leurs amis.

Un cours d'IA sans son questionnement sur le futur des IA, et la possible
disparition de l'humanité à cause de ces programmes ne serait pas un vrai
cours d'IA !

J'ai donc essayé, au début du cours en présentiel, de faire la part des choses entre le
fantasme et la réalité des techniques actuelles. C'est assez long à rédiger,
je le ferais sans doute plus tard...

Chaque cours présentiel commencera systématiquement sur quelques points culturels sur l'état des lieux en IA réelle.

En gros :

1. les IA sont efficaces :
    - quand le problème reste dans un cadre bien défini
    - quand on dispose de très nombreux exemples

On peut ainsi créer des IA pour reconnaître des visages (les exemples abondent
car les réseaux sociaux sont remplis d'exemples de photos de vous, annotées
comme vous représentant). On peut aussi créer une IA qui jouera aux échecs
(maintenant, le modèle standard est que l'IA joue contre elle même pour créer
des exemples à partir desquels apprendre). On pourrait, sur le même principe,
faire une IA qui batte tout le monde à FIFA.

Il est un peu plus difficile de faire une IA qui conduise une voiture,
car on peut difficilement gérer les erreurs que l'IA va commettre au cours
de son apprentissage.

Il est également plus difficile de créer une IA qui s'occupe d'un enfant
en bas age parce cela nécessite d'effectuer en parallèle de nombreuses
tâches relativement complexes mais surtout interconnectées :

- reconnaître l'émotion de l'enfant à chaque instant
- moduler les activités en fonction de ces émotions.


2. Quels métiers peuvent être menacés ? Tous les métiers ou la connaissance ne vient que d'exemples et ou les résultats peuvent être rapidement évalués.
    - courtier en bourse
    - médecin généraliste (ca se discute mais si l'on défini un taux d'echec accepté, oui...)
    - pilote d'engin dans des situations relativement simples (trains, tramway, ...)

Inversement, les métiers ou les situations sont les plus différentes d'un
cas à l'autre ET qui nécessitent une certaine dextérité de manipulation
sont sont relativement protégés.
Par exemple, à ce jour, il est inconcevable d'avoir un robot plombier,
car aucune installation de plomberie n'est la même et qu'on peut difficilement imaginer un robot capable de passer sous toutes les toilettes
du monde pour y changer un joint.
Il est ainsi plus difficile d'avoir un robot plombier qu'un robot chirurgien
(la salle est fixe dans le cas du chirurgien).

Une nouveauté depuis 2014 (les [GAN](HyperLinks/gan.md)) a même permis aux IA d'atteindre des capacités de création (en musique, arts plastiques, design, mode ...).
Ces IA sont capables de générer des choses nouvelles, ressemblant aux
exemples qui lui sont fournis pour un résultat très bluffant.

### L'IA non fantasmée

Dans ce cours, il s'agit de commencer d'aborder les techniques dites
d'**Intelligence Artificielle**. Ce domaine est très vaste (une partie est déja
abordée en *Graphes, Flots et Applications*). Ici, nous nous cantonnerons au
domaine de l'**Apprentissage Automatique** ou **Machine Learning** en anglais.

Commençons par voir quels problèmes les plus fréquents nous voulons résoudre en
apprentissage automatique. Il s'agira pour nous de faire des programmes capables
de :

- reconnaitre qu'un objet ou une situation fait partie d'une catégorie. On parle
alors d'un problème de **classification**.
- définir des groupes d'objets ou de situations. On parle alors d'un problème de
**clustering**.
- prédire la valeur associée à un objet ou une situation. On parle
alors d'un problème de **régression**.

Evidemment, à ce stade, il est délicat pour vous de comprendre ce dont je parle.
Prenons donc un exemple : Imaginons que notre programme travaille sur des
personnes. Pour chaque personne, nous disposons d'informations :
- sa taille
- son poids
- le nombre de cigarettes fumées par jour

Exemples de problèmes associés à ces données :
- **Classification** : décider si une personne est un homme ou une femme.
(2 catégories)
- **Clustering** : trouver parmi tout l'ensemble des personnes des groupes
pertinents. On pourrait imaginer que le résultat du regroupement trouve 2 groupes
(bonne hygiène de vie ou non).
- **Régression** : pour une personne, trouver son espérance de vie restante.

Normalement, en lisant ces lignes, vous avez commencé à réfléchir pour concevoir
vous même un programme qui puisse, par exemple, reconnaitre si une personne est
un homme ou une femme (les autres problèmes sont plus complexes).
Peut être quelque chose comme :

```python
  if taille > 1.73 :
    return "homme"
  else :
    return "femme"
```

Si vous faites cela, l'intelligence de votre programme vient directement de vous.
Vous implémentez dans votre programme votre propre logique. L'**Apprentissage
Automatique** ne fonctionne pas du tout comme cela. En apprentissage automatique,
on dispose d'**exemples**, à partir desquels notre programme va **apprendre**,
parfois longuement, comment prendre sa décision.

Ce cours est donc une façon totalement nouvelle pour vous de concevoir des
programmes.

Globalement, ce cours s'appuie sur quelques notions mathématiques, au départ
assez peu complexes. Il vous faudra savoir ce qu'est :
- un vecteur
- une distance.

___
Vous pouvez passer au [Cours 1](01_cours1.md) ou repartir vers le [Sommaire](99_sommaire.md)
___
