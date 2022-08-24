%%%Archivo para discretizacion cuadrada para ejercicio 1 de guia 2

clear all
clc

%Asi tenes q escribir para que te genere la malla
%[in,xx,iel,conec] = gen2d3n(lx,numx,ly,numy,file)

%Primer discretizacion de 9 x 9 -Ejercicio1p1
    [in,xx,iel,conec] = gen2d3n(1,9,1,9,'Ejercicio1p1.txt')
    save workspace1
    clear all
%     
% %Segunda discretizacion de 18 x 18 -Ejercicio1p2
 [in,xx,iel,conec] = gen2d3n(1,18,1,18,'Ejercicio1p2.txt')
    save workspace2
    clear all
%     
% %Tercer discretizacion de 36 x 36 -Ejercicio1p3
    [in,xx,iel,conec] = gen2d3n(1,36,1,36,'Ejercicio1p3.txt')
    save workspace3
    clear all
%     
% %Cuarta discretizacion de 72 x 72 -Ejercicio1p4
 [in,xx,iel,conec] = gen2d3n(1,72,1,72,'Ejercicio1p4.txt')
    save workspace4
    
    clear all
    clc