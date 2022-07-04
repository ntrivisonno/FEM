function [in,xx,iel,conec,fixa,vfix,locel,ndn,eltype,f,inn,indof,inel,Vect_Mat,Kt,Elem_Neumann,Elem_Robin,Mat_Nod_Neu,h_rob,t_ref,Num_Nod_Neu] = input1 (file);
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
     elseif     (eltype==5) 
       ndn = 1;	npe = 6;
    end
    
    %  npe:    Número de nodos por elemento
%  ndn:    Número de grados de libertad por nodo
    
    A=textscan(fid,['%f',repmat(' %f',1,npe+1)],numel,'CommentStyle','$',...
        'CollectOutPut',true);
    %A = fscanf(fid,'%f',[npe+2,numel]);
     A = A{1};
    iel  = A(:,1);
    conec = A(:,2:npe+1);
    
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %MODIFICACION PARA DISTINTOS MATERIALES
    Vect_Mat = A(:,5:npe+2);  %Vector de Materiales correspondiente a elementos
    Var_Mat=textscan(fid,['%f',repmat(' %f',1,1)],1,'CommentStyle','$');
    Cant_Mat= Var_Mat{1};   %Cantidad de materiales del problema
    Kxyz= Var_Mat{2};      % Cantidad de ejes en juego. Si es 1= Kx; 2=Kx y Ky; 3=Kx,Ky Kz
    Tabl_Mat=textscan(fid,['%f',repmat('%f',1,Kxyz)],Cant_Mat,'CommentStyle','$',...
        'CollectOutPut',true);    
    Tabl_Mat=Tabl_Mat{1};  %Tabla de Materiales completa

    Kt=Tabl_Mat(:,2:Kxyz+1);  %Matriz con rigidez kx-Ky para cada material(fila)
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
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
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%MODIFICACION LECTURA DE FRONTERA
    %Lectura de NODOS Frontera
    
    Num_NodFront=textscan(fid,'%d',1,'CommentStyle','$');   
    Num_NodFront=Num_NodFront{1};   %Numero de nodos que tiene la frontera
    Mat_Nod_Front= textscan(fid,['%f',repmat(' %f',1,3)],Num_NodFront,'CommentStyle','$',...
        'CollectOutPut',true); %Matriz posicion de nodos frontera
    Mat_Nod_Front= Mat_Nod_Front{1};
     
    %Lectura de ELEMENTOS Fronteras Conectividades
    
    Num_EleFront=textscan(fid,'%d',1,'CommentStyle','$'); 
    Num_EleFront=Num_EleFront{1};                          %Numero de elementos lineales frontera
    Mat_Conect_Front=textscan(fid,['%f',repmat(' %f',1,3)],Num_NodFront,'CommentStyle','$',...
        'CollectOutPut',true); %Matriz de conectividades de Elementos frontera
    Mat_Conect_Front=Mat_Conect_Front{1};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% MODIFICACION PARA AGREGAR CONDICIONES DE BORDE NEUMANN Y ROBIN
%%% En este caso,leemos las CB que tiene cada elemento lineal.
%%% 0=CB.Dirichlet 1=CB.Robin  2=CB.Neumann

%%DEFINO LOS ELEMNTOS LIENALES DONDE SE APLICA CONDICION DE NEUMAN Y ROBIN
j=1;  %Conteo para elementos Neuman
k=1;  %Conteo para elementos Robin
for i=1:Num_EleFront;
     Vect_CB(i,1)=Mat_Conect_Front(i,4);
     
    if Vect_CB(i,1)==1;       %%ELEMENTOS FRONTERA CON CB.Robin
            Elem_Robin(j,1:3)=Mat_Conect_Front(i,1:3);
             j=j+1;
       else Elem_Robin(j,1:3)=(0);
    end
      if Vect_CB(i,1)==2;       %%ELEMENTOS FRONTERA CON CB.Neumann
            Elem_Neumann(k,1:3)=Mat_Conect_Front(i,1:3);
             k=k+1;
          else Elem_Neumann(k,1:3)=(0);
     end
end
 %%% CB.ROBIN LEO LOS VALORES DE Q PARA CADA NODO
   
   h_rob=textscan(fid,'%f',1,'CommentStyle','$'); 
   h_rob=h_rob{1};  % h de la CB. Robin
   
   t_ref=textscan(fid,'%f',1,'CommentStyle','$'); 
   t_ref=t_ref{1};  % Temp. de Referncia de la CB. Robin
 
   Num_Nod_Neu=textscan(fid,'%d',1,'CommentStyle','$'); 
   Num_Nod_Neu=Num_Nod_Neu{1};  %Numeros de nodos con CB.Neumann
   
   Mat_Nod_Neu= textscan(fid,['%f',repmat(' %f',1,2)],Num_Nod_Neu,'CommentStyle','$',...
        'CollectOutPut',true); 
   Mat_Nod_Neu= Mat_Nod_Neu{1};  %Matriz de Valores de q para Nodos Neumann

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    return

