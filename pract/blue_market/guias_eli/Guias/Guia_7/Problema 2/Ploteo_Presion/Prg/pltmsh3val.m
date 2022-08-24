function pltmsh3val(in,xx,iel,conec,u)
% function pltmsh3(in,xx,iel,conec)
%
%   Dibuja una malla de elementos finitos triangulares
%
%   in:    Numeros de nodos
%   xx:    Tabla de coordenadas nodales
%   iel:   Numeros de elementos
%   conec: Tabla de conectividades
%
    clf
    axis('square')
    setaxr(xx);
    hold on

    nel = length (iel);
    
    inn        = zeros(max(in),1);
    inn(in(:)) = 1:length(in);

    for i=1:3
        X1(:,i)  = xx(inn(conec(:,i)),1);
        Y1(:,i)  = xx(inn(conec(:,i)),2);
    end

    for i=1:nel
        plot3( [X1(i,1) X1(i,2) X1(i,3)*u(i)) X1(i,1)],        ...
              [Y1(i,1) Y1(i,2)  Y1(i,3)*u(i)) Y1(i,1)],[u(i) u(i) u(i) u(i)], '-b')
    end

    axis;
    %axis('normal')
    
    hold off
    ylabel ('y');
    xlabel ('x');
    sizeFontA = 15;
    sizeFontB = 18;
    set(gca,'Fontsize',sizeFontA)
    set(get(gca,'xlab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
    set(get(gca,'ylab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
    box on
   
