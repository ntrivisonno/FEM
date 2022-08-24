% Ej 01 - Guia N06 
clear all;clc
warning('off','all'); %disable all warning
addpath('~/Documents/CIMEC/Cursos/FEM/pract/funciones_auxiliares/')
tStart = tic; % son timer de multivariables, para cuando hay muchos timers en el prog

%Canidad de Nodos:
n=11;
%Variable Epsilon
eps=0;
%Longitud del elemento
h = 1/(n-1);
%Pe
Pe=h/eps

% Galerking Standar 
% delta=0;   %Funciona bien si eps>=h Si e<h Oscila!!
delta = h-eps; % Difusion Artificial(No oscila, pero añade Difusion)
% delta = (2/3)*h; % Del jhonson

eps1 = eps+delta;

[x,u,xex,uex] = convecciondifusion (n, eps1,h,eps);

plot(x,u,'b',xex,uex,'r')


%Exportar Datos para Graficar
x = x'
u = u
uex = uex'
xex = xex'

time = toc(tStart);
fprintf('*-----------------------------------------------*\n')
fprintf('\n\nFIN! - OK - time = %d[s].\n',time)
