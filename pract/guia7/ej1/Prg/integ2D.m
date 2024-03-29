function [xi, eta, weight] = integ2D (ipg, npgxi, npgeta)

% calcula puntos de Gauss y pesos para integracion en cuadrangulo 2D
xpg = [ 0                   0                  0                  0                 ;
       -1/sqrt(3)           1/sqrt(3)          0.                 0.                ;
       -sqrt(0.6)           0.                 sqrt(0.6)          0.                ;
       -0.861136311594953  -0.339981043584856  0.339981043584856  0.861136311594953   ];

xw  = [ 2.                  0.                 0.                 0.                ;
        1.                  1.                 0.                 0.                ;
        5./9.               8./9.              5./9.              0.                ;
        0.347854845137454   0.652145154862546  0.652145154862546  0.347854845137454   ];

%ipgxi  = rem  ((ipg-1),npgxi) + 1;    
ipgeta = floor((ipg-1)/npgxi) + 1;    
ipgxi  = rem  ((ipg+ipgeta),npgxi) + 1;

xi     = xpg(npgxi, ipgxi );
eta    = xpg(npgeta,ipgeta);
weight = xw(npgxi, ipgxi )*xw(npgeta,ipgeta);
