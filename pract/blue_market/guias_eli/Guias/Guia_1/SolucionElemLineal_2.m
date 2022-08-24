function [u,du] = SolucionElemLineal_2(n,m_dom,s_f)
% function [u,du] = SolucionElemLineal(n)
% n = cantidad de elementos
% Resolucion   -u" = f(x),  dom(1) <= x <= dom(2)
%              u(dom(1)) = u(dom(2)) = 0
% Elementos finitos lineales
% m_dom: se indica los límites del dominio
% s_f: es la fuerza aplicada en simbólico en función de x.

   %Límites y Longitud del dominio
   x0 = m_dom(1);
   l = m_dom(2)-x0;
   lIk = l/n;

   %Determinación de la función vector de fuerzas
   f_b = f_funVectFzaEl(s_f);

   % inicializacion de matriz de rigidez y vector de cargas globales
   %Esto ocupa mucho espacio, para hacer mallas más habría que usar matrices sparse.
   A = zeros(n-1,n-1);
   b = zeros(n-1,1);

   %  lazo sobre los elementos
   for k=1:n

      %coordenadas del elemento k
      xk1 = x0+(k-1)*lIk;
      xk = xk1+lIk;

      %hk  = xk-xk1;
      hk = lIk;

      % matriz de rigidez elemental
      Ak = 1/hk*[1  -1;
         -1  1];

      %vector de cargas elemental
      %      bk = [-cos(pi*xk) /pi + (sin(pi*xk)-sin(pi*xk1))/pi^2/hk;
      %             cos(pi*xk1)/pi - (sin(pi*xk)-sin(pi*xk1))/pi^2/hk];
      bk = f_b(xk,hk);

      %ensamble de matriz de rigidez
      if (k==1)
         A(1,1) = A(1,1)+Ak(2,2);
      elseif (k==n)
         A(n-1,n-1) = A(n-1,n-1) + Ak(1,1);
      else
         A(k-1,k-1) = A(k-1,k-1)+Ak(1,1);
         A(k-1,k) = A(k-1,k)+Ak(1,2);
         A(k,k-1) = A(k,k-1)+Ak(2,1);
         A(k,k) = A(k,k)+Ak(2,2);
      end

      %ensamble de vector de cargas
      if (k==1)
         b(1) = b(1)+bk(2);
      elseif (k==n)
         b(n-1) = b(n-1)+bk(1,1);
      else
         b(k-1) = b(k-1)+bk(1);
         b(k) = b(k)+bk(2);
      end
      
   end

   %solucion sistema de ecuaciones
   u1 = A \ b;
   u = [0;u1;0];

   %calculo derivada
   du = (u(2:n+1)-u(1:n))/hk;
   du(n+1) = 0;

end

function f_b = f_funVectFzaEl(s_f)
% Determinación del vector de fuerza elemental
% Devuelve una función que toma por argumento (xk,hk) y devuelve un vector de fuerzas m_b: m_b=f_b(xk,hk).

   %Se asume que s_f está en función de x.
   syms x hk xk real

   sm_b = simplify(1/hk*[int((xk-x)*s_f,x,xk-hk,xk);int((x-xk+hk)*s_f,x,xk-hk,xk)]);

   f_b = matlabFunction(sm_b,'Vars',{xk,hk});

end