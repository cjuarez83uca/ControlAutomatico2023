% ej0502_compensadoradelanto
% función de transferencia de lazo abierto
G=tf(10,conv([1 0],[1 1]));
% función de transferencia de lazo cerrado
T=G/(1+G);
figure(1)
step(T)
title('Respueta al escalon, lazo cerrado sin compensadores')

% probemos con K
K=0.02:0.0001:0.1;
figure(2)
rlocus(G,K)
% respuesta al escalón con K
k=0.1;% amortiguamiento 0.5

T=G*k/(1+k*G);
figure(1)
hold on
step(T)
hold off
legend('sin k','con k=0.1')

% Definciencia de ángulo
% simbólico
syms s

Gs=10/(s*(s+1))

polos=roots([1 3 9])

pd=polos(1)

Gpd=subs(Gs,s,pd)
anguloGpd=angle(Gpd)
anguloGpd=double(anguloGpd)

phiC=pi-anguloGpd 
% obtenidos por método 1
z=1.9373
p=4.6458

Gc=tf([1 z],[1 p])

% calculo de Kc
figure
rlocus(G*Gc)

Kc=1.24;

T1=Kc*G*Gc/(1+Kc*G*Gc)
hold on
step(T1)


% por método 2
Gc2=tf([1 1],[1 3])
Kc2=0.9;
T2=Kc2*G*Gc2/(1+Kc2*G*Gc2)
hold on
step(T2)


% respuesta a la rampa de los sistemas
t=0:0.001:10;
figure
lsim(T,t,t)
hold on
lsim(T1,t,t)
lsim(T2,t,t)





