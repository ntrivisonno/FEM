function M = masa(n)
%
% M = function masa(n)
% 
% calcula la matriz de masas para transmision de calor
% en una barra de longitud pi, con (n-1) elementos iguales
%

n1 = n-1;
for i=1:n
    M(i,i) = 2/3*pi/n1;
    if (i<n) 
        M(i,i+1) = 1/6*pi/n1;
        M(i+1,i) = 1/6*pi/n1;
    end
end
M(1,1) = 1/3*pi/n1;
M(n,n) = 1/3*pi/n1;