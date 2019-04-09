### L'instant Philo

- correlation pas preuve

### Normalisation des données

### La malédiction de la dimensionnalité.

Ce problème concerne essentiellement les applications de classification.

Quel que soit le problème que vous voulez traiter, il semble intéressant de
disposer d'autant d'informations que possible à propos des objets que vous
voulez classifier.

Par exemple, on peut se dire qu'un algorithme qui travaille sur un vecteur
de caractéristiques *[taille, poids]* sera moins efficace qu'un algorithme
travaillant sur les caractéristiques
*[taille, poids, longueur des cheveux, salaire, prix de la voiture,...]*
Étonnamment, ce n'est pas toujours le cas...

Quel que soit l'algorithme que vous utilisiez, il s'appuiera sur les exemples
que vous lui fournirez pour prendre sa décision.
Le nombre d'exemples d'apprentissage est donc directement lié à la connaissance
que votre algorithme aura du problème à traiter.

Or la taille du vecteur de caractéristiques influe grandement sur le nombre
d'exemples dont on doit disposer pour que l'algorithme dispose de suffisamment
d'informations.

Ce que je veux montrer, c'est que pour un nombre d'exemples donnés,
il va y avoir un compromis à trouver
- peu de caractéristiques => problème mal connu (évident)
- trop de caractéristiques => pas assez d'exemples pour bien connaître le
problème.

Essayons de chiffrer tout ceci grossièrement :
- Disons que chacune de nos caractéristiques prend une valeur prise entre 0
et n-1 (il y a *n* valeurs possibles par caractéristiques).
- On dispose au total de N exemples

la connaissance de notre problème est liée au nombre moyen d'exemples par valeur
possible des caractéristiques *d*.

pour *d=1* : une seule caractéristiques.
tous mes exemples tombent dans l'une des *n* valeurs possibles pour cette
caractéristique.
La valeur moyenne de


$$y = f(x)$$
