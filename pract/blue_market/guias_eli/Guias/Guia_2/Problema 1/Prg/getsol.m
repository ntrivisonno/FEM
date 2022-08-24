function u = getsol (row,col,sk,fixa,vfix,f)
% funcion u = getsol (S,fixa,vfix,f)
%    row,col,sk : filas, columnas, contenido de matriz de rigidez "rala"
%    fixa:  Lista de grados de libertad fijos
%    vfix:  Valores de fijaciones
%    f:     Vector de cargas
%

    S = sparse(row,col,sk);

    if size(vfix,1)==1
        vfix = vfix';
    end

    f1       = full(S(:,fixa))*vfix;
    f1       = f - f1;
    f1(fixa) = vfix;

    S(:,fixa)    = zeros(size(S,1),length(fixa));
    S(fixa,:)    = zeros(length(fixa),size(S,1));
    S(fixa,fixa) = diag(ones(length(fixa),1));

    u = (S\f1)';

return
