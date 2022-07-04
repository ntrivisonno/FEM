% Programa principal - reune a todas las rutinas temporales

clear all;close all

% n: Cantidad de nodos
% L: Longitud del dominio
% h: Tamano del intervalo espacial
% T: Tiempo de simulacion
% dt: Paso de tiempo
% TT: Tiempo final de la corrida

n = 32 ;
T = 3;
dt = 1.6e-3;
L = pi;
h = L /(n-1)

%TT = 4

% Solucion Exacta
[uexac,n,dt,T] = solucionexacta(n,dt,T);   

if 0
  % Resolucion mediante Crank Nicolson 
  [ucn,n,dt,T] = cranknicolson (n,dt,T);
end

if 0
  % Resolucion Mediante BackEuler
  [ube,n,dt,T] = backeuler(n,dt,T);
end

if 1
  % Resolucion Mediante Forward Euler
  [ufe,n,dt,T] = forwardeuler(n,dt,T); % Solucion solo para dt=0.001
end

%ube1=ube'
%ucn1=ucn'
%uex1 = uex' 
uexac1 = uexac'


%Ploteo de Resultado
% ubeplot=(ube(31,:))';
% ucnplot=(ucn(31,:))';
% uexacplot=(uexac(31,:))';
% uexplot=(uex(31,:))';







