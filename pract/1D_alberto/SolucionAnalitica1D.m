%
% Calculo de solucion analitica de
%               -u'' = f(x)
%              u(-1) = u(1) = 0
%
% con     f(x) = -exp(x^2/eps^2)  (funcion de Gauss)
%
% Se logran soluciones analiticas en terminos de funcion de error
%

clear
syms x y z real
syms eps real positive
u2p = -exp(-x*x/eps/eps);
up  = int(u2p);
u   = int(up);
%
% Correccion para introducir condiciones de borde en extremos
%
uBC = u - subs(u,x,1);

disp ('Termino de carga f(x) = ');
pretty (simplify(u2p))
disp (' ')
disp ('Derivada de la solucion up(x) = ');
pretty (simplify(up))
disp (' ')
disp ('Solucion analitica u(x) = ');
pretty (simplify(uBC))

%
% Valor del parametro eps (controla regularidad de la solucion)
% Cuando eps --> 0   ==>  se pierde regularidad 
%
epsval = 10.;

sizeFontB = 20;

%
% Plot de la solucion y sus derivadas para el valor de eps elegido
%
figure(1)
ezplot(subs(u2p,eps,epsval),[-1 1])
axis([-1 1 -1 -exp(-1/epsval/epsval)])
grid
title  ('');
ylabel ('u2p(x)');
xlabel ('x');
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)

figure(2)
ezplot(subs(up,eps,epsval),[-1 1])
grid
title  ('');
ylabel ('up(x)');
xlabel ('x');
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)

figure(3)
ezplot(subs(uBC,eps,epsval),[-1 1])
grid
title  ('');
ylabel ('u(x)');
xlabel ('x');
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)

