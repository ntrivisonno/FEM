% solucion exacta de la funci'on
%
%        4
%      du              
%     ---- = f(x)   
%        4
%      dx
%
% u: desplazamiento vertical o flecha
% f: carga transversal
clear all;close all

u_exac = @(x,f) (f/24)*x^4 +(-f/6-6)*x^3+(f/12+4)*1/2*x^2
u_exac_s = sym(u_exac); syms x;
a = 0;
b = 1;
x = a:0.1:b;
for i=1:length(x)
    u_e(i) = u_exac(x(i),2);
end
plot(x,u_e)

if 0
  u_exac_seba = @(x,f,h) (f/24)*x^4 -(f*h/6)*x^3+(f*h^2)*1/6*x^2
  u_exac_seba_sym = sym(u_exac_seba); syms x;
  a = 0;
  b = 1;
  x = a:0.1:b;
  
  for i=1:length(x)
    u_e_seba(i) = u_exac_seba(x(i),2);
  end
  figure();plot(x,u_e_seba)
end

if 0
  f=@(x) x;
  f = 1;
end
if 0
  % es para calcular la funcion analitica, pero no evalua bien las ctes
  syms x 
  f_s = sym(f)
  u4 = f
  u3 = int(f_s);
  u2 = int(u3);
  u1 = int(u2);
  u  = int(u1);
  fprintf('La funcion exacta es \n%s \n', char(pretty(u)))
end

if 0
   syms x f
   A = [x^3/6 x^2/2;x^3/6 x^2/2]
   b = [f*x^4/24 ; f*x^4/24]
end
