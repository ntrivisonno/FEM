function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel] = input1 (file)
%  function input1
% 
%  Lectura, generación e impresión de datos nodales
%
%  in:     Números de nodo (Vector de nodos)
%  xx:     Tabla de coordenadas
%  iel:    Números de elemento
%  conec:  Tabla de conectividades
%  fixa:   Lista de nodos fijos
%  vfix:   Valores de fijaciones
%  f:      Vector de cargas
%  locel:  Tabla de vectores de localización
%  eltype: Tipo de elemento
%  npe:    Número de nodos por elemento
%  ndn:    Número de grados de libertad por nodo
   
    fid = fopen(file,'rt');

%    fprintf('  Datos del análisis \n ================== \n \n')
%    fprintf('  Lista de nodos y coordenadas\n \n')

    numnp    = fscanf(fid,'%d',1); % sigue las filas pero las guarda en columnas 
    A = fscanf(fid,'%f',[4,numnp]); % triquinuela que hace xq matlab ingresa x fila pero lee por col
    in = A(1,:)'; % te toma todo los numeros de nodos
    xx = A(2:4,:)'; % son las coordenadas  de los nodos


%    fprintf('  Lista de elementos y conectividades\n \n');

    numel  = fscanf(fid,'%f',1); % numel: numero de elemento 
    eltype = fscanf(fid,'%f',1); % eltype: Tipo de elemento
    if     (eltype==1) 
       ndn = 1; npe = 3; % ndn = cant GDL/nodo npe=# de nodos/elem
    elseif (eltype==2)         
       ndn = 2; npe = 3;
    elseif (eltype==3)
       ndn = 2;	npe = 4;
    elseif (eltype==4)
       ndn = 2;	npe = 4;
    end
       
    A = fscanf(fid,'%f',[npe+1,numel]); 
    iel  = A(1,:)'; % numeracion de elem
    conec = A(2:npe+1,:)'; % conectividades = nodos x los cuales esta compuesto c/elem||npe+1 xq el 1er renglo dice cant de nodos y tipo, y eso te estar'ia robando un renglon
    
    for i=1:ndn
      locel(:,i:ndn:npe*ndn) = (conec-1)*ndn + i; % GDL/elem
    end

    %   Genera vector inn cuya componente "i" da la posicion donde se 
    %   almacenan las coordenadas del nodo "i" en la tabla "xx"

    inn  = zeros(max(in),1);
    for i=1:length(in)
        j      = in(i);
        inn(j) = i;
    end

    %   Genera vector indof cuya componente "i" da la posicion donde se
    %   almacena el grado de libertad "i" en el ordenamiento global
    %   del problema

    indof = zeros(max(in)*ndn,1); % es el vector q para la numeracion de GDL elegida me dice donde est'a en la matriz||dada la numeracion de  GDL me da ese grado de lib||% dado el # de GDL me da la posicion en un vector dof. indof -> dado el # de GDL del nodo, da la posicion donde lo quiere meter (indice) dentro de la matriz global

    for k=1:ndn
        for i=1:length(in)
            j        = (in(i)-1)*ndn + k;
            indof(j) = (i-1)*ndn + k;
        end
    end

    %   Genera vector inel cuya componente "i" da la posicion donde se 
    %   almacenan las conectividades del elemento "i" en la tabla "conec"

    inel  = zeros(max(iel),1);
    for i=1:length(iel)
        j       = iel(i);
        inel(j) = i;
    end
   
    %    fprintf('  Lista de nodos fijos\n \n');  % si es una carga puntual se puede poner como un nodo fijo como su valor
    
    nfix  = fscanf(fid,'%f',1);
    A     = fscanf(fid,'%f',[3,nfix]);
    fixa  = indof((A(1,:)'-1)*ndn + A(2,:)');
    vfix  = A(3,:);

    %    fprintf('  Lista de cargas nodales\n \n');  % si no tiene nada, poner 0
    
    f     = zeros(numnp*ndn,1);
    nload = fscanf(fid,'%f',1);
    A     = fscanf(fid,'%f',[3,nload]);
    f(indof((A(1,:)'-1)*ndn+A(2,:)')) = A(3,:)';

    % los valores de carga puntual

    return

