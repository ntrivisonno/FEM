function [row,col,sk] = stiffcurStokes (in,xx,iel,conec,locel,inn,indof,inel,t,E,nu)


%  in:     N�meros de nodo (Vector)
%  xx:     Tabla de coordenadas
%  iel:    N�meros de elemento
%  conec:  Tabla de conectividades
%  locel:  Tabla de vectores de localizaci�n


nel = length (iel);

npgtri = 7; %Numero de puntos de ineracion

row  = zeros(18*18*nel,1);
col  = zeros(18*18*nel,1);
sk = zeros(18*18*nel,1);

in1 = 0;
for ele = 1:nel

    x1 = xx(inn(conec(ele,1)),1);
    y1 = xx(inn(conec(ele,1)),2);
    x2 = xx(inn(conec(ele,2)),1);
    y2 = xx(inn(conec(ele,2)),2);
    x3 = xx(inn(conec(ele,3)),1);
    y3 = xx(inn(conec(ele,3)),2);
    
    % Delta: �rea del elemento triangular
    Delta  = (x2*y3 - x3*y2 + x3*y1 - x1*y3 + x1*y2 - x2*y1)/2;

    %  P = Integ (d2px2*d2px2' + 2*d2pxy*d2pxy + d2py2*d2py2)
    %  ------------------------------------------------------
    P = zeros(18,18);
      Factor=(E*(t^3))/(12*(1-(nu^2)));  
      D=Factor*[1   (1-nu)  0;
                (1-nu)  1   0;
                0      0    (nu/2)];
    for ipg = 1:npgtri
        [xG, yG, weight] = integtri (ipg, x1, y1, x2, y2, x3, y3, npgtri);
        
       d2pdx2  = [2 0 0 6*xG 2*yG  0    0  12*xG^2 6*xG*yG  2*yG^2   0       0  ...
            20*xG^3 12*xG^2*yG 6*xG*yG^2  2*yG^3      0         0];
        d2pdxdy = [0 1 0  0   2*xG 2*yG  0    0      3*xG^2 4*xG*yG 3*yG^2    0  ...
             0       4*xG^3   6*xG^2*yG 6*xG*yG^2  4*yG^3      0];
        d2pdy2  = [0 0 2  0    0   2*xG 6*yG  0         0    2*xG^2 6*xG*yG 12*yG^2 ...
             0        0         2*xG^3   6*xG^2*yG 12*xG*yG^2 20*yG^3];
        
        m_d2 = [d2pdx2;d2pdy2;2*d2pdxdy];
        
        P = P + m_d2'*D*m_d2*weight;
    end
    
    %  Matriz A
    %  --------
    A = zeros(21,21);
    A(1,:) = [         1,      (x1),      (y1),...
        x1^2,     x1*y1,      y1^2,...
        x1^3,   x1^2*y1,   x1*y1^2,      y1^3,...
        x1^4,   x1^3*y1, x1^2*y1^2,   x1*y1^3,      y1^4,...
        x1^5,   x1^4*y1, x1^3*y1^2, x1^2*y1^3,   x1*y1^4,      y1^5];
    A(2,:) = [           0,           1,           0,...
        2*x1,        (y1),           0,...
        3*x1^2,     2*x1*y1,        y1^2,           0,...
        4*x1^3,   3*x1^2*y1,   2*x1*y1^2,        y1^3,           0,...
        5*x1^4,   4*x1^3*y1, 3*x1^2*y1^2,   2*x1*y1^3,        y1^4,           0];
    A(3,:) = [           0,           0,           1,...
        0,        (x1),        2*y1,...
        0,        x1^2,     2*x1*y1,      3*y1^2,...
        0,        x1^3,   2*x1^2*y1,   3*x1*y1^2,      4*y1^3,...
        0,        x1^4,   2*x1^3*y1, 3*x1^2*y1^2,   4*x1*y1^3,      5*y1^4];
    A(4,:) = [          0,          0,          0,...
        2,          0,          0,...
        6*x1,       2*y1,          0,          0,...
        12*x1^2,    6*x1*y1,     2*y1^2,          0,          0,...
        20*x1^3, 12*x1^2*y1,  6*x1*y1^2,     2*y1^3,          0,          0];
    A(5,:) = [         0,         0,         0,...
        0,         1,         0,...
        0,      2*x1,      2*y1,         0,...
        0,    3*x1^2,   4*x1*y1,    3*y1^2,         0,...
        0,    4*x1^3, 6*x1^2*y1, 6*x1*y1^2,    4*y1^3,         0];
    A(6,:) = [          0,          0,          0,...
        0,          0,          2,...
        0,          0,       2*x1,       6*y1,...
        0,          0,     2*x1^2,    6*x1*y1,    12*y1^2,...
        0,          0,     2*x1^3,  6*x1^2*y1, 12*x1*y1^2,    20*y1^3];

    A(7,:) = [         1,      (x2),      (y2),...
        x2^2,     x2*y2,      y2^2,...
        x2^3,   x2^2*y2,   x2*y2^2,      y2^3,...
        x2^4,   x2^3*y2, x2^2*y2^2,   x2*y2^3,      y2^4,...
        x2^5,   x2^4*y2, x2^3*y2^2, x2^2*y2^3,   x2*y2^4,      y2^5];
    A(8,:) = [           0,           1,           0,...
        2*x2,        (y2),           0,...
        3*x2^2,     2*x2*y2,        y2^2,           0,...
        4*x2^3,   3*x2^2*y2,   2*x2*y2^2,        y2^3,           0,...
        5*x2^4,   4*x2^3*y2, 3*x2^2*y2^2,   2*x2*y2^3,        y2^4,           0];
    A(9,:) = [           0,           0,           1,...
        0,        (x2),        2*y2,...
        0,        x2^2,     2*x2*y2,      3*y2^2,...
        0,        x2^3,   2*x2^2*y2,   3*x2*y2^2,      4*y2^3,...
        0,        x2^4,   2*x2^3*y2, 3*x2^2*y2^2,   4*x2*y2^3,      5*y2^4];
    A(10,:) = [          0,          0,          0,...
        2,          0,          0,...
        6*x2,       2*y2,          0,          0,...
        12*x2^2,    6*x2*y2,     2*y2^2,          0,          0,...
        20*x2^3, 12*x2^2*y2,  6*x2*y2^2,     2*y2^3,          0,          0];
    A(11,:) = [         0,         0,         0,...
        0,         1,         0,...
        0,      2*x2,      2*y2,         0,...
        0,    3*x2^2,   4*x2*y2,    3*y2^2,         0,...
        0,    4*x2^3, 6*x2^2*y2, 6*x2*y2^2,    4*y2^3,         0];
    A(12,:) = [          0,          0,          0,...
        0,          0,          2,...
        0,          0,       2*x2,       6*y2,...
        0,          0,     2*x2^2,    6*x2*y2,    12*y2^2,...
        0,          0,     2*x2^3,  6*x2^2*y2, 12*x2*y2^2,    20*y2^3];
    
    A(13,:) = [         1,      (x3),      (y3),...
        x3^2,     x3*y3,      y3^2,...
        x3^3,   x3^2*y3,   x3*y3^2,      y3^3,...
        x3^4,   x3^3*y3, x3^2*y3^2,   x3*y3^3,      y3^4,...
        x3^5,   x3^4*y3, x3^3*y3^2, x3^2*y3^3,   x3*y3^4,      y3^5];
    A(14,:) = [           0,           1,           0,...
        2*x3,        (y3),           0,...
        3*x3^2,     2*x3*y3,        y3^2,           0,...
        4*x3^3,   3*x3^2*y3,   2*x3*y3^2,        y3^3,           0,...
        5*x3^4,   4*x3^3*y3, 3*x3^2*y3^2,   2*x3*y3^3,        y3^4,           0];
    A(15,:) = [           0,           0,           1,...
        0,        (x3),        2*y3,...
        0,        x3^2,     2*x3*y3,      3*y3^2,...
        0,        x3^3,   2*x3^2*y3,   3*x3*y3^2,      4*y3^3,...
        0,        x3^4,   2*x3^3*y3, 3*x3^2*y3^2,   4*x3*y3^3,      5*y3^4];
    A(16,:) = [          0,          0,          0,...
        2,          0,          0,...
        6*x3,       2*y3,          0,          0,...
        12*x3^2,    6*x3*y3,     2*y3^2,          0,          0,...
        20*x3^3, 12*x3^2*y3,  6*x3*y3^2,     2*y3^3,          0,          0];
    A(17,:) = [         0,         0,         0,...
        0,         1,         0,...
        0,      2*x3,      2*y3,         0,...
        0,    3*x3^2,   4*x3*y3,    3*y3^2,         0,...
        0,    4*x3^3, 6*x3^2*y3, 6*x3*y3^2,    4*y3^3,         0];
    A(18,:) = [          0,          0,          0,...
        0,          0,          2,...
        0,          0,       2*x3,       6*y3,...
        0,          0,     2*x3^2,    6*x3*y3,    12*y3^2,...
        0,          0,     2*x3^3,  6*x3^2*y3, 12*x3*y3^2,    20*y3^3];
    
    x12 = (x1 + x2)/2; %Coordenada puntos medios
    y12 = (y1 + y2)/2;
    l12 = sqrt((y2-y1)^2 +(x2-x1)^2); %Longitu del lado del elemento
    u12 =  (y2-y1)/l12; %n12x
    v12 = -(x2-x1)/l12;    %n12y
    A(19,:) = [                                 0,                               u12,                               v12,...
        2*u12*x12,                   u12*y12+v12*x12,                         2*v12*y12,...
        3*u12*x12^2,           2*u12*x12*y12+v12*x12^2,           u12*y12^2+2*v12*x12*y12,                       3*v12*y12^2,...
        4*u12*x12^3,         3*u12*x12^2*y12+v12*x12^3,   2*u12*x12*y12^2+2*v12*x12^2*y12,         u12*y12^3+3*v12*x12*y12^2,                       4*v12*y12^3,...
        5*u12*x12^4,         4*u12*x12^3*y12+v12*x12^4, 3*u12*x12^2*y12^2+2*v12*x12^3*y12, 2*u12*x12*y12^3+3*v12*x12^2*y12^2,         u12*y12^4+4*v12*x12*y12^3,                       5*v12*y12^4];

    x23 = (x2 + x3)/2;
    y23 = (y2 + y3)/2;
    l23 = sqrt((y3-y2)^2 +(x3-x2)^2); %Longitu del lado del elemento
    u23 =  (y3-y2)/l23;
    v23 = -(x3-x2)/l23;
    A(20,:) = [                                 0,                               u23,                               v23,...
        2*u23*x23,                   u23*y23+v23*x23,                         2*v23*y23,...
        3*u23*x23^2,           2*u23*x23*y23+v23*x23^2,           u23*y23^2+2*v23*x23*y23,                       3*v23*y23^2,...
        4*u23*x23^3,         3*u23*x23^2*y23+v23*x23^3,   2*u23*x23*y23^2+2*v23*x23^2*y23,         u23*y23^3+3*v23*x23*y23^2,                       4*v23*y23^3,...
        5*u23*x23^4,         4*u23*x23^3*y23+v23*x23^4, 3*u23*x23^2*y23^2+2*v23*x23^3*y23, 2*u23*x23*y23^3+3*v23*x23^2*y23^2,         u23*y23^4+4*v23*x23*y23^3,                       5*v23*y23^4];

    x31 = (x3 + x1)/2;
    y31 = (y3 + y1)/2;
    l31 = sqrt((y1-y3)^2 +(x1-x3)^2);
    u31 =  (y1-y3)/l31;
    v31 = -(x1-x3)/l31;
    A(21,:) = [                                 0,                               u31,                               v31,...
        2*u31*x31,                   u31*y31+v31*x31,                         2*v31*y31,...
        3*u31*x31^2,           2*u31*x31*y31+v31*x31^2,           u31*y31^2+2*v31*x31*y31,                       3*v31*y31^2,...
        4*u31*x31^3,         3*u31*x31^2*y31+v31*x31^3,   2*u31*x31*y31^2+2*v31*x31^2*y31,         u31*y31^3+3*v31*x31*y31^2,                       4*v31*y31^3,...
        5*u31*x31^4,         4*u31*x31^3*y31+v31*x31^4, 3*u31*x31^2*y31^2+2*v31*x31^3*y31, 2*u31*x31*y31^3+3*v31*x31^2*y31^2,         u31*y31^4+4*v31*x31*y31^3,                       5*v31*y31^4];

    A1 = inv(A);
    
    
    
    D1 = [0 u12 v12 0 0 0   0 u12 v12 0 0 0   0  0   0  0 0 0; 
          0  0   0  0 0 0   0 u23 v23 0 0 0   0 u23 v23 0 0 0;
          0 u31 v31 0 0 0   0  0   0  0 0 0   0 u31 v31 0 0 0 ]/2;
      

               
     
    B  = A1(4:21,1:18) + A1(4:21,19:21)*D1;
    

    %  Matriz de rigidez
    %  -----------------
    K = B'*P*B*Delta;

    for i = 1:18
        for j=1:18
            in1 = in1 + 1;
            row(in1) = indof(locel(ele,i));
            col(in1) = indof(locel(ele,j));
            sk(in1)  = K(i,j);
        end
    end
    
end
%disp(rcond(A));
%S = sparse(row,col,sk);
