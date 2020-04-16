# Temps de Calcul pour les différentes phases.
*(niveau 1)*

Vous verrez souvent, dans les cours ou les tutoriels du net,
un programme d'apprentissage automatique décomposé comme suit :
1. Apprentissage (sur la base d'apprentissage)
2. Evaluation (sur la base de validation)
3. (optionnel) : Prédiction sur quelques exemples supplémentaires

Regrouper ces 3 phases dans un meme programme a ses intérets pédagogiques, mais
dans la pratique, on ne fait **jamais** cela si l'algorithme est utilisé.

Pour comprendre pourquoi, il faut comprendre la différence entre les temps
de calculs de ces différentes phases.

## Phase d'apprentissage

La phase d'apprentissage est souvent la plus longue. Elle consiste
a faire passer la base d'exemple de nombreuses fois dans notre algo.
Lors de ces passages, on corrigera les paramètres
de l'algo de façon à améliorer itérativement ses performances.
Pour un exemple normal, compte tenu des puissances de calcul actuelles,
on pourra donner des ordres de grandeurs (dépendent du nombre de caractéristiques,
  du nombre d'exemples et de certains réglages des algos), mais fixons les idées :

- Apprentissage d'un réseau de neurone simple sur MNIST (60000 exemple, 789 carac, 10 classes)
=> 3 à 5 mn.
- Apprentissage d'un réseau de neurone simple sur ImageNet (1000000 exemple, ? carac, 1000 classes)
=> 2 a 3 jours...

De façon générale, quand on travaille sur un algorithme pour l'améliorer, il est souhaitable de maintenir cette durée d'apprentissage en dessous de 5mn, ce qui permet de multiplier les test... on ne peut pas toujours...

- apprentissage par la méthode du ppv ou kppv :
=> 0s, il n'y a pas de phase d'apprentissage pour ces algos

## Phase d'évaluation
Cette phase est souvent beaucoup plus rapide. Elle consiste a faire passer la base d'exemples (de validation) et comparer la prédiction avec la valeur attendue
pour compter les erreurs, par exemple.

Encore une fois, fixons les idées pour la durée de ces évaluations.

- Evaluation d'un réseau de neurone simple sur MNIST (60000 exemple, 789 carac, 10 classes)
=> 1s.
- Evaluation d'un réseau de neurone simple sur ImageNet (1000000 exemple, ? carac, 1000 classes)
=> 1mn...

- Evaluation par la méthode du ppv ou kppv sur MNIST :
=> 4mn...C'est d'ailleurs une des grosses limite de algo ppv et kppv (voir pages correspondantes).

## Phase de prédiction

Elle est également très rapide, puisqu'on fait simplement une prédiction
sur un ou plusieurs exemples et on renvoie la prédiction pour chaque exemple.
Son temps est comparable avec le temps d'une phase d'évaluation (a nombre d'exemple identiques), car la comparaison avec la valeur attendue est souvent négligeable.

## Programmes d'Apprentissage Automatiques dans la pratique :

Un programme qui réunirait toutes ces phases trouverait un temps comparable
pour MNIST entre *ppv* et *reseaux de neurones* si on additionne les temps de chaque phase.

Mais dans la pratique, on peut sans problème passer un temps fou à apprendre,
du moment que les prédictions sont rapides, car l'utilisateur final n'aura pas à faire de phase d'apprentissage

On découpe en général le code en 2 programmes séparés :

Le premier sert à mettre au point l'algo
1. apprentissage
2. Evaluation
3. sauvegarde des parametres de l'algo.

Le second est utilisé en prédiction pure :
1. chargement des paramètres de l'algo
2. prédiction

L'objectif est bien d'avoir le second programme qui s'éxecute le plus vite possible.
