clear all; clc
syms x y z f Ak bk xk xk1 real
syms eps real positive
u2p = -exp(-x*x/eps/eps);
up  = int(u2p);
u   = int(up);
disp('la función u generica')
pretty(u)

up_v1  = int(u2p,x,xk,xk1);
u_v1   = int(up,x,xk,xk1);
disp('la función u definida')
pretty(u_v1)
