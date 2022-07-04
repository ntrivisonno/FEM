function [x1_num,f_forma_num]=f_forma(phi,a,b,n)
% construccion de funcion de forma, y posible ploteo
% phi: func forma - class sym - debe tener a las 'x' como var ind
% a: posici'on inicial, intervalo elemental
% b: long del intervalor elemental
% n: cant de nodos del elemento
% 
% [x1_num_1,f_forma_num_1] = f_forma(phi1,0,2);
%
  syms h x;
  h_num = b-a; 
 % dx = h_num/(n-1)

  x1 = a:0.1:b;
  x1 = x1*h;
  for i=1:length(x1)
      pp(i)=subs(phi,x,x1(i));
  end

  f_forma = matlabFunction(pp);
  f_forma_num = f_forma(1);

  x1_num = matlabFunction(x1);
  x1_num = x1_num(1);
%  plot(x1_num,f_forma_num);

end
