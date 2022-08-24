function ibouc=pltbou(in,xx,iel,conec,ibou)
%  function ibouc=pltbou(xx,conec,ibou)
%     determina y dibuja el contorno de una malla 2d
%
%  in     Numeros de nodos
%  xx     Tabla de coordenadas nodales
%  iel   Numeros de elementos
%  conec  Tabla de conectividades
%  ibou   Lista de nodos del contorno (opcional)
%

   nel  = length(iel);
   nnod = length(in);
   n    = 3;

   inn        = zeros(max(in),1);
   inn(in(:)) = 1:length(in);
   nmx        = length(inn)+1;

   if nargin==4
      ibouc=[];
      nj  = [ conec(:,1)'  conec(:,2)'  conec(:,3)';
              conec(:,2)'  conec(:,3)'  conec(:,1)' ];

      nj1 = nmx*min(nj) + max(nj);
      nj1 = sort(nj1);

      i=1;
      while i<=3*nel-1
         if nj1(i)~=nj1(i+1)  
            ibouc = [ibouc; fix(nj1(i)/nmx) rem(nj1(i) , nmx) ];
            i = i+1;
         else
            i = i+2;
         end
      end
      if nj1(3*nel-1)~=nj1(3*nel) 
         ibouc = [ibouc; fix(nj1(3*nel)/nmx) rem(nj1(3*nel) , nmx) ];
      end

      nodj = ibouc(:,1);
      nodk = ibouc(:,2);
      xj   = [xx(inn(nodj(:)),1) xx(inn(nodk(:)),1)];
      yj   = [xx(inn(nodj(:)),2) xx(inn(nodk(:)),2)];

      for i=1:size(ibouc)
         plot( xj(i,:), yj(i,:))
      end

   else

      [nbou,ibid]=size(ibou);
      for ib=1:nbou
         n1=ibou(ib,1);
         n2=ibou(ib,2);
         x1=xx(inn(n1),1);
         y1=xx(inn(n1),2);
         x2=xx(inn(n2),1);
         y2=xx(inn(n2),2);
         plot([x1 x2],[y1 y2], 'LineWidth',5)
      end

   end