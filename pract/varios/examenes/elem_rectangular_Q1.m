% EF rectangular bilineal
% sea el pol Q1 - para un elem cuadrangular
% resolucion de cuadrangulo bilineal
%
%  Enunciado
%  
% 4 (0,1)  _ _ _ 3 (1,1)
%         |     |  
%         |     |  contamos antihorario 
%         |_    | 
%  (0,0)  |.|_ _|  (1,0)
%        1       2
%
clear all;clc

syms x y a00 a10 a01 a11 x1 y1 x2 y2 x3 y3 x4 y4

Q1 = a00 + x*a10 + a01*y + a11*x*y

Q1x = diff(Q1,x)
Q1y = diff(Q1,y)


A = [1 x1 y1 x1*y1;1 x2 y2 x2*y2;1 x3 y3 x3*y3;1 x4 y4 x4*y4];
Aphi1 = subs(A,{x1,y1,x2,y2,x3,y3,x4,y4},{0,0,1,0,1,1,0,1})

% calculamos los coef de phij_1
bphi1 = [1;0;0;0];
coef1 = Aphi1\bphi1; % solucion phi_1 - funcion de forma 1

% calculamos los coef de phij_2
Aphi2 = Aphi1;
bphi2 = [0;1;0;0];
coef2 = Aphi2\bphi2; % solucion phi_2 - funcion de forma 1

% calculamos los coef de phij_3
Aphi3 = Aphi1;
bphi3 = [0;0;1;0];
coef3 = Aphi3\bphi3; % solucion phi_3 - funcion de forma 1

% calculamos los coef de phij_4
Aphi4 = Aphi1;
bphi4 = [0;0;0;1];
coef4 = Aphi4\bphi4; % solucion phi_4 - funcion de forma 1


% armo los vectores phi1, phi2 phi3
syms x y
p = [1 x y x*y];    % vector que utilizo para armar la funcion phi
% Calculo de phi1
phi1 = p*coef1; % CONTRUIMOS EL POLINOMIO 
phi1 = simplify(phi1);
% Calculo de phi2
phi2 = p*coef2; % CONTRUIMOS EL POLINOMIO 
phi2 = simplify(phi2);
% Calculo de phi3
phi3 = p*coef3; % CONTRUIMOS EL POLINOMIO 
phi3 = simplify(phi3);
% Calculo de phi4
phi4 = p*coef4; % CONTRUIMOS EL POLINOMIO 
phi4 = simplify(phi4);

deta = det(A);

