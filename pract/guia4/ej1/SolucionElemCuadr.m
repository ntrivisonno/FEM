function u = SolucionElemCuadr(n,m_dom,s_f)
% function [u,du] = SolucionElemCuadr(n)
% n = cantidad de elementos
% Resolucion   -u" = f(x),  dom(1) <= x <= dom(2)
%              u(dom(1)) = u(dom(2)) = 0
% Elementos finitos cuadr�ticos (funciona para 2 o m�s elementos).
% m_dom: se indica los l�mites del dominio
% s_f: es la fuerza aplicada en simb�lico en funci�n de x.

   %L�mites y Longitud del dominio
   x0 = m_dom(1);
   l = m_dom(2)-x0;
   %Se considera una distribuci�n uniforme de los elementos y del nodo central.
   lIk = l/n; % long del elem

   %Determinaci�n de la funci�n vector de fuerzas
   f_b = f_funVectFzaEl(s_f);

   % inicializacion de matriz de rigidez y vector de cargas globales
   A = zeros(2*n-1,2*n-1);
   b = zeros(2*n-1,1);

   %  lazo sobre los elementos
   for k=1:n

      %coordenadas globales del elemento k
      xk1 = x0+(k-1)*lIk;
      %Se ubica el nodo central en el centro del elemento
      xk2 = xk1+lIk/2;
      xk3 = xk2+lIk/2;

      %hk  = xk-xk1;
      hk = lIk;

      % matriz de rigidez elemental (para el caso de elementos de tramos uniformes)
      Ak = 1/3/hk*[7,-8,1;-8,16,-8;1,-8,7];

      %vector de cargas elemental
      bk = f_b(xk1,xk2,xk3);

      %ensamble de matriz de rigidez
      %No funciona en el caso de tenga 1 solo elemento.
      if k==1
         A(1:2,1:2) = A(1:2,1:2)+Ak(2:3,2:3);
      elseif k==n
         A(end-1:end,end-1:end) = A(end-1:end,end-1:end)+Ak(1:2,1:2);
      else
         A((k-1)*2:k*2,(k-1)*2:k*2) = A((k-1)*2:k*2,(k-1)*2:k*2)+Ak;
      end

      %ensamble de vector de cargas
      if (k==1)
         b(1:2) = b(1:2)+bk(2:3);
      elseif (k==n)
         b(end-1:end) = b(end-1:end)+bk(1:2);
      else
         b((k-1)*2:k*2) = b((k-1)*2:k*2)+bk;
      end

   end

   %solucion sistema de ecuaciones
   u1 = A\b;
   u = [0;u1;0];

end



function f_b = f_funVectFzaEl(s_f)
% Determinaci�n del vector de fuerza elemental
% Devuelve una funci�n que toma por argumento (xk1,xk2,xk3) y devuelve un vector de fuerzas
% m_b: m_b=f_b(xk1,xk2,xk3).

   %Se asume que s_f est� en funci�n de x.
   syms x xk1 xk2 xk3 l1 l2 real

   %Se calcula las longitudes de cada tramo del elemento.
   l1 = xk2-xk1;
   l2 = xk3-xk2;

   %Se transforma la funci�n de fuerza en coordenadas locales (~x).
   s_f = subs(s_f,x,x+xk2);

   sm_b = simplify([1/l1/(l1+l2)*int((-l2*x+x^2)*s_f,x,-l1,l2);...
      int((1+(l2-l1)/l1/l2*x-1/l1/l2*x^2)*s_f,x,-l1,l2);
      1/l2/(l1+l2)*int((l1*x+x^2)*s_f,x,-l1,l2)]);

   f_b = matlabFunction(sm_b,'Vars',{xk1,xk2,xk3});


end

