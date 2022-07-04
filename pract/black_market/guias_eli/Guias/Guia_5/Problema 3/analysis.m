%
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
clear all
clc
file = 'file_malla_Iso_b.txt'

addpath 'Prg';
%
%   1. Lectura de datos
%
 if exist(file)
        [in,xx,iel,conec,fixa,vfix,locel,ndn,eltype,f,inn,indof,inel,Vect_Mat,Kt,Elem_Neumann,Elem_Robin,Mat_Nod_Neu,h_rob,t_ref,Num_Nod_Neu] = input1(file);
    else
        display('   Defina el problema a correr ingresando el ');
        display('   nombre del archivo de datos en la variable ''file'' ');
        return
    end
%
%   2. Calculo de la matriz de rigidez
%
    if     eltype==1,    %  elemento triangulo lineal conduccion calor
       [row,col,sk,MR_s,qrob,qneu_s] = stiffcur(in,xx,iel,conec,locel,inn,indof,inel,Vect_Mat,Kt,Elem_Neumann,Elem_Robin,Mat_Nod_Neu,h_rob,t_ref,Num_Nod_Neu);
    
    else eltype=5;  %Elemento triangular isoparametrico
        [row,col,sk,MR_s,qrob,qneu_s] = stifftrianisop (in,xx,iel,conec,locel,inn,indof,inel,Vect_Mat,Kt,Elem_Neumann,Elem_Robin,Mat_Nod_Neu,h_rob,t_ref,Num_Nod_Neu);
    end
    
%
%   3. Imposicion de condiciones de borde Dirichlet y solucion
%
    u = getsol(row,col,sk,fixa,vfix,f,MR_s,qrob,qneu_s);
    
