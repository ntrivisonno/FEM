function [row,col,sk] = stiffcurElast2D (xx,iel,conec,locel,inn,indof,t,E,nu)
%
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

for i=1:3
    X1(:,i) = [ xx(inn(conec(:,i)),1) ] ;    %Cada fila es la coordenada x de los tres nodos del elemento
    Y1(:,i) = [ xx(inn(conec(:,i)),2) ] ;    %Cada fila es la coordenada y de los tres nodos del elemento
end

ind  = [ 1, 2, 3, 1, 2];
row  = zeros(36*nel,1);     %La matriz de rigidez elemental tiene 36 "coponentes"
col  = zeros(36*nel,1);     %Por lo tanto la global es de 36*el numero de elementos
sk = zeros(36*nel,1);

in1 = 0;
for ele = 1:nel

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

    K = B'*C*B*(dosdelta/2);

    for i = 1:6
        for j=1:6
            in1 = in1+1;
            row(in1) = indof(locel(ele,i));
            col(in1) = indof(locel(ele,j));
            sk(in1)  = K(i,j); 
        end
    end
end

S=sparse(row,col,sk);