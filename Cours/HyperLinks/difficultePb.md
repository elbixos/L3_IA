# Difficulté intrinsèque d'un problème
*(niveau 1)*

Bon, cette partie est assez ...étrange...

Reprenons notre problème de classification
des sexes, sur la bases des informations de taille, poids (valable en france).

Nous obtenons, après de nombreux essais, des performances de l'ordre de
0.85 en apprentissage, mais aussi en généralisation.

Parmi ces essais, nous avons essayé de nombreuses choses :
- des modèles en overfitting (avec des performances meilleures en apprentissage, mais moins bonnes en généralisation)
- des modèles en underfitting (avec des performances moins bonnes, en apprentissage et en généralisation)

Qu'est ce qui cloche, alors ?
Dans ce cas très précis, rien du tout.
Je pourrais ajouter des millions d'exemples, complexifier mes algorithmes autant que je le voudrais, nous n'aurions pas de meilleures performances.
Nous sommes limités par **la difficulté intrinsèque du problème**.

Les informations que l'on fournit à l'algorithme (taille et poids) sont simplement insuffisantes pour faire mieux.

Dans le cas très précis de cet exemple, nous pouvons en être plus ou moins sûrs car l'exemple est simple et l'on peut facilement générer l'algorithme optimal *(au sens de l'accuracy)* pour cette tâche (à l'aide d'un peu de **théorie Bayesienne de la décision**).

Il suffit alors d'appliquer cet algorithme optimal et d'observer ses performances en généralisation : 0.85

Pourquoi ne ferions nous pas la même chose dans tous les cas ?
Simplement parce que les données sont trop complexes pour que ces techniques soient applicables.

Dans la pratique, **on ne sait presque jamais quelles performances on peut atteindre**.

La solution trouvée par les chercheurs consiste à faire des compétitions d'algorithmes pour une base de donnée spécifique. On les appelle des **Challenges**. On considère traditionnellement que le meilleur résultat d'un challenge donne **une vague idée** de la difficulté du problème que représente la base *(si toutefois celle ci est bien faite)*

Pour information, L'équipe **Spike Train** du Lamia se bat actuellement bec et ongles dans un challenge visant à reconnaitre des espèces de cachalots
sur la base de signaux audios.

Après une domination initiale fort agréable pour l'ego, nous sommes actuellement dépassés par d'autres compétiteurs, mais nous comptons sur un stage de Master 1 pour regagner notre place préférée... (*sinon, on dira que c'est de la faute du stagiaire*)
