# Algorithmes de Clustering
*(niveau 1)*

Je déconseille de lire les sections qui suivent si
vous n'avez pas encore lu le [cours 2](../02_cours2.md) qui met en place
le vocabulaire nécessaire à une bonne compréhension.

Dans la plupart des cas, il s'agit de regrouper les exemples en $$k$$ clusters
dont la forme et la position ne sont pas connus au départ. ($$k$$ est souvent fixé
par l'utilisateur).

Il existe de nombreux algorithmes de **clustering**. Pour évaluer un algorithme,
on peut faire appel à un expert humain, ou tenter de mesurer quantitativement
la qualité des clusters trouvés à l'aide d'une [mesure de performance](perfMeasures.md) telle que **l'indice de silhouette**.

## kmeans

C'est le plus simple. Il est souvent extrêmement efficace, implémenté dans tous
les langages... ne faites pas l'impasse dessus.

Pourquoi refaire une explication quand il y en au une bonne ?
voyez [la page wikipédia](https://fr.wikipedia.org/wiki/K-moyennes) correspondante.
Un peu de lecture et le suivi de l'illustration du fonctionnement devrait suffire.

C'est un **algorithme basé distance**, il est donc sensible au problème des
**données non normalisées** vu dans la partie [distances](distance.md) de ce cours.

## Regroupement hierarchique

Pour ceux que cela intéresse, il y a aussi des techniques hiérarchiques qui vont essayer de regrouper les $$n$$ exemples de la base en clusters homogènes.
Le plus connu porte le nom de  **classification ascendante hiérarchique** (CaH).
Dans ce cas, on part de $$n$$ clusters (un par exemple) et on fusionne itérativement les moins pertinents jusqu'a n'en avoir plus que $$k$$

## Les réseaux de neurones

Le clustering n'est pas leur point fort. Il y a bien les **cartes auto adaptatives** ou **Self Organizing Maps** ou **cartes de Kohonen** ainsi que de nombreuses autres curiosités, mais je ne suis pas, personnellement, très au point la dessus.
