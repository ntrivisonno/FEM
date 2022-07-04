function [A,b] = MEF_cuadratic(f)
  % MEF_cuadratic -> calculo de la matrix elemental de un elemento cuadratico mediante manipulacion simbolica
  %---------------------------
  % A -> matrix elemental  - class: symbolic
  % b -> term. fuente elem - class: symbolic
  % f -> puntero a funcion dentro del termino indep, funcionHandle var ind 'x'

  % calculamos los polinomios
  syms x1 x2 x3 % ptos del elemento Ij-ésimo
  syms aj bj cj aj1 bj1 cj1 aj2 bj2 cj2 % coef. del polinomio
  syms x % variable de la fuente
  
  % calculamos los coef de phij_1
  Aphi1 = [1 x1 (x1)^2; 1 x2 (x2)^2; 1 x3 (x3)^2];
  bphi1 = [1;0;0];
  coef1 = Aphi1\bphi1; % solucion phi_1
  
  % calculamos los coef de phij_2
  Aphi2 = Aphi1;
  bphi2 = [0;1;0];
  coef2 = Aphi2\bphi2; % solucion phi_2

  % calculamos los coef de phij3
  Aphi3 = Aphi1;
  bphi3 = [0;0;1];
  coef3 = Aphi3\bphi3; % solucion phi_3
  
  % armo los vectores phi1, phi2 phi3
  syms x
  p = [1 x x^2];    % vector que utilizo para armar la funcion phi
  % Calculo de phi1
  phi1 = p*coef1; % CONTRUIMOS EL POLINOMIO sol con los coeficientes
  phi1 = simplify(phi1);
  
  % Calculo de phi2
  phi2 = p*coef2;
  phi2 = simplify(phi2);
  % Calculo de phi3
  phi3 = p*coef3;
  phi3 = simplify(phi3);
  
  %%
  % Constuccion de MEF
  % asumimos una partición equiespaciada, por lo que
  % h=x_i-x_i-1 (dist entre nodos) ==> tamaño del elem= 2h
  syms h 
  
  phi1 = subs(subs(subs(phi1,x1,0),x2,h),x3,2*h);     % phi1
  phi2 = subs(subs(subs(phi2,x1,0),x2,h),x3,2*h);     % phi2
  phi3 = subs(subs(subs(phi3,x1,0),x2,h),x3,2*h);     % phi3
  
  % derivamos las funciones
  d_phi1 = diff(phi1,x);    %d_phi1
  d_phi2 = diff(phi2,x);    %d_phi2
  d_phi3 = diff(phi3,x);    %d_phi3
  %%

  % calculamos los aportes a la matrix de rigidez elemental
  A11 = int(d_phi1*d_phi1,0,2*h);
  A12 = int(d_phi1*d_phi2,0,2*h);
  A13 = int(d_phi1*d_phi3,0,2*h);
  A21 = int(d_phi2*d_phi1,0,2*h);
  A22 = int(d_phi2*d_phi2,0,2*h);
  A23 = int(d_phi2*d_phi3,0,2*h);
  A31 = int(d_phi3*d_phi1,0,2*h);
  A32 = int(d_phi3*d_phi2,0,2*h);
  A33 = int(d_phi3*d_phi3,0,2*h);
  
  % armo la matriz elemental
  A = [A11   A12   A13;
       A21   A22   A23;
       A31   A32   A33];
  
  %calculo del vector de cargas
  b1 = int(phi1*f,0,2*h);
  b2 = int(phi2*f,0,2*h);
  b3 = int(phi3*f,0,2*h);

  b = [b1;b2;b3];
end
