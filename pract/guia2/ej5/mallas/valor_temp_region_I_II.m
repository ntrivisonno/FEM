% Script que toma los valores sobre la l'inea I-II
% valor temp, siempre para x = 2 -> x=x(2,y).
% los valores se escrben a pata, resultado de correr el script analysis para cada malla.
clear all; close all

y1 = linspace(0,4,5);
t1 = [6.978 6.529 5.8 6.381 9.164];
y2 = linspace(0,4,9);
t2 = [7.13 6.906 6.667 6.337 5.742 5.708 6.266 7.374 9.085];
y3 = linspace(0,4,13);
t3 = [7.015 6.88 6.741 6.591 6.421 6.215 5.963 5.861 5.872 6.264 6.961 8.016 10.43];
y4 = linspace(0,4,17);


plot(y1,t1,y2,t2,'*-r',y3,t3,'o-k');title('Temperatura sobre region I-II');ylabel('u');xlabel('x(2,y)')
legend('malla 5x4','malla10x8','malla15x12')

print -dpng ~/Documents/CIMEC/Cursos/FEM/pract/guia2/ej5/figuras/temp_I_II.png
