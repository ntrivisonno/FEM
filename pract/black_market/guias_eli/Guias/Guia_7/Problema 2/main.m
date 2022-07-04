% main para correr el problema de Stokes

clear all
clc

lenx = 1; % Longitud Dominio en X (para ploteo)
leny = 1; % Longitud Dominio en Y 
%numx = ; % Cantidad de divisiones en X
%numy = ; % Cantidad de divisiones en Y
nxt = 1; % Densidad de puntos en Streamlines start 
nyt = 1; % Densidad de puntos en Streamlines end

%PARA MALLA 441
file = 'Malla_441.txt';
numx = 20; % Cantidad de divisiones en X
numy = 20; % Cantidad de divisiones en Y

% % %PARA MALLA 1681
% file = 'Malla_1681.txt';
% numx = 40; % Cantidad de divisiones en X
% numy = 40; % Cantidad de divisiones en Y
% 
% %PARA MALLA 6561
% file = 'Malla_6561.txt';
% numx = 80; % Cantidad de divisiones en X
% numy = 80; % Cantidad de divisiones en Y

analysis;

% PLOTEOS
%plotmalla;
% plotVelocity(lenx,numx,leny,numy,u,iel);
%plotStreamlines(lenx,numx,leny,numy,u,nxt,nyt);
% 
%PARA MALLA 441
p = u(883:1282); 

% % %PARA MALLA 1681
%  p = u(3363:4962); 

% %PARA MALLA 6561
% p = u(13123:19522); 

plotPresion(p,xx,conec);