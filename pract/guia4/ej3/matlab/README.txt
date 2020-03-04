
# para pasar .m a vtu
# previo haber corrido analysis

SOL = struct('Name','U','Type','PointData','NumberOfComponents',3,'Value',u)
mtl2vtu('pp.vtu',xx,struct('Connectivity',conec,'Type','HEXA8'),u)


mallas:
Se generaron 4 mallas, y para automatizar mejor, se mantuvo dos veces la cantidad de elementos en y, de esta forma, se calculo la par'abola de cargas solo 2 veces.

[in,xx,iel,conec]=gen2d3n(3,6,1,6,'mallas/malla_ej3a_098GDL.txt')  -> 7 nodos, 6 elem x 7 nodos, 6 elem x   -> 098GDL
[in,xx,iel,conec]=gen2d3n(3,9,1,6,'mallas/malla_ej3a_140GDL.txt')  -> 10 nodos, 9 elem x 7 nodos, 6 elem x  -> 140GDL
[in,xx,iel,conec]=gen2d3n(3,11,1,8,'mallas/malla_ej3a_216GDL.txt') -> 12 nodos, 11 elem x 9 nodos, 8 elem x -> 216GDL
[in,xx,iel,conec]=gen2d3n(3,13,1,8,'mallas/malla_ej3a_252GDL.txt') -> 14 nodos, 13 elem x 9 nodos, 8 elem x -> 252GDL


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
malla_ej3a_0g098GDL.txt
n_central = 28 | ux(55)  = 1.3288e-12 | uy(56)  = 0.0792 | uy*E*t/P = 118.8154
malla_ej3a_140GDL.txt 
n_central = 40 | ux(79)  =  | uy(80)  =  | uy*E*t/P = 
malla_ej3a_216GDL.txt 
n_central = 60 | ux(119) =  | uy(120) =  | uy*E*t/P = 
malla_ej3a_252GDL.txt
n_central = 70 | ux(139) =  | uy(140) =  | uy*E*t/P =  


Frente a los valores del nodo central, lo afectamos por uy*E*t/P. De esta forma adimensionalizamos el resultado y de esta manera podemos comparar con el valor anal'itico de 116, independientemente del material


