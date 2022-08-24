%
%  Llamada a la visualizacion de la malla

figure(1)
hold on
pltmsh3(in,xx,iel,conec);
pltmsh3_Def(u,in,xx,iel,conec);
   xlabel('Eje x','FontSize',12)
   ylabel('Eje y','FontSize',12)
  % grid on
   set(gca, 'fontsize', 12)  %Tamaño de letra abcisas
    axis on
   box on
   saveas(gcf,'Malla_Deformada.png')
   
