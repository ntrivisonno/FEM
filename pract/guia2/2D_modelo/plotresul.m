%
%  Llamada a la visualizacion de resultados
figure(1)
  pltcntcol(in,xx,iel,eltype,conec,u);print -dpng figuras/fig.png;
figure(2)
pltcnt(in,xx,iel,conec,u);print -dpng figuras/fig.png
