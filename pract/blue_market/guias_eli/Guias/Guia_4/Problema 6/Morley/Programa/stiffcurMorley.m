function [row,col,sk] = stiffcurMorley (in,xx,iel,conec,locel,inn,indof,inel,t,E,nu)


%  in:     Números de nodo (Vector)
%  xx:     Tabla de coordenadas
%  iel:    Números de elemento
%  conec:  Tabla de conectividades
%  locel:  Tabla de vectores de localización


nel = length (iel);

%npgtri = 7; %Numero de puntos de ineracion

row  = zeros(6*6*nel,1);
col  = zeros(6*6*nel,1);
sk = zeros(6*6*nel,1);

in1 = 0;
for ele = 1:nel

    x1 = xx(inn(conec(ele,1)),1);
    y1 = xx(inn(conec(ele,1)),2);
    x2 = xx(inn(conec(ele,2)),1);
    y2 = xx(inn(conec(ele,2)),2);
    x3 = xx(inn(conec(ele,3)),1);
    y3 = xx(inn(conec(ele,3)),2);
    x4 = xx(inn(conec(ele,4)),1);
    y4 = xx(inn(conec(ele,4)),2);
    x5 = xx(inn(conec(ele,5)),1);
    y5 = xx(inn(conec(ele,5)),2);
    x6 = xx(inn(conec(ele,6)),1);
    y6 = xx(inn(conec(ele,6)),2);
    
    % Delta: área del elemento triangular
    Delta  = (x2*y3 - x3*y2 + x3*y1 - x1*y3 + x1*y2 - x2*y1)/2;
    
     P = zeros(6,6);
    
      Factor=(E*(t^3))/(12*(1-(nu^2)));  
      D=Factor*[1   (1-nu)  0;
                (1-nu)  1   0;
                0      0    (nu/2)];

d2pdx2  = [0 0 0 2 0 0 ];
d2pdxdy = [0 0 0 0 1 0 ];
d2pdy2  = [0 0 0 0 0 2 ];

m_d2 = [d2pdx2 ; d2pdy2; 2*d2pdxdy ];

%D = diag([1,1,1/2]);

P = m_d2'*D*m_d2;

% m_d2p = [d2pdx2 ; 2*d2pdxdy  ; d2pdy2];
% 
% Dp = diag([1,1/2,1]);
% Pp = m_d2p'*Dp*m_d2p;
    
    %  Matriz A
    %  --------
    A = zeros(6,6);
    A(1,:) = [         1,      (x1),      (y1),...
        x1^2,     x1*y1,      y1^2];
  

    A(2,:) = [         1,      (x2),      (y2),...
        x2^2,     x2*y2,      y2^2];

    
    A(3,:) = [         1,      (x3),      (y3),...
        x3^2,     x3*y3,      y3^2 ];
    
    x12 = x4; %Coordenada puntos medios
    y12 = y4;
    l12 = sqrt((y2-y1)^2 +(x2-x1)^2); %Longitu del lado del elemento
    u12 =  (y2-y1)/l12;    %n12y
    v12 = -(x2-x1)/l12;    %n12x
    A(4,:) = [  0,                               u12,                               v12,...
        2*u12*x12,                   u12*y12+v12*x12,                         2*v12*y12]; 
   
    x23 = x5;
    y23 = y5;
    l23 = sqrt((y3-y2)^2 +(x3-x2)^2); %Longitu del lado del elemento
    u23 =  (y3-y2)/l23;  %n23y
    v23 = -(x3-x2)/l23;  %n23x
    A(5,:) = [   0,                               u23,                               v23,...
        2*u23*x23,                   u23*y23+v23*x23,                         2*v23*y23 ];
   
    x31 = x6;
    y31 = y6;
    l31 = sqrt((y1-y3)^2 +(x1-x3)^2);
    u31 =  (y1-y3)/l31;   %n31y
    v31 = -(x1-x3)/l31;   %n31x
    A(6,:) = [  0,                               u31,                               v31,...
        2*u31*x31,                   u31*y31+v31*x31,                         2*v31*y31 ]; 

    A1 = inv(A);
    
   
    B = A1;    
    
    %  Matriz de rigidez
    %  -----------------
    K = B'*P*B*Delta;

    for i = 1:6
        for j=1:6
            in1 = in1 + 1;
            row(in1) = indof(locel(ele,i));
            col(in1) = indof(locel(ele,j));
            sk(in1)  = K(i,j);
        end
    end
    
end
%disp(rcond(A));
%S = sparse(row,col,sk);
