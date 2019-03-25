## Introduction

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
  if taille < 1.73 :
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

Vous pouvez repartir vers le [Sommaire](99_sommaire.md)
___
