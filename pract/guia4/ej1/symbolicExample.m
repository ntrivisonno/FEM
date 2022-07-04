clear all
close all

syms x e real

%uExac  = e^2/2*(exp(-1/e^2) - exp(-x.^2/e^2)) + sqrt(pi)*e/2*(erf(1/e) - x.*erf(x/e));
uExac = (sqrt(pi)*e/2) *(erf(1/e)-erf(3/e)-erf((x-1)/e)+erf((x+1)/e));
%%
duExac = diff(uExac,x);
dduExac = diff(duExac,x);
%ee = 0.001;
ee = 1;
%xexac = -1:0.001:1;

%uexac2  = ee^2/2*(exp(-1/ee^2) - exp(-xexac.^2/ee^2)) + sqrt(pi)*ee/2*(erf(1/ee) - xexac.*erf(xexac/ee));
uFNum = matlabFunction(uExac);
duFNum = matlabFunction(duExac);
dduFNum = matlabFunction(dduExac);

%duexac = duF(xexac,ee);
%Con la variable x
%limit(duExac,x,0,'left')
%limit(duExac,x,0,'right')
%duFNum(ee,1e-14)
%duFNum(ee,-1e-14)
%duFNum(ee,0)
%double(subs(duExac,{x,e},{1e-14,ee}))
%subs(duExac,{x,e},{0,ee})
%Con la variable ee � e
%duFNum(1e-14,0)
%limit(subs(duExac,x,1),e,0,'Right')
%double(limit(limit(duExac,e,0.0000001,'left'),x,0.0000001,'left'))


figure(1)
%plot(xexac,uexac2,'-b')
ezplot(@(x)uFNum(ee,x),[-2,2])
title('Function')

figure(2)
%plot(xexac,duexac,'-r')
ezplot(@(x)duFNum(ee,x),[-2,2])
title('Derivative')

figure(3)
%plot(xexac,uexac2,'-b')
ezplot(@(x)dduFNum(ee,x),[-2,2])
title('Second Derivate')

%Plot variando ee y x
figure(4)
ezsurf(uFNum,[0,2,-2,2])
title('Function')
%
figure(5)
ezsurf(duFNum,[0,2,-2,2])
title('Derivative')
%view(90,0)
%
figure(6)
ezsurf(dduFNum,[0,2,-2,2],150)
title('Second Derivate')


%du = xexac./exp(xexac.^2/ee^2) - (3991211251234741*ee*(erf(xexac./ee) + (2*xexac)./(pi^(1/2)*ee*exp(xexac.^2/ee^2))))/4503599627370496;