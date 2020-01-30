function [u,du] = ejemplolineal(n)
  % function [u,du] = ejemplolineal(n)
  % n = cantidad de elementos
  % Resolucion   -u" = sin(pi x),  0 <= x <= 1
  %             u(0) = u(1) = 0
  % Elementos finitos lineales
	 
  % inicializacion de matriz de rigidez y vector de cargas globales
  A = zeros(n-1,n-1);
  b = zeros(n-1,1);
  
  %  lazo sobre los elementos
  for k=1:n
      
    %coordenadas del elemento k
    xk1 = (k-1)*1/n;
    xk  =  k   *1/n;
    
    hk  = xk-xk1;
    
    % matriz de rigidez elemental
    Ak = 1/hk* [1  -1;
                -1  1];
    
    %vector de cargas elemental
    bk = [-cos(pi*xk) /pi + (sin(pi*xk)-sin(pi*xk1))/pi^2/hk;
          cos(pi*xk1)/pi - (sin(pi*xk)-sin(pi*xk1))/pi^2/hk];
    
    %ensamble de matriz de rigidez
    if (k==1)
      A(1,1) = A(1,1) + Ak(2,2);
    elseif (k==n)
      A(n-1,n-1) = A(n-1,n-1) + Ak(1,1);
    else
      A(k-1,k-1) = A(k-1,k-1) + Ak(1,1);
      A(k-1,k)   = A(k-1,k)   + Ak(1,2);
      A(k,k-1)   = A(k,k-1)   + Ak(2,1); 
      A(k,k)     = A(k,k)     + Ak(2,2);
    end
    
    %ensamble de vector de cargas
    if (k==1)
      b(1)   = b(1) + bk(2);
    elseif (k==n)
      b(n-1) = b(n-1) + bk(1,1);
    else
      b(k-1) = b(k-1) + bk(1);
      b(k)   = b(k)   + bk(2);
    end
  end
  
  %solucion sistema de ecuaciones
  u1 = A \ b;
  u = [0;u1;0];
  
  %calculo derivada
  du = (u(2:n+1)-u(1:n))/hk;
  du(n+1) = 0;
    
        
