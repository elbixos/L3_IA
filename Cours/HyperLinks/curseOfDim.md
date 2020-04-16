<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>

# La malédiction de la dimensionalité
*(niveau 1)*

## L'idée
Ce problème concerne essentiellement les applications de classification.

Quel que soit le problème que vous voulez traiter, il semble intéressant de
disposer d'autant d'informations que possible à propos des objets que vous
voulez classifier.

Par exemple, on peut se dire qu'un algorithme qui travaille sur un vecteur
de caractéristiques *[taille, poids]* sera moins efficace qu'un algorithme
travaillant sur les caractéristiques
*[taille, poids, longueur des cheveux, salaire, prix de la voiture,...]*
**Étonnamment, ce n'est pas toujours le cas...**

Quel que soit l'algorithme que vous utilisiez, il s'appuiera sur les exemples
que vous lui fournirez pour prendre sa décision.
Le nombre d'exemples d'apprentissage est donc directement lié à la connaissance
que votre algorithme aura du problème à traiter.

Or la taille du vecteur de caractéristiques influe grandement sur le nombre
d'exemples dont on doit disposer pour que l'algorithme dispose de suffisamment
d'informations.

Ce que je veux montrer, c'est que pour un nombre d'exemples donnés,
il va y avoir un compromis à trouver
- peu de caractéristiques => problème mal connu (c'est évident)
- trop de caractéristiques => pas assez d'exemples pour bien connaître le
problème.

Vous pouvez sauter à la section suivante si vous avez du mal avec les calculs

## Quantifions ceci
*(niveau 2)*

Essayons de chiffrer tout ceci grossièrement :
- Disons que chacune de nos caractéristiques est **discrete** et prend une valeur entre 0 et 9 (il y a *10* valeurs possibles par caractéristique).
- On dispose au total de N exemples

la connaissance de notre problème est liée au nombre moyen d'exemples par valeur
possible des caractéristiques.

1. pour *d=1* : une seule caractéristique.
  tous mes exemples tombent dans l'une des *10* valeurs possibles pour cette
  caractéristique.
  Le nombre moyen d'exemple par valeur possible est donc $$m_1 = N /10 $$
2. pour *d=2* : deux caractéristiques.
    chaque caractéristique possible est un couple de valeur. Il y a donc
    $10^2$ valeurs possibles pour mes vecteurs de caractéristiques.
    Le nombre moyen d'exemples par valeur possible est donc $$m_2 = N /10^2 $$
3. dans le cas général, le nombre moyen d'exemples par valeur possible est donc
$$m_2 = N /10^d $$

Comme on le voit, le nombre moyen d'exemple par valeur possible décroît
exponentiellement par rapport au nombre de dimensions...

**Donc en augmentant le nombre de caractéristiques, l'information que je tire d'un exemple décroit de façon exponentielle.**

Voyons le problème de l'autre côté. On veut garantir un nombre moyen d'exemples
constants. disons que 100 exemples étaient suffisants pour classifier selon le poids
seulement ($$m_1 = 100/10 = 10$$)

On veut ajouter une information (le poids). Il nous faudra ajouter des exemples
pour conserver ce nombre moyen d'exemples. On veut donc $$m_2=m_1$$
Ce qui implique :
$$ N/10^2 = m_1$$ soit $$N = m_1 * 10^2$$

Quand on augmente encore, on a $$ N = m_1 * 10^d$$.

il faudrait :
- d = 2 : $$N = 10*10^2 = 1000$$ exemples pour la *[taille, poids]*.
- d = 3 : $$N = 10*10^3 = 10000$$ exemples pour
*[taille, poids, longueur des cheveux]*
- d = 5 : $$N = 10*10^5 = 1 000 000$$ exemples pour
*[taille, poids, longueur des cheveux, salaire, prix de la voiture,...]*

## Conclusion

On voit ainsi qu'il serait important de conserver uniquement des informations
pertinentes pour la classification, sinon le nombre d'exemples nécessaire peut
devenir rapidement ingérable.

En résumé : si votre algorithme a de mauvaises performances :
- peut être qu'il est nul.
- peut être qu'il n'a pas assez d'informations (de caractéristiques)
- peut être qu'il a trop d'informations (de caractéristiques) pour la base
d'exemples que vous lui avez fourni.
