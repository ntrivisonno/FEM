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
    elseif (eltype==6)
       ndn = 6;	npe = 3;
    end
    %  npe:    Número de nodos por elemento
    %  ndn:    Número de grados de libertad por nodo


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
%    
% %%%%%%%%%%%%%%%% LISTA DE NODOS FIJOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%%%%%%%%%%%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
 
     
     nfix  = textscan(fid,'%d',1,'CommentStyle','$');
     nfix= nfix{1};  %Nodos Fijos
    
     
     A=textscan(fid,['%f',repmat('%f',1,6)],nfix,'CommentStyle','$',...
         'CollectOutPut',true); 
    A=A{1};
    
    
    
%%%%%%%%%%%%%%%%%% MODIFICACION LISTA DE NODOS FIJOS PARA ELAST 2D

%%%% Definicion de Grados de Libertad con CB Dirichlet

  Nod_CBD=A(:,1);
  gdl_D=0;    %Cantidad de Grados de Libertad con CB Dirichlet
     for i=1:nfix
            for j=2:7           
               aux= A(i,j)
        if aux~=0
            gdl_D=1+gdl_D
        else gdl_D=gdl_D
        end
            end
     end
    
     fixa=zeros(gdl_D,1);   %Creo vector vacio fixa
     fixa= [];
     vfix=zeros(1,gdl_D);    %Creo vector vfix de ceros.
     
        %%Creo Vector FIXA
k=1
    for u=1:nfix
        i=Nod_CBD(u,1)
            aux=[];
            for j=2:7           
               aux= A(u,j)
                 if aux~=0
                      n=(i-1)*6+(j-1)
                      fixa(k,1)= n
                      k=k+1
                  end
            end
     end
    
     
     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%         
%  LISTA DE CARGAS NODALES  
    
     nodf  = textscan(fid,'%d',1,'CommentStyle','$');
     nodf= nodf{1};
     A=textscan(fid,['%f',repmat('%f',1,2)],nodf,'CommentStyle','$',...
         'CollectOutPut',true); 
    A=A{1};
    
     f=zeros(numnp*6,1);   %Creo vector vacio de fuerzas
    
     for i=1:nodf
     nod=A(i,1)
     aux=(nod*6)-5
     f(aux,1)=A(i,3)
   
end

  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %%MODIFICACION DE LECTURA ESPESOR E Y NU ELAST 2D

  t=textscan(fid,'%f',1,'CommentStyle','$');   
  t=t{1};   %Espesor de placa

  E=textscan(fid,'%f',1,'CommentStyle','$');   
  E=E{1};   %Modulo de Elasticidad de la placa

  nu=textscan(fid,'%f',1,'CommentStyle','$');   
  nu=nu{1};   %Coeficiente de PoPoisson



