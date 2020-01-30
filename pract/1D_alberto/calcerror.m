function calcerror (x4, u4, x8, u8, x16, u16, x32, u32, x64, u64, xexac, uexac, duexac)
%
% Calcula error en la funcion y en la derivada mediante evaluacion de la 
% norma de la diferencia entre la solucion exacta y la solucion elementos finitos. 
% Utiliza mkpp que permite construir polinomios por tramos 
%

nexac = length(xexac);

n4  = length(x4); %mkpp-> evalua un pol cont definido por partes
pp4 = mkpp(x4',[(u4(2:n4)-u4(1:n4-1))./(x4(2:n4)-x4(1:n4-1))' , u4(1:n4-1)]); 
er4 = norm(uexac - ppval(pp4,xexac))/sqrt(nexac);

n8  = length(x8);
pp8 = mkpp(x8',[(u8(2:n8)-u8(1:n8-1))./(x8(2:n8)-x8(1:n8-1))' , u8(1:n8-1)]); 
er8 = norm(uexac - ppval(pp8,xexac))/sqrt(nexac);

n16  = length(x16);
pp16 = mkpp(x16',[(u16(2:n16)-u16(1:n16-1))./(x16(2:n16)-x16(1:n16-1))' , u16(1:n16-1)]); 
er16 = norm(uexac - ppval(pp16,xexac))/sqrt(nexac);

n32  = length(x32);
pp32 = mkpp(x32',[(u32(2:n32)-u32(1:n32-1))./(x32(2:n32)-x32(1:n32-1))' , u32(1:n32-1)]); 
er32 = norm(uexac - ppval(pp32,xexac))/sqrt(nexac);

n64  = length(x64);
pp64 = mkpp(x64',[(u64(2:n64)-u64(1:n64-1))./(x64(2:n64)-x64(1:n64-1))' , u64(1:n64-1)]); 
er64 = norm(uexac - ppval(pp64,xexac))/sqrt(nexac);


n4  = length(x4);
pp4 = mkpp(x4',[(u4(2:n4)-u4(1:n4-1))./(x4(2:n4)-x4(1:n4-1))']); 
erd4 = norm(duexac - ppval(pp4,xexac))/sqrt(nexac);

n8  = length(x8);
pp8 = mkpp(x8',[(u8(2:n8)-u8(1:n8-1))./(x8(2:n8)-x8(1:n8-1))' ]); 
erd8 = norm(duexac - ppval(pp8,xexac))/sqrt(nexac);

n16  = length(x16);
pp16 = mkpp(x16',[(u16(2:n16)-u16(1:n16-1))./(x16(2:n16)-x16(1:n16-1))']); 
erd16 = norm(duexac - ppval(pp16,xexac))/sqrt(nexac);

n32  = length(x32);
pp32 = mkpp(x32',[(u32(2:n32)-u32(1:n32-1))./(x32(2:n32)-x32(1:n32-1))']); 
erd32 = norm(duexac - ppval(pp32,xexac))/sqrt(nexac);

n64  = length(x64);
pp64 = mkpp(x64',[(u64(2:n64)-u64(1:n64-1))./(x64(2:n64)-x64(1:n64-1))']); 
erd64 = norm(duexac - ppval(pp64,xexac))/sqrt(nexac);


lWidth = 2;
sizeFontA = 16;
sizeFontB = 20;
loglog([1/n64 1/n32 1/n16 1/n8 1/n4],[er64 er32 er16 er8 er4],'k-', ...
       [1/n64 1/n32 1/n16 1/n8 1/n4],[erd64 erd32 erd16 erd8 erd4],'r-', 'LineWidth', lWidth)
grid
ylabel ('Error u, du/dx');
xlabel ('h');
set(gca,'Fontsize',sizeFontA)
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)
