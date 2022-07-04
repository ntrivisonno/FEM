function [row,col,sk] = stiffcurCuad (in,xx,iel,conec,locel,inn,indof,inel)
%
%  Generacion de la matriz de rigidez
%  Elemento triangulo lineal p/problema conduccion de calor
%
%  in:    Numeros de nodo
%  xx:    Tabla de coordenadas
%  iel:   Numeros de elemento
%  conec: Tabla de conectividades
%  locel: Tabla de vectores de localizacion 
%  inn:  Vector de nodos ordenados de manera cronologica 1,2,3..
%  indof: Vector dado el # de GDL del nodo, da la posicion donde lo quiere meter (indice) dentro de la matriz global
%  inel: Vector de elementos ordenados

nel = length (iel);

%   El vector ind es un vector auxiliar para realizar el desplazamiento 
%   ciclico de indice en el lazo
ind  = [ 1, 2, 3, 1, 2];

%   row, col, sk dan los indices de fila, columna y contenido de la matriz
%   de rigidez en almacenamiento sparse
row  = zeros(9*nel,1);
col  = zeros(9*nel,1);
sk = zeros(9*nel,1);


Fun_Forma;

f_Ke=matlabFunction(Ke,'Vars',{[alpha1 alpha2 alpha3],[beta1 beta2 beta3],[gamma1 gamma2 gamma3],x,y});

in1 = 0;
for ele = 1:nel

    for k=1:3
        X1(k) = xx(inn(conec(ele,k)),1);
        Y1(k) = xx(inn(conec(ele,k)),2);
    end

    dosdelta  = (X1(2)*Y1(3) - X1(3)*Y1(2)) + ...
                (X1(3)*Y1(1) - X1(1)*Y1(3)) + ...
                (X1(1)*Y1(2) - X1(2)*Y1(1)) ;

    for i=1:3
        alpha(i) = ((X1( ind(i+1) )*Y1( ind(i+2) ))-(X1( ind(i+2) )*Y1( ind(i+1) )))/dosdelta;
        beta(i)  =   (Y1( ind(i+1) ) - Y1( ind(i+2) ))/dosdelta;
        gamma(i) =  -(X1( ind(i+1) ) - X1( ind(i+2) ))/dosdelta;
    end
      
        
    npgtri=3;
    K=zeros(6,6);
    
    for  ipg=1:npgtri
        [xG, yG, weight] = integtri (ipg, X1(1), Y1(1), X1(2), Y1(2), X1(3), Y1(3), npgtri);
 
       K = K + (f_Ke(alpha, beta, gamma, xG, yG))*weight;
    end
    
    
    for i = 1:6
        for j=1:6
            in1 = in1 + 1;
            row(in1) = indof(locel(ele,i));
            col(in1) = indof(locel(ele,j));
            sk(in1) =K(i,j);
         end
    end
end

