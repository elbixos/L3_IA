# Séparer sa base d'exemples
*(niveau 1)*

Le plus souvent, on dispose, pour les applications d'apprentissage supervisé,
d'une base d'exemples, définis par leur caractéristiques et munis d'une vérité associée.

A partir de ces exemples, il va falloir créer au moins 2 bases :
- la base d'apprentissage
- la base de validation

Il faut aussi définir combien d'exemples feront partie de chaque base.

## Règle ad hoc pour les tailles de base.
Cette règle est **complètement empirique** et concerne la taille relative des 2 bases. Les valeurs de proportion et de taille limite des bases sont purement indicatives...

### Petites bases
Pour une base de moins de 1000 exemples
On prendra quelque chose comme :
- 66% apprentissage
- 33% validation

### grandes bases
Pour une base de plus de 100 000 exemples,
on pourrait prendre quelque chose comme :
- 90% apprentissage
- 10% validation

## Algo de séparation des bases.

Ces deux bases doivent avoir **des propriétés semblables** même si c'est délicat
à expliquer. Par exemple, on ne voudrait pas :
- qu'une base contienne tous les exemples faciles, alors que l'autre contiendrait tous les exemples difficiles.
- qu'une base contienne bcp d'exemples d'une classe alors que l'autre n'en contiendrait que peu.

### Principe de base

Si l'on dispose de suffisamment d'exemples, et que les classes sont équilibrées,
on peut sans problème procéder comme suit :

1. On fixe une proba *p* d'appartenir à la base d'apprentissage (p=0.66 par exemple)
2. Pour chaque exemple :
  - on tire un nombre *tirage* aléatoirement entre 0 et 1.
  - Si *tirage < p*:
    - on range l'exemple dans la base d'apprentissage
  - Sinon
    - on range l'exemple dans la base de généralisation

Ceci garantit que les bases soient a peu près bien formées.

### Principe amélioré

Il peut être important, si certaines classes sont peu représentées, de bien veiller
à ce que certaines classes ne disparaissent pas ou presque de l'une ou l'autre des bases. On prendra alors certaines précautions lors des tirages aléatoires pour
que ceci ne se produise pas.

En python, la fonction *train_test_split* du module *sklearn.model_selection*
permet de choisir ce comportement avancé, avec le paramètre *stratify*.
