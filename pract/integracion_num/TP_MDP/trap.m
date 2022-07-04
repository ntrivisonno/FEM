function [y] = trap (f,a,b,n)
% function [y] = trap (f,a,b,n)
% funcion que calcula la regla del trapecio
%
% y: valor de la integral
%
% f: puntero a funcion
% [a,b]: extremo de integracion
% n: cant de intervalos 
% n = 1 trapecio simple
% n > 1 trapecio compuesta
%	 
  % trapecio simple
  y = (b-a)*(f(b)-f(a))/2;

end 
