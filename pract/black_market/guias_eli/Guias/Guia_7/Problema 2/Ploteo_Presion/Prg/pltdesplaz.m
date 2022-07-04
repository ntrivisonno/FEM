
% function ptldesplaz(in,xx,iel,conec,u)
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
    %axis('square')
    %setaxr(xx);
    hold on
     
    nel = length (iel);
        
    inn        = zeros(max(in),1);
    inn(in(:)) = 1:length(in);

    for i=1:3
        X1(:,i)  = xx(inn(conec(:,i)),1);
        Y1(:,i)  = xx(inn(conec(:,i)),2);
    end

    %Descompuse los desplazamiento en vertical y horizontal
    ux = u(1,1:2:end)';
    uy = u(1,2:2:end)';
    
    uxfin = ux + xx(:,1)
    uyfin = uy + xx(:,2)
    
    %Aca lo que hago es obtener la posicion final del nodo
    
    for i = 1:nel
        plot ( [uxfin(conec(i,1)) uxfin(conec(i,2)) uxfin(conec(i,3)) uxfin(conec(i:1))], ...
               [uyfin(conec(i,1)) uyfin(conec(i,2)) uyfin(conec(i,3)) uyfin(conec(i:1))], '-b','LineWidth',1.45)
    end
    
    for i=1:nel
        plot( [X1(i,1) X1(i,2) X1(i,3) X1(i,1)],        ...
              [Y1(i,1) Y1(i,2) Y1(i,3) Y1(i,1)], '-k','LineWidth',1.45)
    end
    
    %lWidth = 4;
    axis([-3,39,-0.1,39])
    %axis;
    axis('normal')
    grid on
    
    hold off
    ylabel ('y');
    xlabel ('x');
    sizeFontA = 15;
    sizeFontB = 18;
    set(gca,'Fontsize',sizeFontA)
    set(get(gca,'xlab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
    set(get(gca,'ylab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
    box on
   
