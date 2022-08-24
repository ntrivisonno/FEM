

function [x,u,xex,uex] = convecciondifusion (n, eps1,h,eps)
%
%  resuelve conveccion difusion unidimensional en el [0,1]
%
%   -eps u_xx + u_x = 0    0 < x < 1
%
%    u(0) = 1
%    u(1) = 0
%

K=zeros(n,n);
    
    for i=1:n
        if(i>1) 
            K(i,i-1) = -eps1/h - 1/2;
        end
        if (i==1)
            K(i,i) = eps1/h-1/2;
        elseif (i==n)
            K(i,i)= eps1/h+1/2;
        else
             K(i,i)= 2*eps1/h;
        if(i<n) 
            K(i,i+1) = -eps1/h + 1/2;
        end
    end
    
    S = K(2:n-1,2:n-1);
    f = -K(2:n-1,1);
    v = S\f;
    x = [0:h:1];
    u = [1; v; 0];

    xex = [0:eps/20:1];
    uex = (1-exp((xex-1)/eps))/(1-exp(-1/eps));  %Solucion Exacta
   
    %plot(x,u,'b',xex,uex,'r')
    
    end
