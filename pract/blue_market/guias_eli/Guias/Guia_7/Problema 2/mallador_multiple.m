%%%Archivo para discretizacion cuadrada para ejercicio 1 de guia 2

clear all
clc

%function [xy,conec] = gen2d4n(lx,ly,nx,ny,file)
%Asi tenes q escribir para que te genere la malla

%Primer discretizacion de 20 x 20 -Ejercicio1p1
    [xy,conec] = gen2d4n(1,1,20,20,'Ejercicio2p1.txt')
    save workspace1
    clear all
%     
% %Segunda discretizacion de 40 x 40 -Ejercicio1p2
   [xy,conec] = gen2d4n(1,1,40,40,'Ejercicio2p2.txt')
    save workspace2
    clear all
%     
% %Tercer discretizacion de 80 x 80 -Ejercicio1p3
    [xy,conec] = gen2d4n(1,1,80,80,'Ejercicio2p3.txt')
    save workspace3
    clear all
% %     
% % %Tercer discretizacion de 80 x 80 -Ejercicio1p3
%     [xy,conec] = gen2d4n(1,10,1,10,'Ejercicio2p4.txt')
%     save workspace4
%     clear all
% % %     

% % %Cuarta discretizacion de 72 x 72 -Ejercicio1p4
%  [in,xx,iel,conec] = gen2d3n(1,72,1,72,'Ejercicio1p4.txt')
%     save workspace4
%     
    clear all
    clc