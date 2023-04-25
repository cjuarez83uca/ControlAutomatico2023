% ej0425_LugarRaices
% Lugar de las ra�ces
% funci�n de transferencia de lazo abierto
numFTLA=1
denFTLA=[1 3 2 0]
rlocus(numFTLA,denFTLA)
K=1.04; % obtenido de gr�fica y hace Z=0.5
denFTLC=[1 3 2 K]
pLC=roots(denFTLC)
numFTLC=K;

FTLC=tf(numFTLC,denFTLC)

step(FTLC)

% otro ejemplo
numFTLA=1;
denFTLA=conv([1 0 0],[0.1 1]);
rlocus(numFTLA,denFTLA)




