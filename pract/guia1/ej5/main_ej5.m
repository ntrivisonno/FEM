% FEM - ejercio 5 - guia1
clear all;close all;tic
f_forma_ej5 % cargamos las funciones de forma elementales

% cargamos el path de la funcion f_forma
addpath('~/Documents/CIMEC/Cursos/FEM/pract/funciones_auxiliares/')
n = 4; % no se usa

[x1_num_1,f_forma_num_1]=f_forma(phi1,0,3,n);
[x1_num_2,f_forma_num_2]=f_forma(phi2,0,3,n);
[x1_num_3,f_forma_num_3]=f_forma(phi3,0,3,n);
[x1_num_4,f_forma_num_4]=f_forma(phi4,0,3,n);

% figure(1) - figura elem con todas funciones de forma 
figure(1)
plot(x1_num_1,f_forma_num_1,x1_num_2,f_forma_num_2,'r',x1_num_3,f_forma_num_3,'m',x1_num_4,f_forma_num_4,'g');title('Funciones de forma cubica - Elem long 3\cdot h, con h = 1');ylim([-0.4 1.2]);legend('phi_1','phi_2','phi_3','phi_4')
ejeX_escala_elem % incluimos ejes y letras al graf
print -dpng Figs/ej5_funciones_forma_elem_cubica.png


% figure(2) - figura con funciones bases
figure(2)
% 1er funcion base - phi1 y phi4
% construimos un vector de 0 para motrar mejor la func base
pp = 3:0.1:5;
l_pp = length(pp);
y_pp = zeros(l_pp,1);
subplot(2,1,1),plot(x1_num_1,f_forma_num_1,'b',-x1_num_1,f_forma_num_1,'b',-pp,y_pp,'b',pp,y_pp,'b');xlim([-5 5]);title('Funcion Base \varphi_1')
% 2da func base - hacer coincidir la cresta (=1) de phi 2 y phi3
% hacer
subplot(2,1,2);title('Funcion Base \varphi_2')
print -dpng Figs/ej5_funciones_base.png

% figura phi_1
figure(3)
plot(x1_num_1,f_forma_num_1);title('Funciones de forma cubica \varphi_1 - Elem long 3\cdot h, con h = 1');ylim([-0.4 1.2])
ejeX_escala_elem % incluimos ejes y letras al graf
print -dpng Figs/ej5_funciones_forma_elem_phi_1.png

% figura phi_2
figure(4)
plot(x1_num_2,f_forma_num_2);title('Funciones de forma cubica \varphi_2 - Elem long 3\cdot h, con h = 1');ylim([-0.4 1.2]);
ejeX_escala_elem % incluimos ejes y letras al graf
plot_ordenada_sym(phi2,x,h,1,4)
print -dpng Figs/ej5_funciones_forma_elem_phi_2.png


% figura phi_3
figure(5)
plot(x1_num_3,f_forma_num_3);title('Funciones de forma cubica \varphi_3 - Elem long 3\cdot h, con h = 1');ylim([-0.4 1.2]);
ejeX_escala_elem % incluimos ejes y letras al graf
plot_ordenada_sym(phi3,x,2*h,2,5)
print -dpng Figs/ej5_funciones_forma_elem_phi_3.png

% figura phi_4
figure(6)
plot(x1_num_4,f_forma_num_4);title('Funciones de forma cubica \varphi_4 - Elem long 3\cdot h, con h = 1');ylim([-0.4 1.2]);
ejeX_escala_elem % incluimos ejes y letras al graf
print -dpng Figs/ej5_funciones_forma_elem_phi_4.png

syms f
tf = f;
tfs = sym(tf)
[Ae,be]=matrix_elem(phi1,phi2,phi3,phi4,x,3*h,tfs);
fprintf('La matriz elemental es:\n%s\n',char(pretty(Ae)))
fprintf('El termino ind es:\n%s\n',char(pretty(be)))



%-----------------------------------
% ensamble global, a partir de la matriz elemental symbolic
n = 4; %cant de elem
m = 2*(n+1);
Ag = zeros(m);
Ag = sym(Ag);
for i=1:n
    k = (i-1)+i;
    Ag([k:k+3],[k:k+length(Ae)-1])+=Ae;
%    fprintf('Elem %d, (%d,%d)\n',i,k,k+3)
end
fprintf('El sistema Global queda:\n%s\n',char(pretty(Ag)))
bg = zeros(m,1);
bg = sym(bg);
for i=1:n
    k = (i-1)+i;
    bg([k:k+3])+=be;
end
fprintf('El t. fuente Global queda:\n%s\n',char(pretty(bg)))
%-----------------------------------

toc;
time=toc;
fprintf('\n\nFIN! - prog OK - time = %d[s]\n',time)


