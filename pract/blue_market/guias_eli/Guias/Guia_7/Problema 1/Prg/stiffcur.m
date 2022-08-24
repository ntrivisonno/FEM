function [row,col,sk] = stiffcur (in,xx,iel,conec,locel,inn,indof,inel,kt)
%
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
for ele = 1:nel;
        
    for k=1:3
        X1(k) = xx(inn(conec(ele,k)),1);
        Y1(k) = xx(inn(conec(ele,k)),2);
    end

    dosdelta  = (X1(2)*Y1(3) - X1(3)*Y1(2)) + ...
                (X1(3)*Y1(1) - X1(1)*Y1(3)) + ...
                (X1(1)*Y1(2) - X1(2)*Y1(1)) ;

     for i=1:3
        %Aca le agrego la conductvidad siendo kt(1,1)=kx y kt(1,2)=ky
        beta(i)  =   (sqrt(kt(1))*(Y1( ind(i+1) ) - Y1( ind(i+2) )))/dosdelta;
        gamma(i) =  (sqrt(kt(2))*(-(X1( ind(i+1) ) - X1( ind(i+2) ))))/dosdelta;
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



