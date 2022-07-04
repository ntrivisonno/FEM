%
%  Llamada a la visualizacion de resultados
figure(1)
pltcntcol(in,xx,iel,eltype,conec,u);
xlabel('Eje x','FontSize',12)
ylabel('Eje y','FontSize',12)
zlabel('Temperatura','FontSize',12)   
axis tight
set(gca, 'fontsize', 12)
colormap hsv
%colorbar
saveas(gcf,'Variacion de Temperatura.png')

%    
% figure(2)
% pltcnt(in,xx,iel,conec,u);
% xlabel('Eje x','FontSize',12)
% ylabel('Eje y','FontSize',12)
% axis tight
% set(gca, 'fontsize', 12) 
% colormap hsv
% saveas(gcf,'Curva de Nivel.png')

