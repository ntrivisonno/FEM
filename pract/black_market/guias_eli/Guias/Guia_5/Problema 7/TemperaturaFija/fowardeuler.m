function [uex,n,dt,T] = fowardeuler (n,dt,T)

K = rigidez (n);
M = masa (n);

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

u = uex;
% figure('Name','Foward Euler');
% grafi (uex,n,dt,T)
% xlabel('Eje x','FontSize',12)
% ylabel('Tiempo','FontSize',12)
% zlabel('Temperatura','FontSize',12)   
% axis tight
% set(gca, 'fontsize', 12)
% colormap jet
% colorbar
% saveas(gcf,'FE.png')


