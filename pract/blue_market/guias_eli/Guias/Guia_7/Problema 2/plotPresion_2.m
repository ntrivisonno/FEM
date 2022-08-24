function plotPresion(p, xx, conec)
%solo válido para el elemento Q1-P0
%p: vector con presiones
%xx: coordenadas nodos malla
%conec: conectividades

% [x,y]=meshgrid(0:lenx/numx:lenx,0:leny/numy:leny);
% 
% u1=u(1:2:end-length(iel));
% mu1=u1.*u1;
% uu=reshape(u1,numx+1,numy+1)';
% 
% u1=u(2:2:end-length(iel));
% mu2=u1.*u1;
% vv=reshape(u1,numx+1,numy+1)';
% 
% 
% fig5 = figure
% p=sqrt(mu1+mu2);
% mod=reshape(p,numx+1,numy+1)';
% colormap 'jet'
% contourf(x,y,mod);                       
% colorbar
% title('Presion')
% xlabel('X')
% ylabel('Y')
% axis equal
% print(fig5,'contourV','-dpng')
% 



box on
fig3 = figure(1)
colormap 'parula'
title('Presion')
 xlabel('X')
 ylabel('Y')
axis([-0.1,1.1,-0.1,1.1])
pe = zeros(size(conec,1),4);
for i=1:size(conec,1)
    pe(i,:)=[p(i),p(i),p(i),p(i)];
end
X=[xx(conec(:,1),1),xx(conec(:,2),1),xx(conec(:,3),1),xx(conec(:,4),1)];
Y=[xx(conec(:,1),2),xx(conec(:,2),2),xx(conec(:,3),2),xx(conec(:,4),2)];
%axis equal

for i=1:size(pe,1)
    patch(X(i,:),Y(i,:),pe(i,:))
end
colorbar
 
print(fig3,'presion','-dpng')
end

