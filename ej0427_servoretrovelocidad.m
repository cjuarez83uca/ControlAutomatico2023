%ej0427_servoretrovelocidad
% FTLC=K/(s^3+3*s^2+2s+Ks+K)
% z=0.7
num=1;
den=[1 2 0];
rlocus(num,den)
K=2.04; %hace que factor de amortiguamiento sea de 0.7

numLC=[K];
denLC=[1 3 2+K K];
T=tf(numLC,denLC);
step(T)