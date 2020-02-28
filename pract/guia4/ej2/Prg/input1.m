function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel] = input1 (file)
%  function input1
% 
%  Lectura, generaci�n e impresi�n de datos nodales
%
%  in:     N�meros de nodo
%  xx:     Tabla de coordenadas
%  iel:    N�meros de elemento
%  conec:  Tabla de conectividades
%  fixa:   Lista de nodos fijos
%  vfix:   Valores de fijaciones
%  f:      Vector de cargas
%  locel:  Tabla de vectores de localizaci�n
%  eltype: Tipo de elemento
%  npe:    N�mero de nodos por elemento
%  ndn:    N�mero de grados de libertad por nodo
   
    fid = fopen(file,'rt');

%    fprintf('  Datos del an�lisis \n ================== \n \n')
%    fprintf('  Lista de nodos y coordenadas\n \n')

    numnp    = fscanf(fid,'%d',1);  
    A = fscanf(fid,'%f',[4,numnp]);
    in = A(1,:)';
    xx = A(2:4,:)';


%    fprintf('  Lista de elementos y conectividades\n \n');

    numel  = fscanf(fid,'%f',1);
    eltype = fscanf(fid,'%f',1);
    if     (eltype==1) 
       ndn = 1; npe = 3;
    elseif (eltype==2)         
       ndn = 2; npe = 3;
    elseif (eltype==3)
       ndn = 2;	npe = 4;
    elseif (eltype==4)
       ndn = 2;	npe = 4;
    end
       
    A = fscanf(fid,'%f',[npe+1,numel]);
    iel  = A(1,:)';
    conec = A(2:npe+1,:)';
    
    for i=1:ndn
      locel(:,i:ndn:npe*ndn) = (conec-1)*ndn + i;
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

    indof = zeros(max(in)*ndn,1);
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

   
%    fprintf('  Lista de nodos fijos\n \n');

% ----------
% seguir para ver como leemos las condiciones del ejemplo testcae
% ----------

    nfix  = fscanf(fid,'%f',1); % nfix: lista de nodos fijos, cond Dirch
    A     = fscanf(fid,'%f',[4,nfix]); % lee tres colum no mas, como haces para decirle q es en dir x
    % o en y ???
   fixa = [(indof((A(1,:)'-1)*ndn + A(2,:)'))-1;indof((A(1,:)'-1)*ndn + A(2,:)')];  % GDL problem elast 2D
     vfix = [A(4,:) A(3,:)];  % valores de GDL fijos problem elast 2D
    %    fprintf('  Lista de cargas nodales\n \n');
    
    
    %imponemos las fuerzas como desplazamientos, y nos omitimos este paso
    f     = zeros(numnp*ndn,1);
    nload = fscanf(fid,'%f',1);
    A     = fscanf(fid,'%f',[3,nload]);
    f(indof((A(1,:)'-1)*ndn+A(2,:)')) = A(3,:)';

%     %    fprintf('  Lectura de espesor \n \n');
%     t = fscanf(fid,'%f',1);
%    
%     %    fprintf('  Lectura de Modulo de Young \n \n');
%     E = fscanf(fid,'%f',1);
%    
%     %    fprintf('  Lectura de coef poisson \n \n');
%     nu = fscanf(fid,'%f',1);
%    

    return

