%
%  Llamada a la visualizacion de resultados
figure(1)
pltcntcol(in,xx,iel,eltype,conec,u);
print('graph1-20x-20y-elem.png' , '-dpng');

figure(2)
pltcnt(in,xx,iel,conec,u);
legend('Isotemperature Curves');
print('graph2-20x-20y-elem.png' , '-dpng');