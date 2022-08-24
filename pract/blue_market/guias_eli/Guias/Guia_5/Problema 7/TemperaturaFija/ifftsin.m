function u = ifftsin(U)
%
%   Calcula la transformada rapida seno inversa de una secuencia real U_k
%
%   u_j = 1/n * sum_k=2:n  U_k  sin(pi/n (k-1) (j-1))
%
%   U(1) debe ser cero
%
    n           = length(U);
    U1          = [U(1),j*(U(2:n))];
    U1(n+2:2*n) = conj(U1(n:-1:2));
    u1 = ifft(U1);
    u = real(u1(1:n));
    u = -u*sqrt(2/pi)*n;
    