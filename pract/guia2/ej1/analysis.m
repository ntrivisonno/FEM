% usar matlab, no octave 
%   Archivo script : secuencia de llamados para resolucion
%                    de un problema de elementos finitos
%
%   Datos:  
%
%       file: nombre del archivo de datos a leer (ej. 'toto.txt')
%
%   Lista de variables:
%
%   in:    lista de numeros de nodos
%   xx:    tabla de coordenadas
%   iel:   lista de numeros de elementos
%   conec: tabla de conectividades nodales
%   locel: tabla de vectores de localizacion
%   fixa:  lista de grados de libertad fijos
%   vfix:  valores de las fijaciones
%   f:     vector de cargas nodales
%   [row,col,sk]: lista de contribuciones a la matriz de rigidez 
%                 organizada en forma sparse (fila,columna,termino)
%   u:     vector solucion
%
%clear all;close all;clc
tStart = tic;
addpath '~/Documents/CIMEC/Cursos/FEM/pract/guia2/ej1/Prg';
addpath '~/Documents/CIMEC/Cursos/FEM/pract/guia2/ej1/mallas';
%file ='malla5x5.txt' % ir cambiando los nombres para las demas mallas
%file ='malla10x10.txt'
file ='malla20x20.txt'
%file ='malla40x40.txt'
%
%   1. Lectura de datos
%
    if exist('file')  % le paso el txt de la malla
        [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel] = input1(file);
    else
        display('   Defina el problema a correr ingresando el ');
        display('   nombre del archivo de datos en la variable ''file'' ');
        return
    end
%
%   2. Calculo de la matriz de rigidez
%
    if     eltype==1,    %  elemento triangulo lineal conduccion calor
       [row,col,sk] = stiffcur(in,xx,iel,conec,locel,inn,indof,inel);
    end
%
%   3. Imposicion de condiciones de borde Dirichlet y solucion
%
    [u,S] = getsol(row,col,sk,fixa,vfix,f);
    
time = toc(tStart);
fprintf('*-----------------------------------------------*\n')
fprintf('\n\nFIN! - OK - time = %d[s].\n',time)
