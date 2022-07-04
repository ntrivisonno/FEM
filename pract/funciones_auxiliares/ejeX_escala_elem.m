% incluimos texto dentro de la graf [0 h 2h]
str = '0';
text(0.02,-0.05,str,'Interpreter','latex')
str = 'h';
text(1,-0.05,str,'Interpreter','latex')
if 0
% ej4
str = '2 h';
text(1.9,-0.05,str,'Interpreter','latex')
end
if 1
% ej5
str = '2 h';
text(2,-0.05,str,'Interpreter','latex')
end
str = '3 h';
text(2.88,-0.05,str,'Interpreter','latex')

xL = xlim;
line(xL, [0 0]);  % x-axis


if 0
% script para plotear lineas de ejes
xL = xlim;
yL = ylim;
line([0 0], yL);  % y-axis
line(xL, [0 0]);  % x-axis
end
