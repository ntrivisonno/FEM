%Programa para correr diferentes metodos aplicado al caso:

clear all

% n: Cantidad de nodos
% L: Longitud del dominio
% h: Tamano del intervalo espacial
% T: Tiempo de simulacion
% dt: Paso de tiempo
% TT: Tiempo hasta donde hago la corrida

   n = 6 ;
   T = 3;
   dt = 0.1;
   L = pi;
   h = L /(n-1)
  
   %TT = 4
   
   
% Solucion Exacta
[uexac,n,dt,T] = solucionexacta(n,dt,T);   

% %Resolucion mediante Crank Nicolson 
 %[ucn,n,dt,T] = cranknicolson (n,dt,T);
% 
% %Resolucion Mediante BackEuler
% [ube,n,dt,T] = backeuler(n,dt,T);
 
%Resolucion Mediante Foward Euler   
[uex,n,dt,T] = fowardeuler (n,dt,T);         %%Solo se consigue solucion para dt=0.001
               

%ube1=ube'
%ucn1=ucn'
uex1=uex'
uexac1=uexac'


%Ploteo de Resultado
% ubeplot=(ube(31,:))';
% ucnplot=(ucn(31,:))';
% uexacplot=(uexac(31,:))';
% uexplot=(uex(31,:))';







   