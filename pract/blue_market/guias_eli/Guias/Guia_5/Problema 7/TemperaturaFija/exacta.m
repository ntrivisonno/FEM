function u = exacta (n,t)
%  u = exacta (n,t)
%  calcula la solucion por serie de Fourier al problema
%
%     du/dt - d2u/dx2 = 0     0<x<pi          (1)
%
%     u(0,t) = 0
%     u(pi,t) = 1
%
%     u(x,0) = 0            0<x<pi
%
%     calcula la solucion al instante t en n puntos equiespaciados
%

%     Sea:
%
%     ubar = u - x/pi
%
%     Luego, el problema es equivalente a resolver (1) con condiciones
%     de borde homogeneas y condicion inicial:
%
%     ubar(x,0) = -x/pi
%

    L = pi;

    u0 = -[0:n-1]/n;
    u0f = fftsin(u0);

    uf = u0f .* exp(-(pi/L*[0:n-1]).^2 * t);
    ubar = (ifftsin(uf));
    
    u = ubar - u0;
    u(n+1) = 1;
    
