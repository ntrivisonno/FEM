function [A,b]=matrix_elem(phi1,phi2,phi3,phi4,vi,b,f)
% Funcion que calcula la matriz elemental para un P3
%
% A: matriz elemental P3
% b: long intervalo, ej:3*h;
%
% phi1: funcion base 1
% phi2: funcion base 2
% phi3: funcion base 3
% phi4: funcion base 4
% vi: variable independiente, ej: x
% f: funcion fuente, puede ser handle, ya que desp lo pasamos a symbolic
%------------------------------------
x = sym(vi);
b = sym(b);
f = sym(f);

  % derivamos las funciones
  d1_phi1 = diff(phi1,x);    %d_phi1
  d1_phi2 = diff(phi2,x);    %d_phi2
  d1_phi3 = diff(phi3,x);    %d_phi3
  d1_phi4 = diff(phi4,x);    %d_phi4
  % derivamos 2da las funciones
  d2_phi1 = diff(d1_phi1,x);    %d_phi1
  d2_phi2 = diff(d1_phi2,x);    %d_phi2
  d2_phi3 = diff(d1_phi3,x);    %d_phi3
  d2_phi4 = diff(d1_phi4,x);    %d_phi4

  % calculamos los aportes a la matrix de rigidez elemental
  A11 = int(d2_phi1*d2_phi1,0,b);
  A12 = int(d2_phi1*d2_phi2,0,b);
  A13 = int(d2_phi1*d2_phi3,0,b);
  A14 = int(d2_phi1*d2_phi4,0,b);
  A21 = int(d2_phi2*d2_phi1,0,b);
  A22 = int(d2_phi2*d2_phi2,0,b);
  A23 = int(d2_phi2*d2_phi3,0,b);
  A24 = int(d2_phi2*d2_phi4,0,b);
  A31 = int(d2_phi3*d2_phi1,0,b);
  A32 = int(d2_phi3*d2_phi2,0,b);
  A33 = int(d2_phi3*d2_phi3,0,b);
  A34 = int(d2_phi3*d2_phi4,0,b);
  A44 = int(d2_phi4*d2_phi4,0,b);
  % armo la matriz elemental
  A = [A11   A12   A13  A14;
       A21   A22   A23  A24;
       A31   A32   A33  A34
       A14   A24   A34  A44];
  
  %calculo del vector de cargas
  b1 = int(phi1*f,0,b);
  b2 = int(phi2*f,0,b);
  b3 = int(phi3*f,0,b);
  b4 = int(phi4*f,0,b);

  b = [b1;b2;b3;b4];
end
