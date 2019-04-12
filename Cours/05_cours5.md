
<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>


### L'instant Philo

- corrélation pas preuve (suite) : la vaccination

### Théorie de la décisions

### Matrice de confusion


### Rappel et précision

Ces 2 termes sont utilisés pour des problèmes à deux classes,
et principalement en médecine.

Considérons 2 classes (positif / negatif) et un classifieur qui prend une
décision. Vous pouvez penser à un test de grossesse pour bien comprendre
le problème. Il peut se produire 4 cas :

- vrai positif (vraie classe : positif, décision du classifieur : positif)
- vrai négatif (vraie classe : négatif, décision du classifieur : négatif)
- faux positif (vraie classe : négatif, décision du classifieur : positif)
- faux négatif (vraie classe : positive, décision du classifieur : négatif)

Les 2 derniers cas sont les erreurs du classifieur.

- La **précision** est le nombre de vrais positifs sur le nombre total de
positifs déclarés par le tests. $$precision = \frac{vp} {vp+fp}$$
C'est aussi la probabilité d'être vrai dans la réalité sachant que le test dit vrai.

- Le **rappel** est le nombre de vrai positifs sur le nombre de positifs en
réalité
$$rappel = \frac{vp} {vp+fn}$$
C'est aussi la probabilité d'être positif au test quand on est positif en réalité.
