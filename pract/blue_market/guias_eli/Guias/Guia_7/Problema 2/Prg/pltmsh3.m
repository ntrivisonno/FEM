function pltmsh3(in,xx,iel,conec)
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

    for i=1:4
        X1(:,i)  = xx(inn(conec(:,i)),1);
        Y1(:,i)  = xx(inn(conec(:,i)),2);
    end

    fig3 = figure(1)

    for i=1:nel
        plot( [X1(i,1) X1(i,2) X1(i,3) X1(i,4) X1(i,1)],        ...
              [Y1(i,1) Y1(i,2) Y1(i,3) Y1(i,4) Y1(i,1)], '-b','LineWidth',1.2)
    end

    box on
    
    axis([-0.1,1.1,-0.1,1.1])
    axis;
%    axis('normal')
    
    ylabel ('y');
    xlabel ('x');
    sizeFontA = 14;
    sizeFontB = 15;
    set(gca,'Fontsize',sizeFontA)
    set(get(gca,'xlab'),'Fontsize',sizeFontB)
    set(get(gca,'ylab'),'Fontsize',sizeFontB)
    hold off
    
    print(fig3,'malla1','-dpng')

