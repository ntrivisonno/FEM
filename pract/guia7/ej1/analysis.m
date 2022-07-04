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
%file = 'Malla_441.txt'
file = 'Malla_361.txt'
addpath 'Prg';
%
%   1. Lectura de datos
%
    if exist('file')   
         [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel] = input1 (file);
    else
        display('   Defina el problema a correr ingresando el ');
        display('   nombre del archivo de datos en la variable ''file'' ');
        return
    end
%
    %Ojo con esto!!! Se lo agregue xq me daba fiaca agregarlo como variable
    %en la malla
    %Pero este mu puede tomar cualquier valor. Es un dato del problema
    mu = 0.1;
%   2. Calculo de la matriz de rigidez
%
    if     eltype==1,    %  elemento triangulo lineal conduccion calor
       [row,col,sk] = stiffcur(in,xx,iel,conec,locel,inn,indof,inel,kt);
    elseif (eltype)==5        
       [row,col,sk] = stifftrianisop (in,xx,iel,conec,locel);
    elseif (eltype)==6        
       [row,col,sk] = stiffquad (in,xx,iel,conec,locel,kt);
     elseif (eltype)==7     
       [row,col,sk] = stiffcurStokes (in,xx,iel,conec,locel,mu,inn,indof,inel);
       
       
       %%Este stiffcur lo hice para poder aplicar regiones con multiples
       %%coneficiente de conductividad
       %[row,col,sk] = stiffcurejer5 (in,xx,iel,conec,locel,inn,indof,inel,kt); 
    end

%   3. Imposicion de condiciones de borde Dirichlet, Neumann y Robin y solucion

    u = getsol(row,col,sk,fixa,vfix,f);
    
%    u = getsol (row,col,sk,fixa,vfix,f,qnode,qneu,enconec,inn,xx,hpel,tfl,ronode,qrob,robconec);