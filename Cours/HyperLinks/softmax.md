<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# softmax
*(niveau 2)*

Il s'agit ici de normaliser les
sorties d'un algorithme de classification.
Imaginons un algorithme ayant pour
sortie $$[-12, 2, 3.5, 0.2]$$

On voudrait pouvoir interpreter cette sortie
comme : **L'algorithme pense que c'est la classe 2 avec une proba de ...**

Une façon de faire ceci de façon approchée est d'utiliser la fonction **softmax**,
dont voici la formule pour une sortie $$j$$. $$k$$ va parcourir toutes les sorties

$$ \sigma (z_{j}) = {\frac {e^{z_{j}}}{\sum _{k} e^{z_{k}}}} $$

Voici un code qui ferait cette conversion en utilisant le softmax de *scipy*.
Il existe aussi un softmax dans *tensorflow* que l'on utilisera préférentiellement dans le cadre des réseaux de neurones.

```python
from scipy.special import softmax

out = [-12, 2, 3.5, 0.2]
outNorm = softmax(out)
print (outNorm)
```

Ceci donne le résultat suivant :

```python
[1.47251704e-07 1.77085530e-01 7.93642282e-01 2.92720411e-02]
```

Nous pouvons lire ceci comme *l'algorithme pense que cela pourrait être la classe* :
- **2** avec une proba de 0.7
- **1** avec une proba de 0.17
- **3** avec une proba de 0.029
- **0** avec une proba négligeable
