% GUIA 1 - Ej5
% generamos las funciones bases para resolver el ejercicio

clear all;close all;clc
syms h
A  = [h*0 0 0 1;h^3 h^2 h 1;8*h^3 4*(h^2) 2*h 1;27*h^3 9*(h^2) 3*h 1]
b1 = [1;0;0;0];
b2 = [0;1;0;0];
b3 = [0;0;1;0];
b4 = [0;0;0;1];

inv(A);
disp('phi1')
phi1 = A\b1
disp('phi2')
phi2 = A\b2
disp('phi3')
phi3 = A\b3
disp('phi4')
phi4 = A\b4

if 0 
  % con la funcion polyval, evaluamos el polinomio y nos tiene que dar la funcion delta
  % pol phi1 = [1 0 0 0]
  y1_0 = polyval(phi1,0) ;
  y1_h = polyval(phi1,h) ;
  y1_2h = polyval(phi1,2*h) ;
  y1_3h = polyval(phi1,3*h) ;
  y1 = [y1_0,y1_h,y1_2h,y1_3h]
  
  % pol phi2 = [0 1 0 0]
  y2_0 = polyval(phi2,0) ;
  y2_h = polyval(phi2,h) ;
  y2_2h = polyval(phi2,2*h) ;
  y2_3h = polyval(phi2,3*h) ;
  y2 = [y2_0,y2_h,y2_2h,y2_3h]
  
  % pol phi3  = [0 0 1 0]
  y3_0 = polyval(phi3,0) ;
  y3_h = polyval(phi3,h) ;
  y3_2h = polyval(phi3,2*h) ;
  y3_3h = polyval(phi3,3*h) ;
  y3 = [y3_0,y3_h,y3_2h,y3_3h]
  
  % pol phi4  = [0 0 0 1]
  y4_0 = polyval(phi4,0) ;
  y4_h = polyval(phi4,h) ;
  y4_2h = polyval(phi4,2*h) ;
  y4_3h = polyval(phi4,3*h) ;
  y4 = [y4_0,y4_h,y4_2h,y4_3h]
endif

