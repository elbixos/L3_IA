
<script type="text/javascript" async src="//cdn.bootcss.com/mathjax/2.7.0/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/javascript" async src="https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js?config=TeX-MML-AM_CHTML"></script>


# Les biais dans les bases d'Exemples
(niveau 2)

Ici, il s'agit de comprendre un piège majeur et souvent indétectable.
Pour le comprendre, voici un exemple, nous verrons plus loin ce qu'il
implique pour le Machine Learning.

## L'exemple simple

Imaginons un médicament, pour l'asthme  *(en fait,
ce que je décris a été observé pour les cancers, mais ma femme trouve que c'est anxiogène, alors je vais vous parler de l'asthme)*.
Vous avez le choix entre 2 traitements, **A** ou **B**.
Vous regardez donc des études...

### Etude 1

les données sont très claires : sur l'ensemble des cas, en moyenne, **A** fonctionne mieux que **B**.

Quel traitement choisiriez vous ? (ben oui, **A**...)

### Etude 2

Cette étude a séparé les cas d'asthme en deux catégories
- les cas graves
- les cas bénins

Les données sont également très claires :
- dans les cas graves, le traitement qui, en moyenne, fonctionne le mieux est **B**
- dans les cas bénins, le traitement qui, en moyenne, fonctionne le mieux est ... **B** aussi.

### Combinaison des deux études
*Wait, What ?*
je reprends vous êtes atteint d'asthme, de la forme que vous voulez (grave ou pas).
- une étude vous dit que **A** fonctionne mieux, en moyenne.
- une étude vous dit que **B** fonctionne mieux dans chaque cas envisagé (donc B est meilleur...) !

Pourtant, les chiffres de ces deux études sont **corrects** et elles **travaillent
sur la même base d'exemples**.

*Mais, ca n'est pas possible ...*

ben si, prenez ces chiffres :
- 1000 cas, 200 graves, 800 bénins.
- traitement *A*, appliqué a 600 bénins, fonctionne pour 580
- traitement *B*, appliqué a 200 bénins, fonctionne pour 198
- traitement *A*, appliqué a 50 graves, fonctionne pour 25
- traitement *B*, appliqué a 150 graves, fonctionne pour 100

Voyons les résultats : Le code exécutable est [ici](https://colab.research.google.com/drive/19_GNvd23PtFOutgH2FXgE0aO8J8_qdHx)
*(Notez que dans cet exemple, vous trouverez une analyse plus poussée qu'ici,
liée à un sujet d'actualité (...), que je compte repasser à tous les gens qui me parlent de traitements pour le coronavirus sans être ni médecins, ni compétents
en analyse de données.)*

Mon programme affiche les recommandations les plus appropriées :
```
cas général : Take A
cas bénins, take B
cas graves, take B
```

*Mais, ca n'est pas possible ...*

En fait si, mais c'est sournois. Ce n'est possible que si la base présente
un **biais** majeur.

### Le biais
Cette situation n'est possible à la base que parce que on administre plus
facilement le traitement **A** aux cas *bénins* (600 sur 800), lesquels sont
de beaucoup les plus nombreux (800 sur 1000).

De fait, nous évaluons deux traitements qui n'ont pas eu des conditions
équitables lors de la constitution de la base.

Cela pourrait être le cas dans la pratique si, par exemple  le traitement **A**
était relativement facile à mettre en oeuvre (un comprimé matin et soir),
alors que le traitement **B** serait très lourd à mettre en oeuvre (disons 2h de bloc chirurgical. *oui, pour de l'asthme, ce serait lourd*).

Formuler ce qui pose problème de façon précise est assez délicat. Tenant nous
en à cette phrase que j'essayerais plus loin d'appliquer aux problèmes de machine
Learning :

**la base est biaisée si la prédiction est basée sur des paramètres
dont les exemples ont été choisis en fonction de la valeur de la prédiction**

###
