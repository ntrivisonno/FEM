function [y] = simpson_tercio (f,a,b,n)
% function [y] = simpson_tercio (f,a,b,n)
% funcion que calcula la regla del simpson untercio
% y: valor de la integral
%
% f: puntero a funcion
% [a,b]: extremo de integracion
% n: cant de intervalos 
% n = 1 simpson simple
% n > 1 trapecio compuesta
%	 
  % simpson simple
  h = (b-a)/2;
  y = h/3*(f(a)+4*f(h)+f(b));

end 
