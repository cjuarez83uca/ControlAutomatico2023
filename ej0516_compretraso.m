% ej0516_compretraso

G=tf([1.06],conv([1 0],conv([1 1],[1 2])))

rlocus(G)

pd=-0.3307+0.5864*1i;

B=10;
z=0.05;
p=z/B;
% simbolico
syms s
Gcs=(s+z)/(s+p);
angGcs=double(angle(subs(Gcs,s,pd)))*180/pi


% lugar de las raices con el contralador
Gc=tf([1 z],[1 p]);
figure
rlocus(G*Gc)

