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
Nous l'avons déja vu de nombreuses fois.
La **probabilité d'erreur** est mesurée comme la proportion d'erreurs
commise sur un ensemble d'exemples.

Son pendant est la **Proba de classification correcte** : la proportion de bonnes décisions.
Celle ci se traduit par **accuracy** en anglais, ce qui est trompeur (pour la précision, que l'on verra plus loin)

On pourra, par exemple, avoir un algorithme qui reconnait les hommes et les femmes
avec une **accuracy** de 0.9 en validation. On peut donc s'attendre à ce qu'il reconnaisse le sexe d'un individu dans 90% des cas en moyenne.

### Matrice de confusion
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
Ce sont des


## Evaluation d'erreur sur un exemple.
*(niveau 2)*


- des mesures pour l'évaluation de la performance en apprentissage
ou en validation


TODO
1
