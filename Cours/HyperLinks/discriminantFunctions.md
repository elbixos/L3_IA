<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# Fonctions Discriminantes / Régions de décisions
(niveau 2)

Voyons comment formaliser la mise au point d'un algorithme de classification

#### Régions de décisions
On peut considérer que classifier, c'est *partitionner l'espace des
caractéristiques en* **régions de décisions**. Chaque **classe** (*i*) est
représentée par une région *Ri* et la prise de décision se fait de la façon
suivante :
```python
for i in classes :
  if x in Ri :
    decision = i
```

Par exemple, un algorithme qui trouve la meilleure droite fonctionne comme cela.

#### Fonctions discriminante.
On peut également raisonner en termes de **fonctions discriminantes** :
Chaque classe *i* dispose d'une fonction *fi(x)* qui calcule le score d'un objet
qui est potentiellement de sa classe.
On cherche alors la classe ayant obtenu le score le plus haut.

Mathématiquement, l'algorithme est le suivant :
$$ decision = argmax_{i} f_i(x) $$

Cette version est beaucoup plus souple que les régions de décisions.

- L'algorithme du plus proche voisin travaille par exemple avec comme fonctions
discriminantes :

$$ f_i(x) = - min_{P in C_i} d(x,P) $$

- L'algorithme des k plus proches voisins travaille par exemple avec comme
fonctions discriminantes :

$$ f_i(x) = nbVoisins in C_i $$

- Je pourrais illustrer ceci par des réseaux de neurones, comme en cours, mais
je n'ai pas le temps tout de suite...
