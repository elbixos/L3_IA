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

fumeurs = 0.33
nonFumeurs = 1-fumeurs


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
print('taillePoidsClassif2.png','-dpng')

mHommes = mean(exHommes)
mFemmes = mean(exFemmes)

figure()
plot (exHommes(:,1),exHommes(:,2),'.b')
hold on
plot (exFemmes(:,1),exFemmes(:,2),'.r')
plot (mHommes(:,1),mHommes(:,2),'ob')
plot (mFemmes(:,1),mFemmes(:,2),'or')
xlabel('taille')
ylabel('poids')
legend('hommes', 'femmes', 'barycentre homme','barycentre Femme')
print('taillePoidsClassif2Bary.png','-dpng')

figure()
plot (mHommes(:,1),mHommes(:,2),'ob')
axis([1.30 2.0 20 120])
hold on
plot (mFemmes(:,1),mFemmes(:,2),'or')
plot (unknown(:,1),unknown(:,2),'ok')
xlabel('taille')
ylabel('poids')
legend('barycentre homme','barycentre Femme','inconnu')
print('taillePoidsClassif2BaryPredict.png','-dpng')
