function pltcnt (in,xx,iel,conec,u,curv)
%  function pltcnt (in,xx,iel,conec,u,curv)
%     dibuja isocurvas de resultados para isocurvas listadas en curv
%
%  in:    Numeros de nodos
%  xx:    Tabla de coordenadas nodales
%  iel:   Numeros de elementos
%  conec: Tabla de conectividades
%  u:     Lista de resultados nodales
%  curv:  Valores de isocurvas a graficar (opcional)
%         por defecto: 15 isocurvas

% tic

    clf
    setaxr(xx);
    axis('square')
    hold on
    pltbou (in,xx,iel,conec);

    if nargin==5,
        rmax = max(u);
        rmin = min(u);
        step = (rmax-rmin)/15;
        curv = [rmin:step:rmax];
    end

    inn        = zeros(max(in),1);
    inn(in(:)) = 1:length(in);

    X1(:,1)  = xx(inn(conec(:,1)),1);
    Y1(:,1)  = xx(inn(conec(:,1)),2);
    X1(:,2)  = xx(inn(conec(:,2)),1);
    Y1(:,2)  = xx(inn(conec(:,2)),2);
    X1(:,3)  = xx(inn(conec(:,3)),1);
    Y1(:,3)  = xx(inn(conec(:,3)),2);
    RLOC(:,1) = u(inn(conec(:,1)))';
    RLOC(:,2) = u(inn(conec(:,2)))';
    RLOC(:,3) = u(inn(conec(:,3)))';

    nele=length(iel);
%   if n~=3 & n~=4
%      disp('Los elementos deben tener 3 o 4 nodos')
%      return
%   end

    vmax = max(curv);
    vmin = min(curv);
    for i=1:nele
        rmax=max(RLOC(i,:));
        rmin=min(RLOC(i,:));
        if vmax>rmin & vmin<rmax, 
            pltcnt1 (X1(i,:),Y1(i,:),RLOC(i,:),curv)
        end
    end

    hold off
    
    ylabel ('y');
    xlabel ('x');
    sizeFontA = 16;
    sizeFontB = 20;
    set(gca,'Fontsize',sizeFontA)
    set(get(gca,'xlab'),'Fontsize',sizeFontB)
    set(get(gca,'ylab'),'Fontsize',sizeFontB)
% toc


