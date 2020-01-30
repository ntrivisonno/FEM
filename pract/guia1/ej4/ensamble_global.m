function [Ag,bg] = ensamble_global (Ae,be,n,GDL_n)
  % funcion de ensamble matriz global
  % Ag = matriz FEM global
  % bg = term ind FEM global
  % Ae = matriz FEM elemental
  % be = term ind FEM elemental
  % n  = cant de elementos
  % GDL_n = grados de libertad de nodos

  nodos_e = 3; % 3 nodos/elem xq elem es cuad
  GDLe = GDL_n*nodos_e;

  Ag = zeros(2*n-1);
  bg = zeros(2*n-1,1);
  %j = 2; % hay que encontrat la ec que vincule el i con el j
 
  for i = 1:n 
    % ensamble matrix global
    if i == 1 
      Ag(1:2,1:2) += Ae(2:end,2:end); 
    elseif i == n %(2*n-1)
      Ag(end-1:end,end-1:end) += Ae(1:2,1:2);
    else
      j = 2*i-2;
      Ag(j:j+2,j:j+2) += Ae(:,:);  
      %Ag(i:i+2,i:i+2) += Ae(:,:);  
      %j += 2;
    endif
  endfor

  for i = 1:n 
    disp('inicia for')
    i
    % ensamble vector carga global
    if i == 1 
      bg(1:2) += be(2:end)
    elseif i == n %(2*n-1)
     bg(end-1:end) += be(1:2)
    else
      disp('cond else')
      i:i+2
      bg(i:i+2) += be(:)  
      i += 2
    endif
    
  endfor


end
