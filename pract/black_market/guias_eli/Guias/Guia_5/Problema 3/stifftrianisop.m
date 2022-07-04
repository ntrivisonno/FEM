function [row,col,sk,MR_s,qrob,qneu_s] = stifftrianisop (in,xx,iel,conec,locel,inn,indof,inel,Vect_Mat,Kt,Elem_Neumann,Elem_Robin,Mat_Nod_Neu,h_rob,t_ref,Num_Nod_Neu)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%MODIFICACION PARA AGREGAR CONDICIONES DE BORDE ROBIN Y NEUMANN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%CARGAS DEBIDO A LA CB.ROBIN
Num_Elem_Robin=(size(Elem_Robin,1));    %Si no hay CB robin AGREGAR el -1 (Num_Elem_Robin=(size(Elem_Robin,1))-1);
qrob = zeros((length(inn)),1);

%Matriz Robin
MR = zeros(length(inn),length(inn));

for elerob = 1:Num_Elem_Robin

%Longitud del elemento frontera
   
  nod_a=xx(Elem_Robin(elerob,2),:)';
  nod_b=xx(Elem_Robin(elerob,3),:)';
  
  Long_Ele= norm(nod_a-nod_b);  %Logitud del elemento
  Fac_Rob=(h_rob*Long_Ele)/6;   %Factor de multiplicacion Robin

  
%Matriz de Rigidez para Elemetos Robin
   MR(Elem_Robin(elerob,2),Elem_Robin(elerob,2)) = Fac_Rob *2 + MR(Elem_Robin(elerob,2),Elem_Robin(elerob,2));
   MR(Elem_Robin(elerob,3),Elem_Robin(elerob,2)) = Fac_Rob *1 + MR(Elem_Robin(elerob,3),Elem_Robin(elerob,2));
   MR(Elem_Robin(elerob,2),Elem_Robin(elerob,3)) = Fac_Rob *1 + MR(Elem_Robin(elerob,2),Elem_Robin(elerob,3));
   MR(Elem_Robin(elerob,3),Elem_Robin(elerob,3)) = Fac_Rob *2 + MR(Elem_Robin(elerob,3),Elem_Robin(elerob,3));
 
%Matriz que aporta al Vector de Cargas

     for j=2:3;
        qrob(Elem_Robin(elerob,j),1) = qrob(Elem_Robin(elerob,j),1) +(Long_Ele/2)*h_rob*t_ref;
      end
   
end

%Matriz sparce de Rigidez de la CB.Robin
MR_s=sparse(MR);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%CARGAS DEBIDO A LA CB.NEUMANN
Num_Elem_Neumann=(size(Elem_Neumann,1))-1;   %Si no hay CB Neuman AGREGAR el -1. Num_Elem_Neumann=(size(Elem_Neumann,1)-1)
MN = zeros(length(inn),length(inn));

for eleneu = 1:Num_Elem_Neumann
  
    %Longitud del elemento frontera
   
  nod_a=xx(Elem_Neumann(eleneu,2),:)';
  nod_b=xx(Elem_Neumann(eleneu,3),:)';
      
  Long_Ele= norm(nod_a-nod_b);  %Logitud del elemento
  Fac_Neu=Long_Ele/6;   %Factor de multiplicacion Neumann
  
 %Matriz de carga para el elemento con CB.Neumann (Sin el valor de q nodal)
 
 MN(Elem_Neumann(eleneu,2),Elem_Neumann(eleneu,2)) = 2* Fac_Neu +  MN(Elem_Neumann(eleneu,2),Elem_Neumann(eleneu,2));
 MN(Elem_Neumann(eleneu,3),Elem_Neumann(eleneu,2)) = 1* Fac_Neu +  MN(Elem_Neumann(eleneu,3),Elem_Neumann(eleneu,2));
 MN(Elem_Neumann(eleneu,2),Elem_Neumann(eleneu,3)) = 1* Fac_Neu +  MN(Elem_Neumann(eleneu,2),Elem_Neumann(eleneu,3));
 MN(Elem_Neumann(eleneu,3),Elem_Neumann(eleneu,3)) = 2* Fac_Neu +  MN(Elem_Neumann(eleneu,3),Elem_Neumann(eleneu,3));
 
 
end

%Acumulador de cargas nodales Neumann
 qneu_v= zeros(length(inn),1);
 
    for i=1: Num_Nod_Neu
          qneu_v(Mat_Nod_Neu(i,2),1)=  qneu_v(Mat_Nod_Neu(i,2),1)+(Mat_Nod_Neu(i,3));
    end

qneu= MN*qneu_v ;
qneu_s=sparse(qneu);

%qneu_s=qneu_s*2;



% Generacion de la matriz de rigidez
% Elemento triangular cuadrático isoparametrico p/problema conduccion de calor
%
% in: Numeros de nodo
% xx: Tabla de coordenadas
% iel: Numeros de elemento
% conec: Tabla de conectividades
% locel: Tabla de vectores de localizacion
%
nel = length (iel);




% Genera vector inn cuya componente "i" da la posicion donde se
% almacenan las coordenadas del nodo "i" en la tabla "xx"

inn = zeros(max(in),1);
for i=1:length(in)
    j = in(i);
    inn(j) = i;
end

% row, col, sk dan los indices de fila, columna y contenido de la matriz
% de rigidez en almacenamiento sparse
row = zeros(36*nel,1);
col = zeros(36*nel,1);
sk = zeros(36*nel,1);

in1 = 0;
X1 = zeros(6,1);
Y1 = zeros(6,1);

k1=Kt(1,1);
k2=Kt(1,2);
kk = [k1 0; 0 k2];


for iel = 1:nel
    for k=1:6
        X1(k) = xx(inn(conec(iel,k)),1);
        Y1(k) = xx(inn(conec(iel,k)),2);
    end
           
   npgtri = 7;
    K = zeros(6,6);
    [xpg,xw]=integraLocal(npgtri);
    for ipg = 1: npgtri
               
        xG=xpg(ipg,1);
        yG=xpg(ipg,2);
        weight=xw(ipg)/2;
       
    B = [(-3 +4*xG + 4*yG),  (4*yG - 1), (0) , (4 - 4*xG - 8*yG),(4*xG), (-4*xG);
         (-3 +4*yG + 4*xG), (0) , (4*xG - 1) , (-4*yG) , (4*yG) , (4 - 8*xG - 4*yG)];

   
    Jac = ([X1, Y1]')*B'; 
    dJac = det(Jac);
    JacinvT = inv(Jac)';
    GradPhi = JacinvT*B;
    K = K + GradPhi'*kk*GradPhi*dJac*weight;
    %%%%%%%%
    end
      
    for i = 1:6
        for j=1:6
        in1 = in1 + 1;
        row(in1) = inn(locel(iel,i));
        col(in1) = inn(locel(iel,j));
        sk(in1) = K(i,j);
        end
    end
end

