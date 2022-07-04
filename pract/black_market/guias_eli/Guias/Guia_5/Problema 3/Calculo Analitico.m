%Caluculo de la Temperatura para CB. Neumann
%Por Ley de Fourier tenemos:
q=-K*T=C1*x+C2   (1)

%Si x=3  =>  T=0
0=3*C1+C2 => 3*C1=-C2 (2)

%Si X=0 Sabemos que la derivada de (1) respecto a X es:
q=-K*T=C1=1 =>  C1=1   (3)
%Entonces Reempalazando en (3) en (2)tenemos:
 C2=-3
%Por lo tanto la ecuacion final del problema es:
q=-K*T=C1*x+C2= x-3

%Por lo tanto la temperatura en X=0 Para K=1 tenemos:
Txo=(0-3)/-1=3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Caluculo de la Temperatura para CB. Robin
%Por Ley de Fourier tenemos:
q=-K*T=C1*x+C2   (1)
%Si x=3  =>  T=0
0=3*C1+C2 => 3*C1=-C2 (2)
%Si X=0 Sabemos que la derivada de (1) respecto a X es:
q=-K*T=C1
%Por Condicion de Borde tipo Robin tenemos que:
C1=h*(Txo-Tref)=1*(Txo-10)=Txo-10
C1=Txo-10 (3)
%Por otro lado, evaluando la temperatura en X=0 tenemos:
Txo=C1*0+C2  =>  Txo=C2 (4)
%Entonces reemplazando (3) en (2) tenemos:
3*(Txo-10)=-C2
% Y Sabiendo que Txo=C2 nos queda:
3*(C2-10)=C2
%Depejando C2, podemos calcular C2, C1 y reemplazar en 1:
C2=-7.5
C1=-2.5
q=-K*T=(-2.5x-7.5)
%Como K=1, la temperatura en X=0 es:
T=(-2.5*0-7.5)/-1=7.5

