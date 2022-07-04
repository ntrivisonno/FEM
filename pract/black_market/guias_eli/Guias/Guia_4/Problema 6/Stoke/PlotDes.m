
%Ploteo de Desplazamiento

nNod = sqrt(size(xx,1));
surf(reshape(xx(:,1),nNod,nNod),reshape(xx(:,2),nNod,nNod),reshape(u(1:ndn:end),nNod,nNod))

   
   xlabel('Eje x','FontSize',12)
   ylabel('Eje y','FontSize',12)
   zlabel('Eje z','FontSize',12)


   axis on
   box on
   saveas(gcf,'Desplazamiento.png')