
T = 4;
K = rigidez (n);
M = masa (n);

clear ube

ube(:,1) = zeros(n,1); ube(n,1) = 1;

K1 = K(2:n-1,2:n-1);
M1 = M(2:n-1,2:n-1);

f = -K(2:n-1,n)*ube(n,1);

A = inv (M1 + dt*K1);

for i=1:T/dt
    ube(2:n-1,i+1) = A*(dt*f + M1*ube(2:n-1,i));
    ube(1,i+1) = 0;
    ube(n,i+1) = 1;
end

figure('Name','Backward Euler');
grafi (ube,n,dt,T)