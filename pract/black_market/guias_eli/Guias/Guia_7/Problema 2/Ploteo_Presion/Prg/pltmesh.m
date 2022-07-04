function pltmesh(in,xx,iel,conec,u)

A = xx;
X = A(:,1)
Y = A(:,2)

B = u
Z = B(1,:)'
% [X,Y] = meshgrid(-8:.5:8);
% R = sqrt(X.^2 + Y.^2) + eps;
% Z = sin(R)./R;
% C = del2(Z);
% 
% figure
 %mesh(X,Y,Z,C,'FaceLighting','gouraud','LineWidth',0.3)
 plot3(X,Y,Z)