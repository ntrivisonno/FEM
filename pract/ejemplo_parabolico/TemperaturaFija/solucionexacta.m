T = 4.;

clear uexac

uexac(:,1) = zeros(n,1); uexac(n,1) = 1;

for i=1:T/dt
    uexac(:,i+1) = exacta(n-1,i*dt);
end

figure('Name','Solucion Exacta');
grafi (uexac,n,dt,T)
