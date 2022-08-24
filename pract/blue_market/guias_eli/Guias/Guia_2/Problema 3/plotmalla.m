%
%  Llamada a la visualizacion de la malla
       
pltmsh3(in,xx,iel,conec);
   
   xlabel('Eje x','FontSize',12)
   ylabel('Eje y','FontSize',12)
   %grid on
   set(gca, 'fontsize', 12)  %Tamaño de letra abcisas
   saveas(gcf,'Malla.png')
   axis on
   box on
   