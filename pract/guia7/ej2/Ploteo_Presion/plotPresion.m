function plotPresion(p, xx, conec)
%solo válido para el elemento Q1-P0
%p: vector con presiones
%xx: coordenadas nodos malla
%conec: conectividades

figure
pe = zeros(size(conec,1),4);
for i=1:size(conec,1)
    pe(i,:)=[p(i),p(i),p(i),p(i)];
end
X=[xx(conec(:,1),1),xx(conec(:,2),1),xx(conec(:,3),1),xx(conec(:,4),1)];
Y=[xx(conec(:,1),2),xx(conec(:,2),2),xx(conec(:,3),2),xx(conec(:,4),2)];
axis equal

for i=1:size(pe,1)
    patch(X(i,:),Y(i,:),pe(i,:))
end
colorbar
print('presion.png' , '-dpng');

%surf(X,Y,pe)