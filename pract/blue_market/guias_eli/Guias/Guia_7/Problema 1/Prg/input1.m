function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel] = input1 (file)
%function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel,kt,qnode,qneu,enconec,hpel,tfl,ronode,qrob,robconec] = input1 (file)
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
%  kt:     Conductividad termica en las direcciones k(1)=kx y k(2)=ky
%  qnode:  Lista de nodos con condicion de borde Neuman
%  qneu:   Valor de flujo impuesto sobre los nodos con condicion Neumann
%  enconec:Conectividades de los nodos con condiciones Neumann
%  hpel:   Coeficiente pelicular para condicion Robin
%  tfl:    Temperatura del medio para condicion Robin
%  ronode: Lista de nodos que tiene condicion impuesta Robin
%  qrob:   Valor sobre los nodos condicion Robin
%  robconec:Conectividad de los nodos Robin
   
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
     elseif (eltype==5)
       ndn = 1;	npe = 6;
     elseif (eltype==6)
       ndn = 1;	npe = 4;
     elseif (eltype==7)
       ndn = 6;	npe = 3;
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

    nfix  = fscanf(fid,'%f',1);
    A     = fscanf(fid,'%f',[3,nfix]);
    fixa  = indof((A(1,:)'-1)*ndn + A(2,:)');
    vfix  = A(3,:);

    %    fprintf('  Lista de cargas nodales\n \n');
    
    f     = zeros(numnp*ndn,1);
%     nload = fscanf(fid,'%f',1);
%     A     = fscanf(fid,'%f',[3,nload]);
%     f(indof((A(1,:)'-1)*ndn+A(2,:)')) = A(3,:)';

%     %Busque de la conductividad en el archivo de la malla
%         
%     nk =  fscanf (fid,'%d',1);
%     A = fscanf(fid,'%f',[nk,2]);
%     kt = A';
%     
%     %Aca agrego para que busque los nodos con carga de Nuemann y el valor
%     %de la carga
%     
%     nneu = fscanf (fid,'%d',1);
%     A = fscanf (fid,'%f',[2,nneu]);
%     qnode = A(1,:)';
%     qneu = A(2,:)';
%     
%     %Ahora leo las conectividades lineales para carga Neumann
%     
%     neucon = fscanf (fid,'%d',1);
%     A = fscanf (fid,'%f',[3,neucon]);
%     enconec = A([2,3],:)';
%       
%     %Para la condicion de borde tipo Robin se leen las siguiente variables
%     
%     hpel = fscanf (fid,'%d',1);
%     tfl = fscanf (fid,'%d',1);
%     
%     %Leo la carga Robin que aporta al RHS
%     rob = fscanf (fid,'%d',1);
%     A = fscanf (fid,'%f',[2,rob]);
%     ronode = A(1,:)';
%     qrob = A(2,:)';
%     
%     %Y ahora leo las conectividades de los nodos Robin
%     
%     robel = fscanf (fid,'%d',1);
%     A = fscanf (fid,'%f',[3,robel]);
%     robconec = A([2,3],:)';
%       
      
    return

