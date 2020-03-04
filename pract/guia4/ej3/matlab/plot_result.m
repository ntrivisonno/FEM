% se plotean los resutlados de MatFEM y Abaqus para distintas mallas y elementos finitos
clear all;close all;clc
if 0
  malla_ej3a_098GDL.txt
  malla_ej3a_140GDL.txt 
  malla_ej3a_216GDL.txt 
  malla_ej3a_252GDL.txt
end

mesh_GDL = [098 140 216 252]
% E = 10000 ; t = 1; P = 6.6658
% uy*E*t/P
R_t_l = [86.4779 97.7497 103.6838 106.0009]; % Resultado_triangular_linea
R_t_c = [115.3650 115.8151 116.1151 116.1151];% Resultado_triangular_cuadratico


x = 1:270;
for i=1:270
    exact(i) = 116;
end

if 1
  plot(mesh_GDL,R_t_l,'*-');xlim([0 270]);ylim([80 120]);
  hold on;plot(x,exact)
  plot(mesh_GDL,R_t_c,'o-')
  legend('triang lineal','exacta','triang cuadra')
end

if 0
   R_t_l_x = zeros(length(x),1)
   R_t_l_x(mesh_GDL')=[R_t_l];

   plot(x,R_t_l_x,'*-',i,exact,'r');xlim([0 270]);ylim([80 120]);


end
