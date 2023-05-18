% Planta
G=tf([1],[1 4 0 0]);

% requerimientos:
ts=5; Mp=0.20;
sig=4/5;
wd=-sig*pi/log(Mp);
disp('Polo dominante: ')
pd=-sig+wd*1i


% bastará la ganacia?
figure
rlocus(G)
% NO SE LOGRA POR TANTO NECESITO UN COMPENSADOR
% Sintonización del compensador en adelanto
% 1. Deficiencia de ángulo
syms s
Gs=1/(s^2*(s+4));
angGpd=double(angle(subs(Gs,s,pd)));
phit=pi-angGpd


m=4;
phi=phit/m;
phid=phi*180/pi

% calculo de z y p con condición de ángulo
z=4;
p=wd/tan(angle(pd+z)-phi)+sig


Gcs=(s+z)/(s+p);
angGcpd=double(angle(subs(Gcs,s,pd)))*180/pi

% Condición de magnitud
Gc=tf([1 z],[1 p])^m
figure
rlocus(G*Gc)

Kc=8.55e3;
T=Kc*G*Gc/(1+Kc*G*Gc)
[y,t]=step(T);
figure
plot(t,y)
hold on
plot([0 t(end)],[0.98 0.98],'r')
plot([0 t(end)],[1.02 1.02],'r')



Gcs=Gcs^m;
Ts=Kc*Gs*Gcs/(1+Kc*Gs*Gcs);
[num,den]=numden(Ts);
n=double(flip(coeffs(num)));
d=double(flip(coeffs(den)));
n=n/d(1);
d=d/d(1);
disp('Ceros')
zlc=roots(n)
disp('Polos')
plc=roots(d)












