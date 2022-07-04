function [row,col,sk] = stiffcurQ1P0 (in,xx,iel,conec,locel,mu)

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
    row = zeros(81*nel,1);
    col = zeros(81*nel,1);
    sk = zeros(81*nel,1);

    in1 = 0;
    X1 = zeros(4,1);
    Y1 = zeros(4,1);
    
    
for iel = 1:nel
    Akvv = zeros(8,8);
    Akvp = zeros(8,1);
    
    for k=1:4
        X1(k) = xx(inn(conec(iel,k)),1);
        Y1(k) = xx(inn(conec(iel,k)),2);
    end
    
    for ipg = 1:npgxi*npgeta
        
      %Teniendo en ccuenta StiffcurlsoQuad
        [xi, eta, weight] = integ2D (ipg, npgxi, npgeta);
        B = 0.25*[(1+eta), -(1+eta), -(1-eta),  (1-eta);
                  (1+xi) ,  (1-xi) , -(1-xi) , -(1+xi)];
     
        Jac = ( B*[X1,Y1])';
        dJac = det(Jac);
        JacinvT = inv(Jac)';
        
      % Segun pagina 22 Apunte Elementos Mixtos  
        GraPhi1 = 0.25*[-(1-eta),0, (1-eta),0,(1+eta),0, -(1+eta),0;
                         -(1-xi),0, -(1+xi),0, (1+xi),0, (1-xi),0] ;
        GraPhi2 = 0.25*[0,-(1-eta),0, (1-eta),0,(1+eta),0, -(1+eta);
                         0,-(1-xi), 0, -(1+xi),0, (1+xi),0, (1-xi)] ;
        
        psi = 0.25* [ -(1-eta),-(1-xi),(1-eta),-(1+xi),(1+eta),(1+xi),-(1+eta),(1-xi)];
         
        % Segun pagina 23 Apunte Elementos Mixtos  
        Akvv=Akvv+((JacinvT*GraPhi1)'*JacinvT*GraPhi1+(JacinvT*GraPhi2)'*JacinvT*GraPhi2)*weight*dJac; 
         
        M0 = [0 0; 0 0];
    
             M = [JacinvT,M0,M0,M0;
                  M0,JacinvT,M0,M0;
                  M0,M0,JacinvT,M0;
                  M0,M0,M0,JacinvT];
              
       Akvp = Akvp + (-M*psi'*weight*dJac);
             
    end      
    
       Akvv = mu*Akvv
       Ke = [Akvv Akvp;
             Akvp' 0];
   
    for i = 1:9
        for j=1:9
            in1 = in1 + 1;
            row(in1) = locel(iel,i);
            col(in1) = locel(iel,j);
            sk(in1) = Ke(i,j);
        end
    end
 
end



