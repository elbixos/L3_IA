close all
clear all

% données en france
mTailleHommes = 1.73
sTailleHommes = 0.07

mTailleFemmes = 1.63
sTailleFemmes = 0.065

mPoidsHommes = 77
sPoidsHommes = 13 
mPoidsFemmes = 63
sPoidsFemmes = 10

pHommes = 0.48
pFemmes = 1-pHommes

nExemples = 500

%% tweak !
nHommes = nExemples * pHommes
exHommes = [(randn(nHommes,1)*sTailleHommes+1.82),(randn(nHommes,1)*sPoidsHommes+mPoidsHommes)]

nFemmes = nExemples * pFemmes
exFemmes = [(randn(nFemmes,1)*sTailleFemmes+1.50),(randn(nFemmes,1)*sPoidsFemmes+mPoidsFemmes)]


plot (exHommes(:,1),exHommes(:,2),'.b')
hold on
plot (exFemmes(:,1),exFemmes(:,2),'.b')
xlabel('taille')
ylabel('poids')
print('taillePoidsCluster.png','-dpng')

%% %% tweak aussi...
nHommes = nExemples * pHommes
exHommes = [(randn(nHommes,1)*sTailleHommes+mTailleHommes),(randn(nHommes,1)*sPoidsHommes+mPoidsHommes)]

nFemmes = nExemples * pFemmes
exFemmes = [(randn(nFemmes,1)*sTailleFemmes+1.55),(randn(nFemmes,1)*sPoidsFemmes+mPoidsFemmes)]

unknown = [1.60,72]

figure()
plot (exHommes(:,1),exHommes(:,2),'.b')
hold on
plot (exFemmes(:,1),exFemmes(:,2),'.r')
plot (unknown(:,1),unknown(:,2),'ok')
xlabel('taille')
ylabel('poids')
legend('hommes', 'femmes', 'Inconnu')
print('taillePoidsClassif.png','-dpng')