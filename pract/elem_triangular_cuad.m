% calculo de funciones base para elem triangular cuad, apunte 3 - pg 15
% ------------------------------------------------
% piramide de polinomio
%           1
%         x    y
%      x2   xy   y2
%
% P2{x} = a00 + a10*x + a01*y + a20*x^2 + a11*x*y + a02*y^2
% dim{P2} = 6
% ------------------------------------------------
clear all;close all;tic
% puntos del triangulo
syms x1 y1 x2 y2 x3 y3 x4 y4 x5 y5 x6 y6 real 
% coef polinomio
syms a00 a10 a01 a20 a11 a02 real 
% funciones base
syms phi1 phi2 phi3 phi4 phi5 phi6 real
% variables p armar los vectores phi1, phi2 phi3
syms x y

A = [1 x1 y1 x1^2 x1*y1 y1^2;
     1 x2 y2 x2^2 x2*y2 y2^2;
     1 x3 y3 x3^2 x3*y3 y3^2;
     1 x4 y4 x4^2 x4*y4 y4^2;
     1 x5 y5 x5^2 x5*y5 y5^2;
     1 x6 y6 x6^2 x6*y6 y6^2];

coef =[a00 a10 a01 a20 a11 a02]';

% matrix evaluada en los nodos del triangulo master
ANum = subs(A,{x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6},{0,0,1,0,0,1,0.5,0,0.5,0.5,0,0.5});

% ------------------------------------------------
%    FUNCIONES BASES en COORD de CARTESIANAS
% ------------------------------------------------

inv_ANum = inv(ANum);
p2 = [1 ; x ; y ; x^2 ; x*y ; y^2];

f_bases = inv_ANum' * p2;  % xq sacamos la transpuesta ??

disp(['funcion base en coord cartesianas'])
phi_all = simplify(f_bases);
disp(phi_all)

% para asegurarnos que las funciones bases estan bien calculadas, tenemos que evaluar cada funcion en los distintos nodo del elem master y verificar que cumplen la funcion delta (1 en ese nodo y 0 en los demas)
% phi_1 = subs(phi_all,{x,y},{0,0}) % evaluacion nodo 1
% phi_2 = subs(phi_all,{x,y},{1,0}) % evaluacion nodo 2
% phi_4 = subs(phi_all,{x,y},{0.5,0}) % evaluacion nodo 4
% ------------------------------------------------
%    todo OK - verifica las funciones bases
% ------------------------------------------------

% ------------------------------------------------
%    FUNCIONES BASES en COORD de AREAS
% ------------------------------------------------
% ahora debemos pasar las funciones bases en coordenadas cartesianas a las coordenadas de area
% para elem lineales las coordenadas de areas son las mismas que las cartesianas, pero para los elem P2 no
%  lambda_1 = 1-xi-eta   
%  lambda_2 = xi
%  lambda_3 = eta
syms lambda_1 lambda_2 lambda_3 xi eta
  % la sustitucion se debe hacer en 2pasos xq sino no toma a lambda_1
pp = subs(phi_all,{x,y},{lambda_2,lambda_3});
pp = subs(pp,{1-xi-eta},{lambda_1});
phi_all_area = factor(pp); % funciones bases coord areas
disp(['funcion base en coord de areas'])
func_areas = subs(phi_all_area,{1-lambda_2-lambda_3},{lambda_1})
% SSS esta ok, lo 'unico que SSS(1) se debe expresar mejor, es decir (octave no lo hace)
% SSS(1) = lambda_1 * (2 * lambda_1 - 1)


toc

