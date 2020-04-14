<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# Régression
*(niveau 1)*

Il s'agit donc de prédire une valeur (souvent un réel) pour un jeu de caractéristiques données de dimension $$n$$.
La régression consiste a trouver une estimation d'une fonction $$f$$ inconnue,
à $$n$$ entrées (les caractéristiques).

Il existe de nombreux algorithmes permettant de faire ceci.

## Ppv et kppv

Une solution à ce problème a déja été abordée dans les pages des algos de
[ppv](ppv.md) et [kppv](kppv.md), ou je vous présente en fin de page comment
adapter ces algos aux problèmes de régression.

Les limites de ces algos étant connues, voyons les autres possibilités.
Ces algos offrent tout de même l'avantage de pouvoir prédire une fonction quelconque.

## Régression linéaire
La solution la plus simple pour les matheux est de faire une **régression linéaire**.
On suppose dans ce cas que la fonction que l'on veut prédire est une droite
*(en fait un hyperplan dans un espace de dimension n)*.

$$f(x) = a_1.x_1 + a_2.x_2 + ... a_n.x_n + a_0$$

C'est un modèle très simple, dont on est sûrs qu'il ne risque pas de conduire
à du sur-apprentissage *(sauf si vous avez plus de caractéristiques que d'exemples,
ce qui sentirait mauvais...)*.

Il faut donc trouver les meilleurs paramètres $$(a_0, a_1,...a_n)$ décrivant cet hyperplan. En dimension $$n$$, il y en a ... $$n+1$$.

On pourra par exemple chercher les paramètres qui minimisent l'erreur
quadratique moyenne (voir [mesures de performances](perfMeasures.md)).
Dans ce cas, la solution est bien connue en mathématiques...

C'est simple, ca marche bien, mais seulement si la fonction a prédire forme une
droite *(un hyperplan)*. Eventuellement, il y a des régressions linéaires par parties, mais
c'est finalement du bricolage...


## Régression Quadratique et autres...

On suppose alors que la fonction à prédire est un polynome de degré $$p$$
des caractéristiques. Le modèle est plus complexe, donc potentiellement
apte à donner de meilleures performances, sous réserve qu'il ne fasse pas de sur-apprentissage.

Le principe est le même et les solutions sont aussi connues.

## Réseaux de neurones

Si la couche de sortie ne contient qu'un neurone, le réseau agit bien en régression.
Il doit prédire une valeur de sortie.

C'est la solution que je préconiserais si l'on dispose de nombreux exemples...
