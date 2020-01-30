
T = 4.;
K = rigidez (n);
M = masa (n);

clear ucn

ucn(:,1) = zeros(n,1); ucn(n,1) = 1;

K1 = K(2:n-1,2:n-1);
M1 = M(2:n-1,2:n-1);

f = -K(2:n-1,n)*ucn(n,1);

A = inv (M1 + dt*K1/2);

for i=1:T/dt
    ucn(2:n-1,i+1) = A*(dt*f + (M1-dt/2*K1)*ucn(2:n-1,i));
    ucn(1,i+1) = 0;
    ucn(n,i+1) = 1;
end

figure('Name','Crank Nicolson');
grafi (ucn,n,dt,T)
