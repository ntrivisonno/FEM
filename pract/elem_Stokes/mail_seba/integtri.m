function [xG, yG, weight] = integtri (ipg, x1, y1, x2, y2, x3, y3, npgtri)

% calcula puntos de Gauss y pesos para integracion en triangulo 2D
% npgtri: # de ptos de gauss
% ipg: variable donde comienza el loop de integracion


if (npgtri==1)
    xpg = [1/3, 1/3, 1/3];
    xw  = 1;
elseif (npgtri==3)
    xpg = [1/2, 1/2,   0;
           0,   1/2, 1/2;
           1/2,   0, 1/2];
    xw  = [1/3; 1/3; 1/3];
elseif (npgtri==4)
    xpg = [1/3, 1/3, 1/3;
           0.6, 0.2, 0.2;
           0.2, 0.6, 0.2;
           0.2, 0.2, 0.6];
    xw  = [-27/48;
           25/48;
           25/48;
           25/48];
elseif (npgtri==7)
  alfa1 = 0.0597158717;
  beta1 = 0.4701420641;
  alfa2 = 0.7974269853;
  beta2 = 0.1012865073;

  xpg = [1/3, 1/3, 1/3;
         alfa1, beta1, beta1;
         beta1, alfa1, beta1;
         beta1, beta1, alfa1;
         alfa2, beta2, beta2;
         beta2, alfa2, beta2;
         beta2, beta2, alfa2];
  xw  = [0.2250000000;
         0.1323941527;
         0.1323941527;
         0.1323941527;
         0.1259391805;
         0.1259391805;
         0.1259391805];
else
  disp ('Error - numero de puntos de Gauss incorrecto');
  return;
end

xG     = xpg(ipg,1)*x1 + xpg(ipg,2)*x2 + xpg(ipg,3)*x3;
yG     = xpg(ipg,1)*y1 + xpg(ipg,2)*y2 + xpg(ipg,3)*y3;
weight = xw(ipg);

