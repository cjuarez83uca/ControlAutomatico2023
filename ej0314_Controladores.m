% ej0314_Controladores

% Sistema Gp=1080/(s*(s+6)*(s+18))

den=conv(conv([1 0],[1 6]),[1 18]);
num=1080;

Gp=tf(num,den)

rlocus(Gp)

Kcr=2.4;
Tcr=2*pi/10.4;
% PI
K1=0.45*Kcr;
Ti1=Tcr/1.2

%PID
K2=0.6*Kcr;
Ti2=0.5*Tcr;
Td2=0.125*Tcr;


