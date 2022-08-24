function pltcntcol (in,xx,iel,eltype,conec,u,curv)
%  function pltcntcol (in,xx,iel,eltype,conec,u,curv)
%     dibuja isovalores de resultados, usando graficos color
%                                  para rango de valores listados en curv
%
%  in:     Numeros de nodos
%  xx:     Tabla de coordenadas nodales
%  iel:    Numeros de elementos
%  eltype: Tipo de elemento (1 triang / 2 quad)
%  conec:  Tabla de conectividades
%  u:      Lista de resultados nodales
%  curv:   Rango de valores a graficar (opcional)

% tic

    if nargin==6,
        rmax = max(u);
        rmin = min(u);
        curv = [rmin:rmax];
    end

    X1(in(:)) = xx(1:length(in),1);
    Y1(in(:)) = xx(1:length(in),2);

    if     (eltype==1)    % triangulo lineal temperatura
       ndn = 1; npe = 3;
  %  elseif (eltype==2)    % cuadrangulo bilineal temperatura isoparametrico
  %     ndn = 1; npe = 4;
    elseif (eltype==3)    % cuadrangulo bilineal elastico isoparametrico
       ndn = 2;	npe = 4;
    elseif (eltype==4)
       ndn = 2;	npe = 4;
        elseif (eltype==2)    % elem triang lineal 2D
       ndn = 2; npe = 3;
    end

    for k=1:ndn
        Z(in(:),k) = u(k:ndn:ndn*length(in));
    end

    if (npe==3)
        tri = conec;
    elseif (npe==4)
        tri = [ conec(:,1:3);
                conec(:,[1 4 3])];
    end
        
    vmax = max(curv);
    vmin = min(curv);

    clf
    for k=1:ndn
        figure(k)
        trisurf(tri,X1,Y1,Z(:,k),'FaceColor','interp','EdgeColor','none');
 %       axis('equal')
        caxis([vmin vmax]);
        colorbar;
    end
    zlabel ('u');
    ylabel ('y');
    xlabel ('x');
    sizeFontA = 16;
    sizeFontB = 20;
    set(gca,'Fontsize',sizeFontA)
    set(get(gca,'xlab'),'Fontsize',sizeFontB)
    set(get(gca,'ylab'),'Fontsize',sizeFontB)
    set(get(gca,'zlab'),'Fontsize',sizeFontB)
% toc


