function [uexac,n,dt,T] = solucionexacta(n,dt,T);

clear uexac

uexac(:,1) = zeros(n,1); uexac(n,1) = 1;

for i=1:T/dt
    uexac(:,i+1) = exacta(n-1,i*dt);
end

% figure('Name','Solucion Exacta');
% grafi (uexac,n,dt,T)
% xlabel('Eje x','FontSize',12)
% ylabel('Tiempo','FontSize',12)
% zlabel('Temperatura','FontSize',12)   
% axis tight
% box on
% set(gca, 'fontsize', 12)
% colormap jet
% colorbar
% saveas(gcf,'Solucion_Exacta.png')
