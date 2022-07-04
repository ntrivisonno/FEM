%Dari

% Problema Parabolico Unidimensional

clear all

% n: Cantidad de nodos
% L: Longitud del dominio
% h: Tamano del intervalo espacial
% T: Tiempo de simulacion
% dt: Paso de tiempo
% TT: Tiempo hasta donde hago la corrida

   n = 33;
   T = 4;
   dt = 0.1;
   L = pi;
   h = L /(n-1);
   TT = 4

% for dt = 1e-3:0.00005:1.7e-3;
  
    %Resolucion mediante Crank Nicolson 
    [u,n,dt,T] = cranknicolson (n,dt,T);
    grafi(u,n,dt,T);
    ucn = u;
    %Resolucion mediante Backward Euler
    [u,n,dt,T] = backeuler (n,dt,T);
    grafi(u,n,dt,T);
    ube = u;
    %Resolucion mediante Foward Euler
    [u,n,dt,T] = fowardeuler (n,dt,T);
    %grafi(u,n,dt,T);

    %Calculo de la solucion exacta para una posicion dada
    %t: tiempo donde quiero la solucion exacta
    t = 0;
    ne= n-1;
    %[uexac] = exacta (ne,t);

    i = 0;
    for t = 0:dt:TT;
        i = i + 1;
       [uexac] = exacta (ne,t);
       uexac2(i) = uexac(32);  
    end
    
    %Calculo del error
     nex = nex + 1; 
     ufinal = u(:,end)';
     error(nex) = norm(uexac-ufinal)/sqrt(n-1);
     
  end

  %Grafico el error para un paso espacial constante
     dt = (1e-3:0.00005:1.7e-3)
     fig = figure(1)
     semilogy(dt,error,'-b',dt,error,'bs','LineWidth',2)
     ylabel ('Error');
     xlabel ('Tiempo');
     sizeFontA = 8;
     sizeFontB = 8;
     set(gca,'Fontsize',sizeFontA)
     set(get(gca,'xlab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
     set(get(gca,'ylab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
     grid on
     
     print(fig,'Ejercicio7','-dpng')
 
 %Ploteo la solucion para tres paso de tiempo
      
      dtt = [0:dt:TT]';
      fig = figure(2);
      y1 = ucn(32,1:((TT/dt)+1))' ;
      y2 = ube(32,1:((TT/dt)+1))';
      plot(dtt,y1,'-b',dtt,y2,'r',dtt,uexac2,'m','LineWidth',2)
      ylabel ('Temperatura');
      xlabel ('Tiempo');
      sizeFontA = 8;
      sizeFontB = 8;
      set(gca,'Fontsize',sizeFontA)
      set(get(gca,'xlab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
      set(get(gca,'ylab'),'Fontsize',sizeFontB,'FontWeight','bold','Color','k')
      grid on