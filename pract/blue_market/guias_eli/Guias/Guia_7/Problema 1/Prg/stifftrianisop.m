function [row,col,sk] = stifftrianisop (in,xx,iel,conec,locel)
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

npgtri = 3;
      
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


for iel = 1:nel
    for k=1:6
        X1(k) = xx(inn(conec(iel,k)),1);
        Y1(k) = xx(inn(conec(iel,k)),2);
    end
           
    x1 = xx(inn(conec(iel,4)),1);
    y1 = xx(inn(conec(iel,4)),2);
    x2 = xx(inn(conec(iel,5)),1);
    y2 = xx(inn(conec(iel,5)),2);
    x3 = xx(inn(conec(iel,6)),1);
    y3 = xx(inn(conec(iel,6)),2);
    
    K = zeros(6,6);
    for ipg = 1:3
        [xG, yG, weight] = integtri (ipg, x1, y1, x2, y2, x3, y3, npgtri);
       
    B = [(-3 +4*yG + 4*xG),  (4*yG - 1), (0) , (4 - 4*xG - 8*yG),(4*xG), (-4*xG);
         (-3 +4*yG + 4*xG), (0) , (4*xG - 1) , (-4*yG) , (4*yG) , (4 - 8*xG - 4*yG)];
         
    Jac = B * [X1, Y1];
    dJac = det(Jac);
    JacinvT = inv(Jac)';
    GradPhi = JacinvT*B;
    K = K + GradPhi'*GradPhi*dJac*weight;
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

