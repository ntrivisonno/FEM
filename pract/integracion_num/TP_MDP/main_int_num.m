% Ejercicio TP MDP - 1D
% Integrador 1D: integra funciones en simbolico y compara con regla del trapecio
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
% Ejemplo 1:  
%
%     ⎛π⋅x⎞
%  cos⎜───⎟   [-1,1]
%     ⎝ 2 ⎠
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
if 0
  % funciones
  f = @(x) cos(pi*x/2)  % x [-1,1]
  f = @(x) x^2+x^3      % x [-1,1]
  f = @(x) 1/x          % x [1,7]
  f = @(x) x^3+2*x^2    % x [1,5]
  f = @(x) 3*x^4+2*x^2  % x [-1,1]
  f = @(x) exp(x)*sin(x)/(1+x^2)  % [0,3]
end
% pegar funcion
f = @(x) 1/x          % x [1,7]


% intervalo
x0 = 1;
xf = 7; 
 
[y0,y1,y2] = int_def(f,x0,xf); 
[y_trap] = trap (f,x0,xf,1);
[y_simp] = simpson_tercio (f,x0,xf,1);

%desp borrar, para ver funciones e integrales def
syms x
f_sym = sym(f);
i_sym = int(f_sym);


fprintf('**Integral Symbolic\n%s\n**Valor Integral:\n%d\n**intervalo:\nx0 = %d \nXf = %d \n\n',char(pretty((y1))),y2(0),x0,xf)

fprintf('- - - -\nComparacion integral Exacta, Numerica y Trapecio:\n*Exacta:\n%s\n*Valor Exacta:\n%s\n*Valor Exacta:\n%d\nTrapecio Simple:\n%d\nSimpson Simple:\n%d\n',char(pretty(y0)),char(pretty(y1)),y2(0),y_trap,y_simp)
