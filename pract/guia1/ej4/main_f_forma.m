% prog p plotear funciones de forma elem
% previamente se deben correr ej4..etc para cargar las funciones de forma en symbolic -> phi1,phi2,phi3...
clc;close all;tic 
% como es p2
addpath('~/Documents/CIMEC/Cursos/FEM/pract/funciones_auxiliares/')
b = 2;
[x1_num_1,f_forma_num_1] = f_forma(phi1,0,2);
[x1_num_2,f_forma_num_2] = f_forma(phi2,0,2);
[x1_num_3,f_forma_num_3] = f_forma(phi3,0,2);

% figure(1) - figura elem con todas funciones de forma 
figure(1)
plot(x1_num_1,f_forma_num_1,x1_num_2,f_forma_num_2,'r',x1_num_3,f_forma_num_3,'c');title('Funciones de forma cuadraticas - Elem long 2\cdot h, con h = 1');ylim([-0.2 1.2]);legend('phi_1','phi_2','phi_3')
ejeX_escala_elem % incluimos ejes y letras al graf
print -dpng Figs/ej4_funciones_forma_elem_cuadrat.png

% figure(2) -figura funcion base
o1 = linspace(-4,-2,20);
o2 = -o1;

f_base = [zeros(20,1)' f_forma_num_3 f_forma_num_1   zeros(20,1)'];
x_base = [o1 x1_num_1-2 x1_num_1 o2];
%figure();plot(x1_num_1,f_forma_num_1,'b',x1_num_3-2,f_forma_num_3,'b')
figure(2);plot(x_base,f_base);title('Funcion base cuadratica - Elem long 2\cdot h, con h = 1');ylim([-0.2 1.2])
print -dpng Figs/ej4_funcion_base_elem_cuadrat.png

% figura phi_1
figure(3)
plot(x1_num_1,f_forma_num_1);title('Funciones de forma cuadraticas Phi_1 - Elem long 2\cdot h, con h = 1');ylim([-0.2 1.2]);line([0,b],[0,0]);
ejeX_escala_elem % incluimos ejes y letras al graf
print -dpng Figs/ej4_funciones_forma_elem_phi_1.png

% figura phi_2
figure(4)
plot(x1_num_2,f_forma_num_2);title('Funciones de forma cuadraticas Phi_2 - Elem long 2\cdot h, con h = 1');ylim([-0.2 1.2]);line([0,b],[0,0]);
ejeX_escala_elem % incluimos ejes y letras al graf
plot_ordenada_sym(phi2,x,h,1,4)
print -dpng Figs/ej4_funciones_forma_elem_phi_2.png

% figura phi_3
figure(5)
plot(x1_num_3,f_forma_num_3);title('Funciones de forma cuadraticas Phi_3 - Elem long 2\cdot h, con h = 1');ylim([-0.2 1.2]);line([0,b],[0,0]);
ejeX_escala_elem % incluimos ejes y letras al graf
print -dpng Figs/ej4_funciones_forma_elem_phi_3.png

toc
fprintf('\n\nFIN! - prog OK - time = %d[s]\n',toc)

