% demo P3 unico 

% P3(x)  = a0 + a1*x + a2*x^2 + a3*x^3
% P3'(x) =    a1*x + 2*a2*x + 3*a3*x^2

syms a0 a1 a2 a3 % coeficientes
syms x a b % a,b puntos cualquiera del dominio

% P3(a)  = a0 + a1*a + a2*a^2 + a3*a^3
% P3'(a) =    a1*a + 2*a2*a + 3*a3*a^2
% P3(b)  = a0 + a1*b + a2*b^2 + a3*b^3
% P3'(b) =    a1*b + 2*a2*b + 3*a3*b^2

A = [1 a a^2 a^3
     0 1 2*a 3*a^2;
     1 b b^2 b^3;
     0 1 2*b 3*b^2]

% Si el polinomio tiene 'unica soluci'on, entonces el det(A)!=0

p = det(A);
p1 = simplify(p);
fprintf('det(A):\n%s \n',char(pretty(p1)))
fprintf('Calculamos factor comun\n')
p2 = factor(p1);
fprintf('det(A):\n%s \n',char(pretty(p2)))
fprintf('Como det(A)!=0, porque a!=b. El polinomio es unico\n')

