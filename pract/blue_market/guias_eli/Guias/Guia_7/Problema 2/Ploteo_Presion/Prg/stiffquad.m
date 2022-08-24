function [row,col,sk] = stiffquad (in,xx,iel,conec,locel,kt)

% Generacion de la matriz de rigidez
% Elemento cuadrangulo lineal isoparametrico p/problema conduccion de calor
%
% in: Numeros de nodo
% xx: Tabla de coordenadas
% iel: Numeros de elemento
% conec: Tabla de conectividades
% locel: Tabla de vectores de localizacion

    nel = length (iel);
    npgxi = 2;
    npgeta = 2;

% Genera vector inn cuya componente "i" da la posicion donde se
% almacenan las coordenadas del nodo "i" en la tabla "xx"

    inn = zeros(max(in),1);
        for i=1:length(in)
            j = in(i);
            inn(j) = i;
        end
% row, col, sk dan los indices de fila, columna y contenido de la matriz
% de rigidez en almacenamiento sparse
    row = zeros(16*nel,1);
    col = zeros(16*nel,1);
    sk = zeros(16*nel,1);

    in1 = 0;
    X1 = zeros(4,1);
    Y1 = zeros(4,1);
    
    
for iel = 1:nel
    for k=1:4
        X1(k) = xx(inn(conec(iel,k)),1);
        Y1(k) = xx(inn(conec(iel,k)),2);
    end
    
    K = zeros(4,4);
  
    k=[kt(1) 0; 0 kt(2)];
       
    for ipg = 1:npgxi*npgeta
        [xi, eta, weight] = integ2D (ipg, npgxi, npgeta);
%         B = 0.25*[(1+eta), -(1+eta), -(1-eta),  (1-eta);
%                   (1+xi) ,  (1-xi) , -(1-xi) , -(1+xi)];

              B = 0.25*[-(1-xi), (1-xi), (1+xi),-(1+xi);
                -(1-eta), -(1+eta),(1+eta), (1-eta)];
        Jac = (B * [X1,Y1])';
        dJac = det(Jac);
        JacinvT = inv(Jac)';
        GradPhi = JacinvT*B;
        K = K + GradPhi'*k*GradPhi*dJac*weight;
        
    end      
    
    for i = 1:4
        for j=1:4
            in1 = in1 + 1;
            row(in1) = inn(locel(iel,i));
            col(in1) = inn(locel(iel,j));
            sk(in1) = K(i,j);
        end
    end
end

