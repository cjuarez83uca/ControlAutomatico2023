% ej0518_avion
% Quiero polos dominantes en -2+j2sqrt(3)
% información original:
G=tf([2 0.1],[1 .1 4 0]);
% lugar de las raices original
figure(1)
rlocus(G)

% Datos en Lazo cerrado del sistema original
syms s
Gs=(2*s+0.1)/(s^3+.1*s^2+4*s);
[ng,dg]=numden(Gs)
num=coeffs(ng)
num=flip(num)
num=double(num)
den=double(flip(coeffs(dg)))
den=[den 0];% si es tipo 1

% Eliminar el polo real cerca del origen
% Polo de lazo cerrado cerca del origen lo modifico eliminando el cero
% lazo abierto.
Gp=tf([1 8],[2 0.1]); % el 4 es para alejar el polo de lazo cerrado
figure(2)
rlocus(G*Gp)


% Angulo de deficiencia
% Nueva función de lazo abierto
Gps=(s+8)/(2*s+0.1)
Gns=Gs*Gps
pd=-2+1i*2*sqrt(3)

Gns_pd=subs(Gns,s,pd)
% angulo de Gns_pd
ang_Gns=double(angle(Gns_pd));

phiT=pi-ang_Gns;
phiTg=phiT*180/pi
nc=3;%cantidad de bloques de adelanto
phi=phiT/nc;

z=2;
sig=abs(real(pd));
wd=abs(imag(pd));

p=wd/tan(angle(pd+z)-phi)+sig;

% una vez elegidos z y p del compensador
Gc=tf([1 z],[1 p])^nc;

figure(3)
rlocus(G*Gp*Gc)

Kc=41;

%polos de lazo cerrado
Gcs=((s+z)/(s+p))^nc
Ts=(Kc*Gs*Gps*Gcs)/(1+(Kc*Gs*Gps*Gcs))

[num,den]=numden(Ts)
n=double(flip(coeffs(num)));
d=double(flip(coeffs(den)));
n=n/d(1);
d=d/d(1);

T=tf(n,d)
figure(4)
step(T)











