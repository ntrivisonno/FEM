
# para pasar .m a vtu
# previo haber corrido analysis

SOL = struct('Name','U','Type','PointData','NumberOfComponents',3,'Value',u)
mtl2vtu('pp.vtu',xx,struct('Connectivity',conec,'Type','HEXA8'),u)

para plotear la deformada

$ a=50;pp=a*reshape(u',2,[])'+xx(:,1:2);close all;pltmsh3(in,pp,iel,conec);print -dpng figs/fig.png

mallas:
Se generaron 4 mallas, y para automatizar mejor, se mantuvo dos veces la cantidad de elementos en y, de esta forma, se calculo la par'abola de cargas solo 2 veces.

[in,xx,iel,conec]=gen2d3n(3,6,1,6,'mallas/malla_ej3a_098GDL.txt')  -> 7 nodos, 6 elem x 7 nodos, 6 elem x   -> 098GDL
[in,xx,iel,conec]=gen2d3n(3,9,1,6,'mallas/malla_ej3a_140GDL.txt')  -> 10 nodos, 9 elem x 7 nodos, 6 elem x  -> 140GDL
[in,xx,iel,conec]=gen2d3n(3,11,1,8,'mallas/malla_ej3a_216GDL.txt') -> 12 nodos, 11 elem x 9 nodos, 8 elem x -> 216GDL
[in,xx,iel,conec]=gen2d3n(3,13,1,8,'mallas/malla_ej3a_252GDL.txt') -> 14 nodos, 13 elem x 9 nodos, 8 elem x -> 252GDL
% al usar elementos con m'as GDL/elem, debemos disminuir la cant de elementos xq sino se dispara el # de GDL, para eso, para el elem cuadratico cuadratico, usamos:
una malla de 1x6 (1 elem en x) y 6 elem en y 66 GDL 
una malla de 2x6 (2 elem en x) y 6 elem en y 106 GDL
una malla de 3x6 (3 elem en x) y 6 elem en y 146 GDL
una malla de 4x6 (4 elem en x) y 6 elem en y 186 GDL

Para las dos primeras, se calcula la carga como el archivo parabola_carga_neumann.m 
ver flag  % carga para malla_ej3a_140GDL.txt y malla_ej3a_98GDL.txt
checkiarmos que la suma de las cargas sea igual a la integral de la funcion de 0a1
sum = 0;
for i=1:length(Area)
    sum += Area(i)
end
Area_tot = int(q,y,0,1)
- ver flag   % carga para malla_ej3a_216GDL.txt y malla_ej3a_252GDL.txt
checkiarmos que la suma de las cargas sea igual a la integral de la funcion de 0a1
sum = 0;
for i=1:length(Area)
    sum += Area(i)
end
Area_tot = int(q,y,0,1) = 6.6658

% nodos centrales y desplazamientos

% MatFEM | triangular lineal -> 3 nodos 6 GDL
malla_ej3a_098GDL.txt
n_central = 28 | ux(55)  = -8.0782e-05 | uy(56)  = 0.0576 | uy*E*t/P = 86.4779
malla_ej3a_140GDL.txt 
n_central = 40 | ux(79)  = -6.6838e-05 | uy(80)  = 0.0652 | uy*E*t/P = 97.7497
malla_ej3a_216GDL.txt 
n_central = 60 | ux(119) = -4.5567e-05 | uy(120) = 0.0691 | uy*E*t/P = 103.6838
malla_ej3a_252GDL.txt
n_central = 70 | ux(139) = -4.0876e-05 | uy(140) = 0.0707 | uy*E*t/P = 106.0009

% Abaqus | triang cuad -> 6 nodos 18 GDL (ojo, capaz q libro mla escrito, no son 12 GDL???)
malla_ej3a_0g098GDL.txt
n_central = 28 | ux(55)  = 1.0276e-5 | uy(56)  = 0.0769 | uy*E*t/P = 115.3650
malla_ej3a_140GDL.txt 
n_central = 40 | ux(79)  = 6.7461e-6 | uy(80)  = 0.0772 | uy*E*t/P = 115.8151
malla_ej3a_216GDL.txt 
n_central = 60 | ux(119) = 5.4553e-6 | uy(120) = 0.0774 | uy*E*t/P = 116.1151
malla_ej3a_252GDL.txt
n_central = 70 | ux(139) = 5.0288e-6 | uy(140) = 0.0774 | uy*E*t/P = 116.1151 

% Abaqus | cuad lineal -> 4 nodos 8 GDL
malla 50 GDL -> 6x3 elem
n_central = 28 | ux()  = -3.0114e-13| uy() = 0.0551 | uy*E*t/P = 82.661
malla 80 GDL -> 6x4 elem
n_central = 28 | ux()  = 0.015700   | uy() = 0.0673 | uy*E*t/P = 100.96
malla_ej3a_0g098GDL.txt
n_central = 28 | ux()  = 8.1376e-13 | uy() = 0.0700 | uy*E*t/P = 105.01
malla_ej3a_140GDL.txt 
n_central = 40 | ux()  = 1.7024e-7  | uy() = 0.0738 | uy*E*t/P = 110.71
malla_ej3a_216GDL.txt 
n_central = 60 | ux() = 7.1424e-17  | uy() = 0.0750 | uy*E*t/P = 112.51 
malla_ej3a_252GDL.txt
n_central = 70 | ux() = -4.4721e-17 | uy() = 0.0757 | uy*E*t/P = 113.56

% Abaqus | cuad cuad -> 8 nodos 16 GDL
malla 66 
n_central = 8 | ux()  = 2.1100e-11 | uy() = 0.06896   | uy*E*t/P = 103.45
malla 106 
n_central = 12 | ux() = 2.3400e-11 | uy() = 0.0761199 | uy*E*t/P = 114.19
malla 146
n_central = 16 | ux() = 1.8590e-11 | uy() = 0.07699   | uy*E*t/P = 115.5
malla 186
n_central = 20 | ux() = 1.7500e-11 | uy() = 0.07726   | uy*E*t/P = 115.91

Frente a los valores del nodo central, lo afectamos por uy*E*t/P. De esta forma adimensionalizamos el resultado y de esta manera podemos comparar con el valor anal'itico de 116, independientemente del material


