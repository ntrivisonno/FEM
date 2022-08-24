%function plotVelocity(lenx,numx,leny,numy,u)
%lenx: longitud del dominio en la dirección x 
%leny: longitud del dominio en la dirección y 
%numx: numero de divisiones en la dirección x
%numy: numero de divisiones en la dirección y
%u: vector con las velocidades

lenx = 1
leny = 1
numx = 10
numy = 10


% [x,y]=meshgrid(0:lenx/numx:lenx,0:leny/numy:leny);
% 
% u1=u(1:2:end);
% mu1=u1.*u1;
% uu=reshape(-u1,numx+1,numy+1)';
% 
% u1=u(2:2:end);
% mu2=u1.*u1;
% vv=reshape(-u1,numx+1,numy+1)';

% figure
% contourf(x,y,uu);                       
% colorbar
% title('Componente X de la velocidad')
% xlabel('X')
% ylabel('Y')
% axis equal
% 
% figure
% contourf(x,y,vv);                       
% colorbar
% title('Componente Y de la velocidad')
% xlabel('X')
% ylabel('Y')
% axis equal
% 
% figure
% quiver(x,y,uu,vv,5);                       
% title('Velocidad Vectorial')
% xlabel('X')
% ylabel('Y')
% axis equal

% figure
% p=sqrt(mu1+mu2);
% mod=reshape(p,numx+1,numy+1)';
% contourf(x,y,mod);                       
% colorbar
% title('|V|')
% xlabel('X')
% ylabel('Y')
% axis equal


%function plotVelocity(lenx,numx,leny,numy,u)
%lenx: longitud del dominio en la dirección x 
%leny: longitud del dominio en la dirección y 
%numx: numero de divisiones en la dirección x
%numy: numero de divisiones en la dirección y
%u: vector con las velocidades
% 
[x,y]=meshgrid(0:lenx/numx:lenx,0:leny/numy:leny);

u1=u(3:6:end);
mu1=u1.*u1;
uu=reshape(-u1,numx+1,numy+1)';

u1=u(2:6:end);
mu2=u1.*u1;
vv=reshape(u1,numx+1,numy+1)';

fig1 = figure
colormap 'winter'
contourf(x,y,uu);                       
colorbar
title('Componente en X de V')
xlabel('X')
ylabel('Y')
axis equal
print(fig1,'CompvelX','-dpng')

fig2 = figure
colormap 'winter'
contourf(x,y,vv);                       
colorbar
title('Componente en Y de V')
xlabel('X')
ylabel('Y')
axis equal
print(fig2,'CompvelY','-dpng')

fig3 = figure
colormap 'winter'
quiver(x,y,uu,vv,5);   
title('Campo de Velocidades')
xlabel('X')
ylabel('Y')
axis equal
print(fig3,'velvectorial','-dpng')

fig4 = figure
p=sqrt(mu1+mu2);
mod=reshape(p,numx+1,numy+1)';
colormap 'winter'
contourf(x,y,mod);                       
colorbar
title('Modulo de V')
xlabel('X')
ylabel('Y')
axis equal
print(fig4,'contourV','-dpng')


