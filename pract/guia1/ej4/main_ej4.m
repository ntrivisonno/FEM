clear all;clc;
%========================================================%
%                   TRIVISONNO, Nicolas                  %
%                        03/nov/19                       %
%                    Guia N 01 - Ej 4                    %
%========================================================%
%  Enunciado
% n = cantidad de elementos
% Resolucion   -u" = f(x),  -1 <= x <= 1
%            u(-1) = u(1) = 0
% Elementos finitos cuadraticos
%%
tic
%
% carga de variables
h = 1; % long del intervalo

% funcion fuente
f=1;
if 0
  % distintas opciones de funcion
  f = 1
  f = @(x) x.^2
  f = @(x) x
  f = @(x) x.^3 + 2*x - 3 
end

%
% matriz elem symbolic
[Ae_s,be_s] = MEF_cuadratic(f);
fprintf('La  matrix elemental es:\n%s\n',char(pretty(Ae_s)))
fprintf('El termino independiente es:\n%s\n',char(pretty(be_s)))

%
% corversion - symbolic2numeric
Ae_h = matlabFunction(Ae_s); % symbolic2handle
Ae_n = Ae_h(h); % handle2numeric
be_h = matlabFunction(be_s); % symbolic2handle
be_n = be_h(h); % handle2numeric

%
% ensamble global
n = 5; % cantidad de elem
GDL_nodal = 1;
[Ag,bg] = ensamble_global (Ae_n,be_n,n,GDL_nodal);

%
% solucion
x = Ag/bg';
disp('La solucion es:')
disp(x)

time = toc;
fprintf('*-----------------------------------------------*\n')
fprintf('\n\nFIN! - prog OK - time = %d[s]\n',time)
