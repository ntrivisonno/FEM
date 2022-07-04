% levantamos los datos de resultados.txt
% ploteo desplazamientos ux, uy

clear all;close all
nodos = [21:25];
uxm = [-1.86e-4;-6.32e-5;-2.68e-5;-8.31e-5;-1.14e-5]; % desplazamiento Ux matalab
uym = [-2.89e-4;-5.68e-4;-7.30e-4;-5.76e-4;-2.84e-4];
uxa = [-0.89e-4;-0.30e-5;-2.41e-5;-1.74e-5;-1.51e-5];
uya = [ -3.23e-4;-6.65e-4;-8.57e-4;-6.71e-4;-3.10e-4];
plot(nodos,uxm,nodos,uxa);legend('Octave','Abaqus');xlabel('Nodos');ylabel('Ux');title('Desplazamientos X');print -dpng Figures/desplazamientos_x.png;
figure();plot(nodos,uym,nodos,uya);legend('Octave','Abaqus');xlabel('Nodos');ylabel('Uy');title('Desplazamientos Y');print -dpng Figures/desplazamientos_y.png
