clear all;close all;clc;
%========================================================%
%                   TRIVISONNO, Nicolas                  %
%                        11/dic/19                       %
%                    Guia N 01 - Ej 6                    %
%========================================================%
%  Enunciado
%   (0,h) 3
%       |\
%       | \     Imp -> el nodo 1 es el q contiene el 'angulo recto
%       |_ \                   los dem'as los contamos antihorario
%  (0,0)|.|_\ (h,0)
%      1      2
% Hallar la matriz de rigidez elemental para la ecuaci'on de Poisson
% mediante manipulaci'on simb'olica
%%
tStart = tic; % son timer de multivariables, para cuando hay muchos timers en el prog
% calculamos los polinomios
syms x1 x2 x3 y1 y2 y3 h real % ptos del elemento Ij-ésimo
syms aj bj cj aj1 bj1 cj1 aj2 bj2 cj2 % coef. del polinomio

% calculamos los coef de phij_1
A = [1 x1 y1; 1 x2 y2; 1 x3 y3];
Aphi1 = subs(A,{x1,x2,x3,y1,y2,y3},{0,h,0,0,0,h}); % definimos los pts del tri'angulo

bphi1 = [1;0;0];
coef1 = Aphi1\bphi1; % solucion phi_1

% calculamos los coef de phij_2
Aphi2 = Aphi1;
bphi2 = [0;1;0];
coef2  = Aphi2\bphi2; % solucion phi_2

% calculamos los coef de phij3
Aphi3 = Aphi1;
bphi3 = [0;0;1];
coef3  = Aphi3\bphi3; % solucion phi_3

% armo los vectores phi1, phi2 phi3
syms x y
p = [1 x y];    % vector que utilizo para armar la funcion phi
% Calculo de phi1
phi1 = p*coef1; % CONTRUIMOS EL POLINOMIO 
phi1 = simplify(phi1);
% Calculo de phi2
phi2=p*coef2;
phi2=simplify(phi2);
% Calculo de phi3
phi3=p*coef3;
phi3=simplify(phi3);

%%
% Constuccion de MEF
% asumimos una partición equiespaciada, por lo que
% h=x_i-x_i-1 (dist entre nodos) ==> tamaño del elem= 2h
%syms h 

phi1 = subs(phi1,{x1,x2,x3},{0,h,0});     % phi1
phi2 = subs(phi2,{x1,x2,x3},{0,h,0});     % phi2
phi3 = subs(phi3,{x1,x2,x3},{0,h,0});     % phi3

% derivamos las funciones
d_phi1x=diff(phi1,x);    %d_phi1
d_phi2x=diff(phi2,x);    %d_phi2
d_phi3x=diff(phi3,x);    %d_phi3
d_phi1y=diff(phi1,y);    %d_phi1
d_phi2y=diff(phi2,y);    %d_phi2
d_phi3y=diff(phi3,y);    %d_phi3

%%
% calculamos los aportes a la matrix de rigidez elemental

% determiante de A
det_A = det(A);
det_A_subs = subs(det_A,{x1,x2,x3,y1,y2,y3},{0,h,0,0,0,h});
% det(A) = 2 * Area 
Area = h^2 / 2 ; % area del triangulo, b*h/2

A11 = d_phi1x*d_phi1x+d_phi1y*d_phi1y;
A12 = d_phi1x*d_phi2x+d_phi1y*d_phi2y;
A13 = d_phi1x*d_phi3x+d_phi1y*d_phi3y;
A21 = A12;
A22 = d_phi2x*d_phi2x+d_phi2y*d_phi2y;
A23 = d_phi2x*d_phi3x+d_phi2y*d_phi3y;
A31 = A13;
A32 = A23;
A33 = d_phi3x*d_phi3x+d_phi3y*d_phi3y;

if 0  % hacer con y = limite de recta
  % no me toma las integrales de area, analizar !
  A11 = int(int((d_phi1x*d_phi1x+d_phi1y*d_phi1y),0,h),0,h);
  A12 = int(int((d_phi1x*d_phi2x+d_phi1y*d_phi2y),0,h),0,h);
  A13 = int(int((d_phi1x*d_phi3x+d_phi1y*d_phi3y),0,h),0,h);
  A22 = int(int((d_phi2x*d_phi2x+d_phi2y*d_phi2y),0,h),0,h);
  A23 = int(int((d_phi2x*d_phi3x+d_phi2y*d_phi3y),0,h),0,h);
  A33 = int(int((d_phi3x*d_phi3x+d_phi3y*d_phi3y),0,h),0,h);
end

% armo la matriz elemental
AA = [A11   A12   A13;
      A21   A22   A23;
      A31   A32   A33];
AA = AA*Area;
disp('La  matrix elemental de un elemento triangular es') 
pretty(AA)
disp('El termino independiente dependera de las condiciones de borde')
time = toc(tStart);
fprintf('*-----------------------------------------------*')
fprintf('\n\nFIN! - OK - time = %d[s].\n',time)

% calculo del vector de cargas va a depender de las Cond. de Bordes
