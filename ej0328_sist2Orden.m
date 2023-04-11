% ej0328_sist2Orden
% Z=[0 .1 .2 .3 .4 .5 .6 .7 .8 .9 1 1.2 2 4]Z
Z=0.4
figure
for i=1:length(Z)
fn=10;
wn=2*pi*fn; % frecuencia natural no amortiguada.
z=Z(i);% factor de amortiguamiento relativo
sys=tf([wn^2],[1 2*z*wn wn^2]);

t=0:1/fn/100:0.2;
% respuesta al escalón
[xx,tt]=step(sys,t);
hold on
plot(tt,xx)
end
% legend('0' ,'.1', '.2', '.3', '.4', '.5', '.6', '.7' ,'.8', '.9', '1', '1.2', '2','4')
