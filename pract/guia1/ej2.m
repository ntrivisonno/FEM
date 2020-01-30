% GUIA 1 - Ej2
% generamos las funciones bases para resolver el ejercicio

l = 10; % long del elem
n = 10; % cant de elem
syms h
% h = l/n;

A = [h*0 0 1;h^2 h 1;4*(h^2) 2*h 1]
b1 = [1;0;0];
b2 = [0;1;0];
b3 = [0;0;1];

inv(A);
disp('phi1')
phi1 = A\b1
disp('phi2')
phi2 = A\b2
disp('phi3')
phi3 = A\b3

