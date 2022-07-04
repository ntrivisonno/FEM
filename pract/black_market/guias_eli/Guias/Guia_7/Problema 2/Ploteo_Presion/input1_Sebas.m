function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,t,inn,indof,inel] = input1_Sebas (file)
%  function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype] = input1 (file)
% function [in,xx,iel,conec,fixa,vfix,f,locel,link,ndn,eltype,t,inn,indof,inel] = input1_Sebas (file)
% "La funcion de arriba input1_Sebas tiene el "link" incluido para manejar
% los multiplicadores de Lagrange en los problema de la Guia #7.

%  Lectura, generación e impresión de datos nodales
%
%  in:     Números de nodo
%  xx:     Tabla de coordenadas
%  iel:   Números de elemento
%  conec:  Tabla de conectividades
%  fixa:   Lista de nodos fijos
%  vfix:   Valores de fijaciones
%  f:      Vector de cargas
%  locel:  Tabla de vectores de localización
%  link:   Tabla de grados de libertad vinculados
%  eltype: Tipo de elemento
%  npe:    Número de nodos por elemento
%  ndn:    Número de grados de libertad por nodo
%  nint:   Número de grados de libertad internos
%  t:      Espesor (para problemas de tension plana)
   
    fid = fopen(file,'rt');

%    fprintf('  Datos del análisis \n ================== \n \n')
%    fprintf('  Lista de nodos y coordenadas\n \n')

    numnp    = fscanf(fid,'%d',1); 
    A = fscanf(fid,'%f',[4,numnp]);
    in = A(1,:)';
    xx = A(2:4,:)';

%    fprintf('  Lista de elementos y conectividades\n \n');

    numel  = fscanf(fid,'%f',1);
    eltype = fscanf(fid,'%f',1);
    if     (eltype==1)    % triangulo lineal temperatura
       ndn = 1; npe = 3; nint = 0;  
       t = 0;
    elseif (eltype==2)    % cuadrangulo bilineal temperatura isoparametrico
       ndn = 1; npe = 4; nint = 0;  
       t = 0;
    elseif (eltype==3)    % cuadrangulo bilineal elastico isoparametrico
       ndn = 2;	npe = 4; nint = 0;  
       t   = fscanf(fid,'%f',1);
    elseif (eltype==4)    % triangulo lineal elastico 
       ndn = 2;	npe = 3; nint = 0;  
       t   = fscanf(fid,'%f',1);
    elseif (eltype==5)    % cuadrangulo bilineal mixto isoparametrico Stokes 
       ndn = 2;	npe = 4; nint = 1;   
       t   = 0;
    elseif (eltype==6)    % triangulo Stokes funcion linea corriente  
       ndn = 6;	npe = 3; nint = 0;   
       t   = 0;
    elseif (eltype==7)    % triangulo de Morley para problema de Stokes y Placa Elastica
       ndn = 1;	npe = 6; nint = 0;   
       t   = 0;
    elseif (eltype==8)    % cuadrangulo bicuadratico mixto isoparametrico Stokes 
       ndn = 2;	npe = 9; nint = 1;   
       t   = 0;
    end
       
    A = fscanf(fid,'%f',[npe+1,numel]);
    iel  = A(1,:)';
    conec = A(2:npe+1,:)';
    
    for i=1:ndn
      locel(:,i:ndn:npe*ndn) = (conec-1)*ndn + i;
    end
    for i=1:nint
        locel(:,npe*ndn+i) = max(in)*ndn + (iel-1)*nint + i;
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
    fixa  = (A(1,:)'-1)*ndn + A(2,:)';
    vfix  =  A(3,:);
    fixa = [fixa;max(in)*ndn+1];     %Presion cero en punto inf. izq
   vfix = [vfix,0];

%     fixa = [fixa;max(in)*ndn+80];     %Presion cero en punto intermedio
%     vfix = [vfix,0];                  %Valor de la Presion en punto

%    fprintf('  Lista de grados de libertad vinculados\n \n');
%     nlink  = fscanf(fid,'%f',1);
%     A     = fscanf(fid,'%f',[4,nlink]);
%     link  = [(A(1,:)'-1)*ndn + A(2,:)'  (A(3,:)'-1)*ndn + A(4,:)'];

%    fprintf('  Lista de cargas nodales\n \n');
%     f = zeros(numnp*ndn + nint*numel + nlink,1);
    f = zeros(numnp*ndn + nint*numel,1);
    nload = fscanf(fid,'%f',1);
    A = fscanf(fid,'%f',[3,nload]);
    f((A(1,:)'-1)*ndn+A(2,:)') = A(3,:)';


    
return

