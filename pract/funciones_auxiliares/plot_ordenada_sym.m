function [] = plot_ordenada_sym(phi_s,var_s,x_s,x_n,nfig)
% funcion que dado una funcion y un valor, plotea una linea desde esa x hasta el valor de la funcion
%
% phi_s:   funcion a evaluar (symbolic)          - ej: phi = x^2-h
% var_s: variable independiente a evaluar (sym)  - ej: var_s = x
% x_s:     valor de la variable ind (symbolic)   - ej: x_s = 2*h
% x_num: valor de la variable ind (double)       - ej: x_n = 2
% nfig:  # de figura
%
% plot_ordenada_sym(phi2,x,h,1,4)
%
  y = subs(phi_s,var_s,x_s)
  y = matlabFunction(y); % si hacemos double(y), eliminar este renglo
  y_num = y(1); % ver de hacer y_num = double(y) 
  figure(nfig)
  hold on
  line([x_n,x_n],[0,y_num]);

end
