function [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel,t,E,nu] = input1 (file);
%  function input1
% 
%  Lectura, generación e impresión de datos nodales
%
%  in:     Números de nodo (Vector)
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

%LECTURA DE NODOS Y COORDENADAS

    numnp    = textscan(fid,'%d',1,'CommentStyle','$');
    numnp = numnp{1};
    A = textscan(fid,['%f',repmat(' %f',1,3)],numnp,'CommentStyle','$',...
        'CollectOutPut',true);
    A = A{1};
    in = A(:,1);     
    xx = A(:,2:4);

%LECTURA DE CONECTIVIDADES Y TIPO DE ELEMENTO

    Var_Conec=textscan(fid,['%f',repmat(' %f',1,1)],1,'CommentStyle','$');
    numel=Var_Conec{1};
    eltype=Var_Conec{2};
    
    if     (eltype==1) 
       ndn = 1; npe = 3;
    elseif (eltype==2)         
       ndn = 2; npe = 3;
    elseif (eltype==3)
       ndn = 2;	npe = 4;
    elseif (eltype==4)
       ndn = 2;	npe = 4;
    end
    
    A=textscan(fid,['%f',repmat(' %f',1,npe+1)],numel,'CommentStyle','$',...
        'CollectOutPut',true);
    %A = fscanf(fid,'%f',[npe+2,numel]);
     A = A{1};
    iel  = A(:,1);
    conec = A(:,2:npe+1);
%     
%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     %MODIFICACION PARA DISTINTOS MATERIALES
%     Vect_Mat = A(:,5:npe+2);  %Vector de Materiales correspondiente a elementos
%     Var_Mat=textscan(fid,['%f',repmat(' %f',1,1)],1,'CommentStyle','$');
%     Cant_Mat= Var_Mat{1};   %Cantidad de materiales del problema
%     Kxyz= Var_Mat{2};      % Cantidad de ejes en juego. Si es 1= Kx; 2=Kx y Ky; 3=Kx,Ky Kz
%     Tabl_Mat=textscan(fid,['%f',repmat('%f',1,Kxyz)],Cant_Mat,'CommentStyle','$',...
%         'CollectOutPut',true);    
%     Tabl_Mat=Tabl_Mat{1};  %Tabla de Materiales completa
% 
%     Kt=Tabl_Mat(:,2:Kxyz+1);  %Matriz con rigidez kx-Ky para cada material(fila)
%     
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         
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
%    
% %%%%%%%%%%%%%%%% LISTA DE NODOS FIJOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
     nfix  = textscan(fid,'%d',1,'CommentStyle','$');
     nfix= nfix{1};
     A=textscan(fid,['%f',repmat('%f',1,3)],nfix,'CommentStyle','$',...
         'CollectOutPut',true); 
    A=A{1};
%%%%%%%%%%%%%%%%%% MODIFICACION LISTA DE NODOS FIJOS PARA ELAST 2D
    fixa=zeros(nfix*ndn,1);   %Creo vector vacio fixa
    fixa= [];
    vfix=zeros(1,nfix*ndn);    %Creo vector vacio vfix
    vfix = []; 
 %%%%Vector VFIX
    i=1;          %Inicializo conteo para la variable auxiliar
    for j=1:nfix             %Corre el conteo de numero de nodos fijos
           aux=[A(i,3:4)];
           vfix = [vfix aux];
           i=i+1;
     end
%%%% Vector FIXA
     Nod_CBD=A(:,1);
     j=1;
     for i=1:nfix
         aux= [(ndn* (Nod_CBD(i,j))-1);ndn*(Nod_CBD(i,j))];
         fixa=[fixa; aux];
     end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
%  LISTA DE CARGAS NODALES  
    
     nodf  = textscan(fid,'%d',1,'CommentStyle','$');
     nodf= nodf{1};
     A=textscan(fid,['%f',repmat('%f',1,3)],nodf,'CommentStyle','$',...
         'CollectOutPut',true); 
    A=A{1};


   f     = zeros(numnp*ndn,1);
   i=0;
   j=1;
   for j=1:nodf
       for i=0:1;
       f(((A(j,1)*2)-i),1)=A(j,(4-i));
       end
   end
   
     
  
   
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%MODIFICACION DE LECTURA ESPESOR E Y NU ELAST 2D

  t=textscan(fid,'%f',1,'CommentStyle','$');   
  t=t{1};   %Espesor de placa

  E=textscan(fid,'%f',1,'CommentStyle','$');   
  E=E{1};   %Modulo de Elasticidad de la placa

  nu=textscan(fid,'%f',1,'CommentStyle','$');   
  nu=nu{1};   %Coeficiente de PoPoisson

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%MODIFICACION LECTURA DE FRONTERA
%     %Lectura de NODOS Frontera
%     
%     Num_NodFront=textscan(fid,'%d',1,'CommentStyle','$');   
%     Num_NodFront=Num_NodFront{1};   %Numero de nodos que tiene la frontera
%     Mat_Nod_Front= textscan(fid,['%f',repmat(' %f',1,3)],Num_NodFront,'CommentStyle','$',...
%         'CollectOutPut',true); %Matriz posicion de nodos frontera
%     Mat_Nod_Front= Mat_Nod_Front{1};
%      
%     %Lectura de ELEMENTOS Fronteras Conectividades
%     
%     Num_EleFront=textscan(fid,'%d',1,'CommentStyle','$'); 
%     Num_EleFront=Num_EleFront{1};                          %Numero de elementos lineales frontera
%     Mat_Conect_Front=textscan(fid,['%f',repmat(' %f',1,3)],Num_EleFront,'CommentStyle','$',...
%         'CollectOutPut',true); %Matriz de conectividades de Elementos frontera
%     Mat_Conect_Front=Mat_Conect_Front{1};
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
% %%%%MODIFICACION DE LECTURA PARA CB NEUMANN 2D ELASTICIDAD
% %%Lectura de Datos para la CB NEUMANN
% 
%   Num_NodFront_CBN=textscan(fid,'%d',1,'CommentStyle','$'); 
%   Num_NodFront_CBN=Num_NodFront_CBN{1};       %Cantidad de Nodos con CB Neumann
%    
%   Mat_Nodos_CBNeu=textscan(fid,['%f',repmat(' %f',1,3)],Num_NodFront_CBN,'CommentStyle','$',...
%         'CollectOutPut',true); %Matriz de elemento frontera/ Nodo /valor de CB Neuman en x/valor de Neuman en y
%   Mat_Nodos_CBNeu= Mat_Nodos_CBNeu{1};
   
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    return

