function [row,col,sk] = stiffcur (in,xx,iel,conec,locel,inn,indof,inel)
%
%  Generacion de la matriz de rigidez
%  Elemento triangulo lineal p/problema conduccion de calor
%
%  in:    Numeros de nodo
%  xx:    Tabla de coordenadas
%  iel:   Numeros de elemento
%  conec: Tabla de conectividades
%  locel: Tabla de vectores de localizacion 
%  inn:   Vector de nodos ordenados de manera decreciente
%  indof: Dado el # de GDL del nodo, da la posicion donde lo quiere meter (indice) dentro de la matriz global 
%  inel:  Numeros de elementos ordenados
%
nel = length (iel);

%   El vector ind es un vector auxiliar para realizar el desplazamiento 
%   ciclico de indice en el lazo
ind  = [ 1, 2, 3, 1, 2];

%   row, col, sk dan los indices de fila, columna y contenido de la matriz de rigidez en almacenamiento sparse. El elem tiene 3[GDL/elem], ergo la matriz elem ser'a de 3x3, por lo tanto tendr'a 9 componentes. Es por esto que se multiplica 9x #de elem.
row  = zeros(9*nel,1); % le indico a la matriz sparse cuantos elem no nulos tiene
col  = zeros(9*nel,1); % son 9 x #elem, xq la matriz elemental es de Ae = 3x3
sk = zeros(9*nel,1);   % el valor que adopta el nodo

in1 = 0;
for ele = 1:nel % nel = length (iel) | iel = # de elem

    % por cada elem recorro cada nodo para obtener sus coordenadas x,y
    for k=1:3 
      X1(k) = xx(inn(conec(ele,k)),1);  % inn: vecto de nodos ordenados | ele: elemento | k: nodo del elem
      Y1(k) = xx(inn(conec(ele,k)),2);
    end

    % det(A) se usa para calc los coef. de las funciones bases en Kramer
    % det(A) = dos veces el area =  (h*h/2)*2 = h^2
    dosdelta  = (X1(2)*Y1(3) - X1(3)*Y1(2)) + ...
                (X1(3)*Y1(1) - X1(1)*Y1(3)) + ...
                (X1(1)*Y1(2) - X1(2)*Y1(1)) ;

    for i=1:3 % aca sire el vector ind
        beta(i)  =   (Y1( ind(i+1) ) - Y1( ind(i+2) ))/dosdelta;% aca poner sqrt(kxx)
        gamma(i) =  -(X1( ind(i+1) ) - X1( ind(i+2) ))/dosdelta;% aca poner sqrt(kyy)
    end

    for i = 1:3 %np
        for j=1:3 %np
            in1 = in1 + 1;
            row(in1) = indof(locel(ele,i)); % indof te da la posicion en el grado de libertad
            col(in1) = indof(locel(ele,j));
            sk(in1)  = (beta(i) * beta(j) + gamma(i)* gamma(j) )*dosdelta/2;
        end
    end
end

