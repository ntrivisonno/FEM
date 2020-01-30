
T = 4;
K = rigidez (n);
M = masa (n);

MM = sum(M);
M  = diag(MM);

clear uex

uex(:,1) = zeros(n,1); uex(n,1) = 1;

K1 = K(2:n-1,2:n-1);
M1 = M(2:n-1,2:n-1);

f = -K(2:n-1,n)*uex(n,1);

A = eye(n-2) - inv(M1)*K1*dt;
f1 = inv(M1)*f*dt;

for i=1:T/dt
    uex(2:n-1,i+1) = A*uex(2:n-1,i) + f1;
    uex(1,i+1) = 0;
    uex(n,i+1) = 1;
end

figure('Name','Explicito Diagonal');
grafi (uex,n,dt,T)