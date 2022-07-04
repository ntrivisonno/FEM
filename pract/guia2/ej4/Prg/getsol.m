function u = getsol (row,col,sk,fixa,vfix,f,MR_s,qrob,qneu_s)
% funcion u = getsol (S,fixa,vfix,f)
%    row,col,sk : filas, columnas, contenido de matriz de rigidez "rala"
%    fixa:  Lista de grados de libertad fijos
%    vfix:  Valores de fijaciones
%    f:     Vector de cargas
%   MR_s: Matriz de rigidez por CB de Robin
%   qrod= Vector de Cargas por CB de Robin
    
    S = sparse(row,col,sk);
    S = S+MR_s;  %Se suma la matriz de rigidez por CB de Robin
    

    if size(vfix,1)==1
        vfix = vfix';
    end

    f1       = full(S(:,fixa))*vfix;
    f1       = f - f1 + qneu_s + qrob;    %Se suman las cargas de Neumann y Robin
    f1(fixa) = vfix;

    S(:,fixa)    = zeros(size(S,1),length(fixa));
    S(fixa,:)    = zeros(length(fixa),size(S,1));
    S(fixa,fixa) = diag(ones(length(fixa),1));

    u = (S\f1)';

return
