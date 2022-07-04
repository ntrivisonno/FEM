function K = rigidez(n)
%
% K = function rigidez(n)
% 
% calcula la matriz de rigidez para transmision de calor
% en una barra de longitud pi, con (n-1) elementos iguales
%

n1 = n-1;
for i=1:n
    K(i,i) = 2*n1/pi;
    if (i<n) 
        K(i,i+1) = -n1/pi;
        K(i+1,i) = -n1/pi;
    end
end
K(1,1) = n1/pi;
K(n,n) = n1/pi;
