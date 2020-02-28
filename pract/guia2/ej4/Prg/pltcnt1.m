function pltcnt1 (X,Y,R,V)
%
%  function pltcnt1 (X,Y,R,V)
%     dibuja isocurvas de resultados en un triangulo
%
%  X : vector de coordenadas X (dimension 3)
%  Y : vector de coordenadas Y (dimension 3)
%  R : vector de resultados (dimension 3)
%  V : valores de isocurvas a graficar
%

   [R,index]=sort(R);
   rmin=R(1);
   r2  =R(2);
   rmax=R(3);
   X=X(index);
   Y=Y(index);

   nv=length(V);
   for j=1:nv
     vj=V(j);
     if vj>rmin & vj<rmax
        alfa=(vj-rmin)/(rmax-rmin);
        x1=X(1)+alfa*(X(3)-X(1));
        y1=Y(1)+alfa*(Y(3)-Y(1));
        if V(j)>r2
          alfa=(vj-r2)/(rmax-r2);
          x2=X(2)+alfa*(X(3)-X(2));
          y2=Y(2)+alfa*(Y(3)-Y(2));
        else
          alfa=(vj-rmin)/(r2-rmin);
          x2=X(1)+alfa*(X(2)-X(1));
          y2=Y(1)+alfa*(Y(2)-Y(1));
        end
        plot([x1 x2],[y1 y2],'-b')
     end
   end