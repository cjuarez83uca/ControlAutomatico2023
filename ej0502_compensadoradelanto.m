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
k=0.1;

T=G*k/(1+k*G);
figure(1)
hold on
step(T)
hold off
legend('sin k','con k=0.1')

nu
