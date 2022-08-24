function grafi (u,n,dt,T)
%
%   function grafi (u,n,dt)
%

x = [0:pi/(n-1):pi]'*ones(1,T/dt+1);
y = ones(n,1)*[0:dt:T];
meshc(x,y,u,y);