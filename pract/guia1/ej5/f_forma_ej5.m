% GUIA 1 - Ej5
% generamos las funciones de forma para resolver el ejercicio

clear all;close all;clc
syms h
A  = [1 0 0 0*h;1 h h^2 h^3;1 2*h 4*(h^2) 8*(h^3);1 3*h 9*(h^2) 27*(h^3)];

b1 = [1;0;0;0];
b2 = [0;1;0;0];
b3 = [0;0;1;0];
b4 = [0;0;0;1];

inv(A);
disp('phi1')
coef1 = A\b1;
disp('phi2')
coef2 = A\b2;
disp('phi3')
coef3 = A\b3;
disp('phi4')
coef4 = A\b4;

% armo los vectores phi1, phi2, phi3, phi4
syms x
p = [1 x x^2 x^3];  % vector que utilizo para armar la funcion phi
% Calculo de phi1
phi1 = p*coef1; % CONTRUIMOS EL POLINOMIO sol con los coeficientes
phi1 = simplify(phi1)
% Calculo de phi2
phi2 = p*coef2;
phi2 = simplify(phi2)
% Calculo de phi3
phi3 = p*coef3;
phi3 = simplify(phi3)
% Calculo de phi3
phi4 = p*coef4;
phi4 = simplify(phi4)

% derivada 1ra func forma
dphi1=diff(phi1,x);
dphi2=diff(phi2,x);
dphi3=diff(phi3,x);
dphi4=diff(phi4,x);

% derivada 2da func forma
d2phi1=diff(dphi1,x);
d2phi2=diff(dphi2,x);
d2phi3=diff(dphi3,x);
d2phi4=diff(dphi4,x);



if 0 
  % aca la bati mepa
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
end

