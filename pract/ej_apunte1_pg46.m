% ej apunte 1 pg 46, idem ej pg 36 pero con elem cuadrat | con simbolic
%
% NO DA OK, el problema es q calc las matrices con simbolic y desp tengo que evaluarlas, xq sino sumo sym+intenger
%-----------------------------------------
%
%  -u" = sin(pi*x) 
%
%  u(0)=u(1)=0  |  0<=x<=1x  
%-----------------------------------------
n = 4

% inicializacion de matriz de rigidez y vector de cargas globales
A = zeros(n-1,n-1);
b = zeros(n-1,1);
syms x h

for k = 1:n
    h = 1/(2*n);
    
    % coord del elem k
    xk0 = (2*k-2)*h;
    xk1 = (2*k-2)*h;
    xk2 = 2*k*h;

    phi0p = (2*x-2*h-h)/((-h)*(-2*h));
    phi1p = (2*x-2*h)/(h*(-h));
    phi2p = (2*x-h)/((2*h)*(h));
    
    A00 = int(phi0p*phi0p,0,2*h);
    A01 = int(phi0p*phi1p,0,2*h);
    A02 = int(phi0p*phi2p,0,2*h);
    A11 = int(phi1p*phi1p,0,2*h);
    A12 = int(phi1p*phi2p,0,2*h);
    A22 = int(phi2p*phi2p,0,2*h);
    % es simetrica, asiq usamos los elem anteriores
    Ak = [A00 A01 A02;
	  A01 A11 A12;
	  A02 A12 A22];
    
    % term dereho
    %phi0 =[]; 
    %b0 = int(f*phi0,0,2*h);
    %bk = [];
    
endfor

if 0
   Ak_apunt = 1/(6*h)*[ 7 -8 1;
		       -8 16 -8
		        1 -8 7 ];
endif
