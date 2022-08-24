function plotStreamlines(lenx,numx,leny,numy,u,nxt,nyt)
%nxt: parámetro que controla la densidad de puntos de start de la
%streamline
%nyt: parámetro que controla la densidad de puntos de end de la
%streamline
%lenx: longitud del dominio en la dirección x 
%leny: longitud del dominio en la dirección y 
%numx: numero de divisiones en la dirección x
%numy: numero de divisiones en la dirección y
%u: vector con las velocidades

figure
[x,y]=meshgrid(0:lenx/numx:lenx,0:leny/numy:leny);
u1=u(1:2:end);
uu=reshape(u1,numx+1,numy+1)';

u1=u(2:2:end);
vv=reshape(u1,numx+1,numy+1)';

nxt=5;
nyt=5;
[sx,sy] = meshgrid(0:1/nxt:lenx,0:1/nyt:leny);
streamline(stream2(x,y,uu,vv,sx,sy));
axis equal
