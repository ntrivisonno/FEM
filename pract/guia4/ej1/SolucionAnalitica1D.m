%
% Calculo de solucion analitica de
%               -u'' = f(x)
%              u(-1) = u(1) = 0
%
% con     s_f = (-2/(ee^2))*((x-1)*(exp(-(((x-1)/ee)^2)))-(x+1)*(exp(-(((x+1)/ee)^2))))
%
% Se logran soluciones analiticas en terminos de funcion de error
%

clear
syms f x y z real
syms ee positive
s_f = (-2/(e^2))*((x-1)*(exp(-(((x-1)/e)^2)))-(x+1)*(exp(-(((x+1)/e)^2))));
g2p = -f;
gp = int(g2p,x);
g = int(gp,x);
%
u2p = g2p;
up = gp-1/2*(subs(g,x,1)-subs(g,x,-1));
%Considerando l�mite del dominio [-1,1].
u = int(up)-1/2*(subs(g,x,1)*(x+1)+subs(g,x,-1)*(1-x));
%
% Correccion para introducir condiciones de borde en extremos
%
%uBC = u - subs(u,x,1);

disp ('Termino de carga f(x) = ');
pretty (simplify(u2p))
disp (' ')
disp ('Derivada de la solucion up(x) = ');
pretty (simplify(up))
disp (' ')
disp ('Solucion analitica u(x) = ');
%pretty (simplify(uBC))
pretty (simplify(u))

%
% Valor del parametro e (controla regularidad de la solucion)
% Cuando e --> 0   ==>  se pierde regularidad 
%
eval = 0.01;
%eval = 10.0;

sizeFontB = 20;

%
% Plot de la solucion y sus derivadas para el valor de e elegido
%
figure(1)
ezplot(subs(u2p,e,eval),[-2 2])
axis([-2 2 -2 -exp(-1/eval/eval)])
grid
title  ('');
ylabel ('u2p(x)');
xlabel ('x');
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)

figure(2)
ezplot(subs(up,e,eval),[-2 2])
grid
title  ('');
ylabel ('up(x)');
xlabel ('x');
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)

figure(3)
%ezplot(subs(uBC,e,eval),[-1 1])
ezplot(subs(u,e,eval),[-2 2])
grid
title  ('');
ylabel ('u(x)');
xlabel ('x');
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)

