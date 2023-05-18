1 .1% ej0509_unceroS3erorden.m
G=tf([2 1],conv([1 0],conv([1 1],[1 2])))
% Comportamiento esperado
Mp=0.3;
ts=3;
sig=4/ts;
wd=-sig*pi/log(Mp);
pd=-sig+wd*1i

figure
rlocus(G)
Kc=6.3;
Ti=G*Kc/(1+G*Kc);
figure
[y,t]=step(Ti);
plot(t,y)
hold on
plot([0 t(end)],[1.02 1.02],'r')
plot([0 t(end)],[.98 .98],'r')

% a partir de función de transferencia
% tfdata
[num,den]=tfdata(Ti)
num=num{1};
den=den{1};
disp('ceros')
z1=roots(num)
disp('polos')
p1=roots(den)


