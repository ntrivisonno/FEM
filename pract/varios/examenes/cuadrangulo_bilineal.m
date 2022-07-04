% resolucion de cuadrangulo bilineal
%
%  Enunciado
%  
% 4(-1,1)  _ _ _ 3 (1,1) 
%         |     |  
%         |     |  contamos antihorario 
%         |_    | 
% (-1,-1) |.|_ _|  (1,-1)
%        1       2


% abria que calcularlas como sist de ecuaciones
% respeto dibujo del elem del encabezado
phi1 = 1/4*(1-xi)*(1-eta) % phi1
phi2 = 1/4*(1+xi)*(1-eta) % phi2
phi3 = 1/4*(1+xi)*(1+eta) % phi3
phi4 = 1/4*(1-xi)*(1+eta) % phi4

dphi1_xi = diff(phi1,xi);
dphi2_xi = diff(phi2,xi);
dphi3_xi = diff(phi3,xi);
dphi4_xi = diff(phi4,xi);

dphi1_eta = diff(phi1,eta);
dphi2_eta = diff(phi2,eta);
dphi3_eta = diff(phi3,eta);
dphi4_eta = diff(phi4,eta);
