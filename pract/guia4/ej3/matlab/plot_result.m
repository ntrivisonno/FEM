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
R_t_l_mf = [86.4779 97.7497 103.6838 106.0009];   % Resultado_triangular_linea
R_t_l_onate = [93.8 99.1 104.3 106.2 ]
R_t_c_ab = [115.3650 115.8151 116.1151 116.1151]; % Resultado_triangular_cuadratico
R_c_l_ab = [82.661 100.96 105.01 110.71 112.51 113.56]; % Resultado_cuadrang_lineal
R_c_c = [103.45 114.19 115.5 115.91]; % Resultado_cuadrang_cuadratico

x_c_l =[50 80 mesh_GDL];

x = 1:270;
for i=1:270
    exact(i) = 116;
end

if 1
   close all;
  plot(mesh_GDL,R_t_l_mf,'b-^');xlim([0 270]);ylim([80 120]);
  hold on;plot(mesh_GDL,R_t_l_onate,'^-g^');
  plot(x,exact);
  plot(mesh_GDL,R_t_c_ab,'o-^')
  plot(x_c_l,R_c_l_ab,'*m-s')
  plot(mesh_GDL,R_c_c,'p-s')
  kk=legend('triang lineal MatFEM','triang lineal Onate','exacta','triang cuadra Abaqus','cuadrangulo lineal Abaqus','cuadrangulo cuadrat Abaqus')
  set(kk,'Location','SouthEast')

end



