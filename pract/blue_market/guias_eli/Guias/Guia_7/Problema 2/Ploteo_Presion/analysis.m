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
file = 'Malla_441.txt'
addpath 'Prg';
%
%   1. Lectura de datos
%
    if exist('file')
        %[in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,inn,indof,inel] = input1(file);
        
        [in,xx,iel,conec,fixa,vfix,f,locel,ndn,eltype,t,inn,indof,inel] = input1_Sebas (file);
    else
        display('   Defina el problema a correr ingresando el ');
        display('   nombre del archivo de datos en la variable ''file'' ');
        return
    end
%
%   2. Calculo de la matriz de rigidez
%
    if     eltype==5,    %  elemento cuadrangulo bilineal mixto isoparametrico Stokes
       %%[row,col,sk] = stiffcur(in,xx,iel,conec,locel,inn,indof,inel);
       
       mu=0.1;
       [row,col,sk] = stiffcurQ1P0 (in,xx,iel,conec,locel,mu); %Sttiffcur para Q1P0
       
    end
%
%   3. Imposicion de condiciones de borde Dirichlet y solucion

       
    u = getsol(row,col,sk,fixa,vfix,f);
    
    %Capturando solo los valores de la VELOCIDAD.

% veloc = u([3:6:end;2:6:end]);
% veloc(2,:) = -veloc(2,:);
% veloc = veloc(:)';
 
veloc = u(1:ndn*size(xx,1));
p=u(ndn*size(xx,1)+1:end);

lenx=1;
leny=1;

numx=20;
numy=20;

% %  numx=40;
% %  numy=40;
%  
%   numx=80;
%  numy=80;

%Para plotear Lineas de Corriente:

 %plotStreamlines(lenx,numx,leny,numy,veloc)
 
 %Para plotear las componentes de la Velocidad:
 
% plotVelocity(lenx,numx,leny,numy,veloc)
    
%Para plotear la Presion:

plotPresion(p, xx, conec)
