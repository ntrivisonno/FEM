function [in,xx,iel,conec,fixa,vfix,locel,ndn,eltype,inn,indof,inel,fnod,E,nu,t,npe] = input_elas_2D (file)
%function [in,xx,iel,conec,fixa,vfix,locel,ndn,eltype,inn,indof,inel,fn,E,nu,t] = input_elas_2D (file)
% 
% 
%  Lectura, generacion e impresion de datos nodales
%
%  in:     Numeros de nodo
%  xx:     Tabla de coordenadas
%  iel:    Numeros de elemento
%  conec:  Tabla de conectividades
%  fixa:   Lista de nodos fijos
%  vfix:   Valores de fijaciones
%  fn:     Fuerza aplicada al nodo
%  locel:  Tabla de vectores de localizacion
%  eltype: Tipo de elemento
%  npe:    Numero de nodos por elemento
%  ndn:    Numero de grados de libertad por nodo
%  fd:     Fuerza distribuida en la frontera
%  disconec:Conectividades de los nodos con condiciones Neumann
%  E :     Modulo de elasticidad de Young
%  t:      Espesor del material
%  nu:     Coeficiente de Poisson
 
    fid = fopen(file,'rt');

%    fprintf('  Datos del analisis \n ================== \n \n')
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
    %Este elementos es para un elemento triangular para problemas de elasticidad 
    elseif (eltype==5)
       ndn = 2; npe = 3;
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
    fixa  = zeros (nfix*ndn,1);
    A     = fscanf(fid,'%f',[3,nfix]);
    vfix  = [A(2,:)';A(3,:)'];
    for k= 1:ndn
        fixa ((1+((nfix)*(k-1))):((nfix)*k),1) = indof((A(1,:)'-1)*ndn+(ndn-1)*k);
    end 

    %    fprintf('  Lista de cargas nodales\n \n');
    
    fnod     = zeros(numnp*ndn,1);
    nload = fscanf(fid,'%f',1);
    A     = fscanf(fid,'%f',[3,nload]);
     for k= 1:ndn
         for i= 1 : nload
             fnod((indof(A(1,i)*ndn+(k-2))),1) = A((1+k),i);
         end
     end
    
    %Busca el valor del modulo de elasticidad
    
    E = fscanf (fid,'%d',1);
    
    %Busca el valor del coeficiente de Poisson
    
    nu = fscanf (fid,'%f',1);

    %Espesor del elemento a estudiar. 
    % --->Si t=0 es deformacion plana
    % --->Si t>0 tension plana
    
    t = fscanf (fid,'%f',1);
    
    
    return

