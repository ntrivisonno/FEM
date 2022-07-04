% integral doble symbolic
syms x y F

F = x*y;

p = int(F,x,0,10);
pp = int(p,y,0,5);
