syms x1 x2 x3 a1 a2 a3 real
% @q(x) a*x.^2+b*x
% p = a*x.^2+b*x+c
if 0
  %p(0) = 0
  %p(3) = 0
  %p(1.5) = 2 % valor de q

  A = [x1^2 x1 1;
       x2^2 x2 1;
       x3^2 x3 1];
  
  coef = [a1 a2 a3]';
  ANum = subs(A,{x1,x2,x3},{0,3,3/2});
  %q = [0 3 1.5]
  %coef = A\
  inv_ANum = inv(ANum);
  p2 = [x^2 ; x ; 1];
  
  f = inv_ANum' * p2
end

if 0
  % malla_ej2.txt
  % ley de carga distribuida
  % este ejemplo daba bien en algunos y mal en otros xq era gruesa la malla
  q=@(x) -0.88*x.^2 + 2.66*x;
  
  syms x 
  
  l0 = 0
  l1 = 3
  
  n  = 4 %cant de elem
  dx = (l1-l0)/(n*2);
  n_nod = (l1-l0)/dx;
  x0 = l0
  for i=1:n_nod
    xf = x0 + dx 
    Area(i) = int(q,x,x0,xf)
    x0 = xf;
  end

end

if 1
  clear all; clc; close all
  tStart = tic;
  %ejemplo malla_ej2_v2.txt
  a = -4.4444
  b =  13.333

  % malla_ej2_v2.txt
  % ley de carga distribuida, al ejemplo anterior se le aument'o la carga y adem'as se le puso mas nodos
  q=@(x) -4.444 * x .^ 2 + 13.333 * x
  
  syms x 
  
  l0 = 0;
  l1 = 3;
  
  n  = 4 %cant de elem
  dx = (l1-l0)/(n*2);
  n_nod = (l1-l0)/dx;
  x0 = l0;
  for i=1:n_nod
    xf = x0 + dx;
    Area(i) = int(q,x,x0,xf);
    x0 = xf;
  end

  fprintf('El resultado de la integral Area:,\n%s \n', char(pretty(Area)))%escribimos simbolic

  time = toc(tStart);
  fprintf('*-----------------------------------------------*\n')
  fprintf('\n\nFIN! - OK - time = %d[s].\n',time)

end
