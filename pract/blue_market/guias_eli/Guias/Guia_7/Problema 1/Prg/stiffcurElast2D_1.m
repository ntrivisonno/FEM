function [row,col,sk] = stiffcurElast2D_1 (xx,iel,conec,locel,inn,indof,t,E,nu)

%  Generacion de la matriz de rigidez
%  Elemento triangulo lineal p/problema
%  de Elasticidad plana
%
%  in:    Numeros de nodo
%  xx:    Tabla de coordenadas
%  iel:   Numeros de elemento
%  conec: Tabla de conectividades
%  locel: Tabla de vectores de localizacion 
%  t: espesor (si t=0: deformacion plana, t>0: tension plana)

nel = length (iel);

%%%Este lazo 
for i=1:3
    X1(:,i) = [ xx(inn(conec(:,i)),1) ] ;
    Y1(:,i) = [ xx(inn(conec(:,i)),2) ] ;
end

%   El vector ind es un vector auxiliar para realizar el desplazamiento 
%   ciclico de indice en el lazo
ind  = [ 1, 2, 3, 1, 2];

%   row, col, sk dan los indices de fila, columna y contenido de la matriz
%   de rigidez en almacenamiento sparse
%   Es 36 * el numero de elemento xq la matriz de rigidez elemental es de
%   6x6-->tengo 36 elemento dentro de la matriz
row  = zeros(36*nel,1);
col  = zeros(36*nel,1);
sk = zeros(36*nel,1);

in1 = 0;
%Realiza un for para cada elemento y determina la reigidez elemental de
%cada uno
for ele = 1:nel
    
    %Esto es el area del triangulo expresado como el producto vectoria. Si
    %no lo divido por dos da dos veces el area o dosdelta que es lo estoy
    %buscando
    dosdelta  = (X1(ele,2)*Y1(ele,3) - X1(ele,3)*Y1(ele,2)) + ...
        (X1(ele,3)*Y1(ele,1) - X1(ele,1)*Y1(ele,3)) + ...
        (X1(ele,1)*Y1(ele,2) - X1(ele,2)*Y1(ele,1)) ;

    for i=1:3
        beta(i)  =   (Y1(ele,ind(i+1) ) - Y1(ele,ind(i+2) ))/dosdelta;
        gamma(i) =  -(X1(ele,ind(i+1) ) - X1(ele,ind(i+2) ))/dosdelta;
    end

    B = [beta(1)       0   beta(2)       0  beta(3)        0
         0       gamma(1)       0  gamma(2)       0   gamma(3)
         gamma(1) beta(1) gamma(2) beta(2) gamma(3)   beta(3)];

    if t>0
        C = E/(1-nu^2)*t* ...            %  tension plana
                         [1 nu 0
                          nu 1 0
                          0 0 (1-nu)/2];
    else
        C = E/(1+nu)/(1-2*nu)* ...       %  deformacion plana
                         [1-nu nu 0
                          nu 1-nu 0
                          0 0 (1-2*nu)/2];
    end

    %Aca obtiene la matriz de rigidez elemental del triangulo
    K = B'*C*B*(dosdelta/2)
 
    %Aca hace el ensamblado de la matriz
    for i = 1:6
        for j=1:6
            in1 = in1+1;
            row(in1) = indof(locel(ele,i));
            col(in1) = indof(locel(ele,j));
            sk(in1)  = K(i,j); 
        end
    end
end

