function [x,u] = convecciondifusion (n, eps)
%
%  resuelve conveccion difusion unidimensional en el [0,1]
%
%   -eps u_xx + u_x = 0    0 < x < 1
%
%    u(0) = 1
%    u(1) = 0
%
    h = 1/(n-1);
    for i=1:n
        if(i>1) 
            K(i,i-1) = -eps/h^2 - 1/2/h;
        end
        K(i,i)       = 2*eps/h^2;
        if(i<n) 
            K(i,i+1) = -eps/h^2 + 1/2/h;
        end
    end
    
    S = K(2:n-1,2:n-1);
    f = -K(2:n-1,1);
    v = S\f;
    x = [0:h:1];
    u = [1; v; 0];

    xex = [0:eps/20:1];
    uex = (1-exp((xex-1)/eps))/(1-exp(-1/eps));
   
    plot(x,u,'b',xex,uex,'r')
    
        