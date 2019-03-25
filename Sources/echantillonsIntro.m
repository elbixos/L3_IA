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



clopesFumeurs = uint8(randn(fumeurs*nExemples,1)*15+15)
clopesNonFumeurs = zeros(uint8(nonFumeurs*nExemples),1)

all = [clopesFumeurs;clopesNonFumeurs]
all = double(all)
moyVie = 71.8
sVie = 15.927
esperanceAvantClopes = randn(size(all))*10.5 + moyVie

% une cigarette = 5mn de vie en moins...
% => nb min en moins sur une vie = 5* esperance de vie * 365 *nbClopes 
% => nb années en moins = 5* esperance de vie * 365 *nbClopes / 60 / 24 /365
% => nb années en moins = 5* esperance de vie *nbClopes / 60 / 24 

%% TWEAK : ^1.6 pour accentuer.
perte = (1+(5* esperanceAvantClopes.*all /60 /24)).^1.6
esperance = esperanceAvantClopes - perte

figure()
plot(all, esperance,'.')
axis([[0 30 0 inf]])
hold on
plot([14,14],[0,100],'k')
xlabel('nb Cigarettes')
ylabel('Esperance de vie')
print('clopesRegression.png','-dpng')
