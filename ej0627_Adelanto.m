% ej0627_compensadorAdelanto
G=tf(4,[1 2 0])
figure(1)
margin(G)

T=G/(1+G);
figure(5)
step(T)
t=0:0.001:10;
figure(2)
lsim(T,t,t)

K=10;
G1=K*G;
figure(3)
margin(G1)

phic=39;
alfa=(1-sind(phic))/(1+sind(phic))

% Frecuencia de cruce de ganancia nueva
magGcwm=1/sqrt(alfa);
magGcwm=20*log10(magGcwm);% decibeles

wc=9; %rad/seg
z=sqrt(alfa)*wc; % 1/T
p=wc/sqrt(alfa); % 1/(alfa*T)


Gc=tf([1 z],[1 p])% sin Kc
Kc=K/alfa;
Gc=Kc*Gc;

figure(3)
hold on
bode(Gc)
Gtd=G*Gc;
bode(Gtd)

figure(4)
margin(Gtd)

T=Gtd/(1+Gtd);
step(T)
t=0:0.001:10;

figure(2)
hold on
lsim(T,t,t)