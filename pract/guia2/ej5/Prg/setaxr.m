function setaxr(xx,cseg)
  %
  % function setaxr(xx,cseg)
  %   Determina escala de ejes X,Y de forma de obtener 
  %                una representacion no distorsionada
  %   xx         : Tabla de coordenadas nodales
  %   cseg [0.2] : Factor de agrandamiento de la ventana
  %
  a = max(xx(:,1));
  b = min(xx(:,1));
  c = max(xx(:,2));
  d = min(xx(:,2));
  %
  if nargin==1, cseg=.2; end
  l = (1+cseg)*max([a-b c-d]);
  x = l-(a-b);
  a = a+0.5*x;
  b = b-0.5*x;
  x = l-(c-d);
  c = c+0.5*x;
  d = d-0.5*x;

  %if exist('Window')
  %  bb=b+(Window(1)-Window(3))*(a-b);
  %  aa=b+(Window(1)+Window(3))*(a-b);
  %  dd=d+(Window(2)-Window(3))*(c-d);
  %  cc=d+(Window(2)+Window(3))*(c-d);
  %  a=aa; b=bb; c=cc; d=dd;
  %end

  axis([b a d c])
