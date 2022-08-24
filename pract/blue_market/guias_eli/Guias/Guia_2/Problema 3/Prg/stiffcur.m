function [row,col,sk,MR_s,qrob,qneu_s] = stiffcur (in,xx,iel,conec,locel,inn,indof,inel,Vect_Mat,Kt,Elem_Neumann,Elem_Robin,Mat_Nod_Neu,h_rob,t_ref,Num_Nod_Neu);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%MODIFICACION PARA AGREGAR CONDICIONES DE BORDE ROBIN Y NEUMANN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%CARGAS DEBIDO A LA CB.ROBIN
Num_Elem_Robin=(size(Elem_Robin,1))-1;
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
Num_Elem_Neumann=(size(Elem_Neumann,1))-1;
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Generacion de la matriz de rigidez
%  Elemento triangulo lineal p/problema conduccion de calor
%
%  in:    Numeros de nodo
%  xx:    Tabla de coordenadas
%  iel:   Numeros de elemento
%  conec: Tabla de conectividades
%  locel: Tabla de vectores de localizacion 
%
nel = length (iel);

%   El vector ind es un vector auxiliar para realizar el desplazamiento 
%   ciclico de indice en el lazo
ind  = [ 1, 2, 3, 1, 2];

%   row, col, sk dan los indices de fila, columna y contenido de la matriz
%   de rigidez en almacenamiento sparse
row  = zeros(9*nel,1);
col  = zeros(9*nel,1);
sk = zeros(9*nel,1);

in1 = 0;
for ele = 1:nel

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 %MODIFICACION LECTURA MATERIAL Y CONSTANTE K
    Material_e=Vect_Mat(ele);    %Busca el material correspondiente al elemento
    Kt_e= Kt(Material_e,:)';     %Busca las Kx Ky y Kz del elemento
     
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    for k=1:3
        X1(k) = xx(inn(conec(ele,k)),1);
        Y1(k) = xx(inn(conec(ele,k)),2);
    end

    dosdelta  = (X1(2)*Y1(3) - X1(3)*Y1(2)) + ...
                (X1(3)*Y1(1) - X1(1)*Y1(3)) + ...
                (X1(1)*Y1(2) - X1(2)*Y1(1)) ;

    for i=1:3
        beta(i)  = sqrt( Kt_e(1))* (Y1( ind(i+1) ) - Y1( ind(i+2) ))/dosdelta;
        gamma(i) =  sqrt( Kt_e(2))* (-(X1( ind(i+1) ) - X1( ind(i+2) )))/dosdelta;
    end

    for i = 1:3
        for j=1:3
            in1 = in1 + 1;
            row(in1) = indof(locel(ele,i));
            col(in1) = indof(locel(ele,j));
            sk(in1)  = (beta(i) * beta(j) + gamma(i)* gamma(j) )*dosdelta/2;
        end
    end
end

