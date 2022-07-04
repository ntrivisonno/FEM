function U = fftsin(u)
%
%   Calcula la transformada rapida seno de una secuencia real u_k
%
%   U_j = sum_k=1:n  u_k  sin(pi/n (k-1) (j-1))    (verificar expresion !!!)
%
%   u(1) debe ser cero
%
    n = length(u);
    u1 = [0,u(2:n),0,-u(n:-1:2)];
    U1 = fft(u1);
    U(1)   = 0;
    U(2:n) = imag(U1(2:n));
    U      = -U*sqrt(pi/2)/n;
    