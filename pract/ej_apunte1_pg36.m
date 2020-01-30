% ej apunte 1 pg 36,  | con simbolic
%
% NO DA OK, el problema es q calc las matrices con simbolic y desp tengo que evaluarlas, xq sino sumo sym+intenger
%-----------------------------------------
%
%  -u" = sin(pi*x) 
%
%  u(0)=u(1)=0  |  0<=x<=1x  
%-----------------------------------------
n = 8

% inicializacion de matriz de rigidez y vector de cargas globales
%A = zeros(n-1,n-1);
%b = zeros(n-1,1);
A = sym (n-1)
b = sym (n);
b = b (:,1);

for k = 1:n
  syms x x0 x1 phi0 phi1 h intenger

  f = -sin(sym(pi)*x);
  % intervalo
  xk1 = (k-1)*1/n;
  xk  = k*1/n;
  h   = xk-xk1
  
  phi0 = (x - xk)/(xk1-xk);
  phi1 = x/(xk-xk1);

  d_phi0 = diff(phi0,x);
  d_phi1 = diff(phi1,x);

  % matriz elemental
  k11 = int(d_phi0*d_phi0,x,xk1,xk);
  k12 = int(d_phi0*d_phi1,x,xk1,xk);
  k21 = int(d_phi1*d_phi0,x,xk1,xk);
  k22 = int(d_phi1*d_phi1,x,xk1,xk);
 
  Ak = [k11 k12;
	k21 k22];

  % t'ermino independiente
  b11 = [1/(h*pi)*(-xk*cos(pi*xk)-xk1*cos(pi*xk1))+(1/(h*pi))*(sin(pi*xk)-sin(pi*xk1))+1/pi*(cos(pi*xk)-cos(pi*xk1))];
  b21 = [xk/(pi*h)*cos(pi*xk)-xk1/(pi*h)*cos(pi*xk1)-1/(pi*h^2)*(sin(pi*xk)-sin(pi*xk1)) ];

  bk = [b11;
	b21];

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


endfor

