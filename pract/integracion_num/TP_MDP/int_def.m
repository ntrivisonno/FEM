function [i_sym,i_sym_def,i_num] = int_def (f,a,b)
% y_sym:      ley integral symbolic
% y_sym_def:  valor de la integral en forma symbolic
% y_num:      valor de la integral en forma numerica
% 
% f: puntero a funcion
% [a,b]: extremo de integracion
%
  f_sym = sym(f);
  i_sym = int(f_sym);
  i_sym_def = int(f_sym,a,b);
  
  i_num = matlabFunction(i_sym_def);

end
