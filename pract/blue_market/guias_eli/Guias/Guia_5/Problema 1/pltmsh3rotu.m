function pltmsh3rotu(in,xx,iel,conec,u,locel,fac)
% function pltmsh3rotu(in,xx,iel,conec,u,locel,fac)
%
%   Dibuja una malla de elementos finitos triangulares
%
%   in:    Numeros de nodos
%   xx:    Tabla de coordenadas nodales
%   iel:   Numeros de elementos
%   conec: Tabla de conectividades
%   u:     Vector de desplazamientos (opcional)
%   locel: Tabla de vectores de localizacion (opcional)
%   fac:   Factor de escala de deformacion (opcional)
%
    clf
    axis('square')
    setaxr(xx);
    hold on

    nel = length (iel);
    
    inn        = zeros(max(in),1);
    inn(in(:)) = 1:length(in);

    if (nargin==4)
        for i=1:3
            X1(:,i)  = xx(inn(conec(:,i)),1);
            Y1(:,i)  = xx(inn(conec(:,i)),2);
        end
    else
        maxu = max([max(u); -min(u)]);
        maxx = max([max(max(xx)); max(-min(xx))]);
        if (nargin==7)
            fac  = fac*maxx/maxu;
        else
            fac  = 0.1*maxx/maxu;
        end
        for i=1:3
            X1(:,i)  = xx(inn(conec(:,i)),1) + u(locel(:,2*i-1))'*fac;
            Y1(:,i)  = xx(inn(conec(:,i)),2) + u(locel(:,2*i))'*fac;
        end
    end
    
    for i=1:nel
        plot( [X1(i,1) X1(i,2) X1(i,3) X1(i,1)],        ...
              [Y1(i,1) Y1(i,2) Y1(i,3) Y1(i,1)], '-b')
    end
    %MAP 2010
    if(length(in)<150)
        for j=1:nel
            numel=num2str(j);        
            text([(X1(j,1)+X1(j,2)+X1(j,3))/3],[(Y1(j,1)+Y1(j,2)+Y1(j,3))/3],numel);
            for i=1:3
                numnod=num2str(inn(conec(j,i)));
                text([X1(j,i)],[Y1(j,i)],numnod,'color','r');
            end 
        end 
    end
    
    axis;
%    axis('normal')
    hold off
