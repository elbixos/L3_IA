<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# Mesures de performances.
*(niveau 1)*

Je vais distinguer ici des mesures de performances pour
- l'évaluation d'un algorithme sur une base.
- l'évaluation de l'erreur commise par un algorithme sur un exemple

Commençons par la première catégorie, c'est la plus simple.

## Evaluations de performances pour la classification.

### Proba d'erreur et proba de succès.
*(niveau 1)*
Nous l'avons déja vu de nombreuses fois.
La **probabilité d'erreur** est mesurée comme la proportion d'erreurs
commise sur un ensemble d'exemples.

Son pendant est la **Proba de classification correcte** : la proportion de bonnes décisions.
Celle ci se traduit par **accuracy** en anglais, ce qui est trompeur (pour la précision, que l'on verra plus loin)

On pourra, par exemple, avoir un algorithme qui reconnait les hommes et les femmes
avec une **accuracy** de 0.9 en validation. On peut donc s'attendre à ce qu'il reconnaisse le sexe d'un individu dans 90% des cas en moyenne.

### Matrice de confusion
*(niveau 1)*
Cela permet de plonger un peu plus profond dans l'analyse des résultats.
Il va s'agir de compter les décisions de l'algorithme dans chaque cas possible.

Prenons une base contenant 600 hommes et 400 femmes.
je noterais
- Hvrai, Fvrai le véritable sexe des individus.
- Hpred, Fpred le sexe prédit par l'algorithme.

On pourrait observer quelque chose comme :

| ...   | Hvrai | Fvrai |
|---|:---:|:----:|
| **Hpred** | 480   |   20  |
| **Fpred** | 120   |   380 |

C'est ce que l'on appelle la **matrice de confusion** de l'algorithme.

Elle comporte autant de lignes et autant de colonnes que de classes.

Elle est souvent riche d'enseignements.
Ici, on voit par exemple que notre algorithme commet beaucoup plus d'erreur quand on lui présente des hommes (120/600)  que quand on lui présente des femmes (20/400)


### Précision / Rappel
*(niveau 3)*

*Cette portion n'est pas primordiale pour le cours, néanmoins, elle vous permettra de vous poser des questions intéressantes sur les mesures de performances que l'on peut vous proposer dans des cas précis.*

Ce sont des mesures que l'on utilise pour les problèmes à deux classes, en particulier dans le domaine médical ou les problèmes de recherche de documents pertinents (moteurs de recherche).

Reprenons notre matrice précédente, mais changeons les classes pour les adapter à un test de grossesse, par exemple :

| ...   | Enceinte vrai | Pas Enceinte Fvrai |
|---|:---:|:----:|
| **Enceinte pred** | 480   |   20  |
| **Pas Enceinte pred** | 120   |   380 |

Ce test avait une probabilité de classification correcte moyenne de 860/1000, ce qui n'est pas terrible, mais voyons d'autres mesures intéressantes.

Sa **précision** est la proportion de vrais cas détectés parmi les détections que fait l'algo

Dans notre cas, c'est
$$ precision = 480/500 $$.
Cela se traduit par *la probabilité d'etre enceinte si le test dit que vous l'êtes*.


Son **rappel** est la proportion de cas détectés parmi les cas qu'il aurait du détecter. On l'appelle aussi **sensibilité**

Dans notre cas, c'est
$$ rappel = 480/600 $$.
Cela se traduit par *la probabilité que le test vous dise que vous etes enceinte si vous l'êtes*.

## Evaluation d'erreur sur un exemple.
*(niveau 2)*

Cette partie est un peu plus complexe.
Il s'agit, pour un algo donné, d'évaluer la qualité de son résultat.
Cela a des influences **majeures** sur les algorithmes d'optimisation.

Commencons par les algorithmes de classification.

### Décision correcte ou fausse
C'est la première mesure à laquelle on pense.

Imaginons ainsi un algorithme $$A1$$ dans un problème a 2 classes ayant 2 sorties
et opérant par [fonctions discriminantes](discriminantFunctions.md).

Sous réserve que l'on a normalisé ses sorties (voir [softmax](softmax.md), la sortie de l'algorithme $$A_1$$
pour un exemple donné pourrait être quelque chose comme :
$$[0.1, 0.9]$$

Si la vérité associée à cet exemple est la classe 0, l'algorithme a tort. Si c'est la classe 1, l'algorithme a raison.

Ceci nous a permis de définir comme mesure performance des algorithmes la **probabilité de classification correcte**, par exemple.

Le problème est que cette mesure est très quantifiée. Prenons un algorithme $$A_2$$, dont la sortie sur cet exemple est $$[0.3,0.7]$$

Mesuré par la simple exactitude de la décision, $$A_1$$ et $$A_2$$ sont équivalents. Pourtant :
- Si la vraie classe est 0, les deux algorithmes ont tort. Néanmoins, *A_2* est meilleur, car la valeur de sortie pour sa classe 0 est plus élevée (0.3) que celle de *A_1* (0.1)
- Si la vraie classe est 1, les deux algorithmes ont raison. Néanmoins, *A_1* est meilleur, car la valeur de sortie pour sa classe 1 est plus élevée (0.9) que celle de *A_2* (0.7)

Cette capacité a distinguer deux algorithmes de façon fine permettra aux algorithmes d'optimisation de modifier les poids progressivements, en vue d'obtenir, peut être, un algorithme optimal pour cet exemple.

Quelles seraient les sorties de cet algorithme optimal ?
- Si la vraie classe est la classe 0, les sorties (normalisées) seront, au mieux *[1,0]*
- Si la vraie classe est la classe 1,
les sorties (normalisées) seront, au mieux *[0,1]*

Cette remarque permet en particulier de penser le codage des vérités sous une nouvelle forme, que l'on appelle **One Hot Vector** (et que vous avez peut être déjà croisée dans [types de caractéristiques](featureTypes.md))

### Entropie croisée
*(niveau 2)*

C'est une mesure d'écart entre 2 distributions.

On voudrait un algorithme qui donne une sortie de type [1,0,0,0] (pour un problème a 4 classes et un exemple donné)

On a un algorithme qui donne une sortie comme [0.5, 0.2,0.2,0.1] pour l'exemple donné.

On peut mesurer l'écart entre la distribution attendue $$P=[1,0,0,0]$$ et la distribution obtenue $$Q=[0.5,0.2,0.2,0.2]$$ à l'aide de l'**entropie croisée** (*cross entropy** en anglais), dont voici la formule :

$$H(P,Q) = -\sum_i p_i log(q_i)$$

*Notez que cette mesure n'est pas vraiment une distance puisqu'elle n'est pas symétrique. ($$H(P,Q))
!= H(Q,P)$$)*

Cette mesure est très utile en Machine Learning, et on la retrouve énormément dans les réseaux de neurones. Pour plus de détails sur ces fonctions de pertes, voir [la page dédiée](loss.md)

Son utilisation suppose souvent que :
- les vérités soient encodées en **One Hot Vector**
- les sorties soit normalisées par un **softmax**.

## Fonction de perte et performances.

Comme on l'a vu plus haut, l'entropie croisée est une mesure intéressante (il y en a d'autres) pour guider l'algorithme d'optimisation lors de l'apprentissage :

Dans ce cas, **l'algorithme va choisir des poids pour optimiser l'entropie croisée moyenne sur la base**. Ce que l'algorithme optimise (minimise) est appelé la **fonction de perte** (ou *loss* en anglais).

Ceci ne nous empêchera aucunement de mesurer aussi les performances de l'algorithmes sur une base en termes de **probabilité de classification correcte** (*accuracy*). Cette mesure est plus facile à interpreter pour un humain, mais elle ne guide pas l'algorithme d'optimisation.


## Evaluations de performances pour la régression.
*(niveau 2)*

Imaginons maintenant un algorithme de régression.
Comment mesurer ses performances sur un ensemble d'exemples ?

On pourrait utiliser  **l'erreur quadratique moyenne** (*mean Squared error*),
qui, en dépit de son nom barbare, est facile à comprendre.

Pour chaque exemple, l'algorithme fait une prédiction (souvent un nombre réel). $$Y_i$$. On attendait la valeur vraie $$Yv_i$$.
Pour cet exemple, l'algorithme commet donc une erreur : $$Y_i - Yv_i$$.

La **MSE** sur un ensemble d'exemple est la **moyenne des carrés des erreurs**

$$MSE = \frac{\Sum_i (Y_i - Yv_i)^2 }{N} $$

Voila...


## Evaluations de performances pour le clustering.
*(niveau 2)*

Ici, je ne vais pas détailler les mesures, car elles sont complexes.
Je vais les lister pour que vous sachiez quoi chercher si vous êtes confrontés
au problème.

On pourra s'intéresser :
- à la mesure des **variances intra et variance inter des clusters**
- au **Coefficient de silhouette** de l'algorithme et des clusters.
