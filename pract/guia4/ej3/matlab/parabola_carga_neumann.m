% calculo de funcion de carga distribuida parabolica para imposici'ond e cond. de neumann ej3-guia 4
if 0
   % carga para malla_ej3.txt
  y = [0:0.1:1]
  x=-8*(y).^2 + 8*y+3
  plot(y,x,'r');
  
  %calc de integral de parabola
  q=@(y) -8*(y).^2 + 8*y+3
  syms y
  
  q1 = q(0.25);
  q2 = q(0.75);

  l0 = 0
  l1 = 1

  n  = 5 %cant de elem
  dy = (l1-l0)/(n*2);
  n_nod = (l1-l0)/dy;
  y0 = l0
  for i=1:n_nod
    yf = y0 + dy 
    Area(i) = int(q,y,y0,yf)
    y0 = yf;
  end
end

if 1
  % carga para malla_ej3a_140GDL.txt y malla_ej3a_98GDL.txt
  syms y
  q=@(y) -40*y.^2+40*y
  l0 = 0; lf = 1; % ancho viga

  n  = 6 %cant de elem
  dy = (lf-l0)/(n*2);
  n_nod = (lf-l0)/dy;
  y0 = l0
  for i=1:n_nod
    yf = y0 + dy 
    Area(i) = int(q,y,y0,yf)
    y0 = yf;
  end

end

if 0
  % carga para malla_ej3a_216GDL.txt y malla_ej3a_252GDL.txt
  syms y
  q=@(y) -40*y.^2+40*y
  l0 = 0; lf = 1; % ancho viga

  n  = 8 %cant de elem
  dy = (lf-l0)/(n*2);
  n_nod = (lf-l0)/dy;
  y0 = l0
  for i=1:n_nod
    yf = y0 + dy 
    Area(i) = int(q,y,y0,yf)
    y0 = yf;
  end

end



if 0
    A1 = int(q,y,3*dx,1);
    A2 = int(q,y,2*dx,3*dx);
    A3 = int(q,y,dx,2*dx);
    A4 = int(q,y,0,dx);

    % la fuerza de una carga distribuida parab es el 'area de la misma
    F_12 = A1
    F_n8 = A3 + A2
    F_4 = A4
end



if 0
x=[-1:0.1:1];
y=x.^2;
plot(y,x)
end

