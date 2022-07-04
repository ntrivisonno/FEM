function [in,xx,iel,conec,fixa,vfix,locel,ndn,eltype,f,inn,indof,inel,nu] = input1 (file);
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
    elseif (eltype==6)
       ndn = 3;	npe = 3;
    end
    
    A=textscan(fid,['%f',repmat(' %f',1,npe+1)],numel,'CommentStyle','$',...
        'CollectOutPut',true);
    %A = fscanf(fid,'%f',[npe+2,numel]);
     A = A{1};
    iel  = A(:,1);
    conec = A(:,2:npe+1);
       
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
   
%%%% LISTA DE NODOS FIJOS 

     nfix  = textscan(fid,'%d',1,'CommentStyle','$');
     nfix= nfix{1};
     A=textscan(fid,['%f',repmat('%f',1,2)],nfix,'CommentStyle','$',...
         'CollectOutPut',true); 
    A=A{1};
    fixa  = indof((A(:,1)-1)*ndn + A(:,2));
    vfix  = (A(:,3))';

    
    
%  LISTA DE CARGAS NODALES  
    
   f     = zeros(numnp*ndn,1);
   nload = textscan(fid,'%d',1,'CommentStyle','$');
   nload=nload{1};

%     A=textscan(fid,['%f',repmat('%f',1,2)],nload,'CommentStyle','$',...
%          'CollectOutPut',true);   
   A     = fscanf(fid,'%f',[3,nload]);
   f(indof((A(1,:)'-1)*ndn+A(2,:)')) = A(3,:)';
 
   
     
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%MODIFICACION DE LECTURA ESPESOR E Y NU ELAST 2D

  t=textscan(fid,'%f',1,'CommentStyle','$');   
  t=t{1};   %Espesor de placa

  E=textscan(fid,'%f',1,'CommentStyle','$');   
  E=E{1};   %Modulo de Elasticidad de la placa

  nu=textscan(fid,'%f',1,'CommentStyle','$');   
  nu=nu{1};   %Coeficiente de PoPoisson
    return

