%
%  Llamada a la visualizacion de la malla con rotulos de nodo
   if (eltype==1|eltype==4)
       pltmsh3rotu(in,xx,iel,conec);
   elseif (eltype==2|eltype==3|eltype==5)
       pltmsh4rotu(in,xx,iel,conec);
   elseif (eltype==7)
       pltmsh6rotu(in,xx,iel,conec);
   end