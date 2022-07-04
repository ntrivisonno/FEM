%
%  Llamada a la visualizacion de resultados
figure(1)
colormap('jet');pltcntcol(in,xx,iel,eltype,conec,u);colormap('jet');view([34 14]);
xlabel('Eje x','FontSize',12)
ylabel('Eje y','FontSize',12)
zlabel('u','FontSize',12)   
title('Temperatura')
colormap jet
colorbar
view(-25, 22)
print -dpng figuras/fig1.png;
   
figure(2)
pltcnt(in,xx,iel,conec,u);
xlabel('Eje x','FontSize',12)
ylabel('Eje y','FontSize',12)
title('Isotermas')
colormap jet
print -dpng figuras/fig2.png;