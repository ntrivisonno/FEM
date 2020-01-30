clear all;clc;
%========================================================%
%                   TRIVISONNO, Nicolás                  %
%                        11/dic/19                       %
%                    Guia N 01 - Ej 4                    %
%========================================================%
%  Enunciado
% n = cantidad de elementos
% Resolucion   -u" = f(x),  -1 <= x <= 1
%            u(-1) = u(1) = 0
% Elementos finitos cuadraticos
%%
% funcion fuente
f=1;
if 0
  % distintas opciones de funcion
  f = 1
  f = @(x) x.^2
  f = @(x) x
  f = @(x) x.^3 + 2*x - 3 
end

if 0 % manipulacion sumbolica ON-OFF
  [Ae,be] = MEF_cuadratic(f);
  disp('La  matrix elemental es') 
  pretty(Ae)
  disp('El termino independiente es') 
  pretty(be)
end

if 1 % directamente resultado symbolic
  % resutlado symbolic de matriz elemental 
  Ae = [7/6 -4/3 1/6;-4/3 8/3 -4/3;1/6 -4/3 7/6]
  be = [1; 2; 3];
  n = 5; % cantidad de elem
  GDL_nodal = 1
  [Ag,bg] = ensamble_global (Ae,be,n,GDL_nodal)
end

%
%
%  continuar con la prog del ensamble global
%  parece que se arregl'o
%
%

