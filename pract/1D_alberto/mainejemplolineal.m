clear 

x4 = [0:1/4:1];
[u4,du4] = ejemplolineal(4);

x8 = [0:1/8:1];
[u8,du8] = ejemplolineal(8);
    
x16 = [0:1/16:1];
[u16,du16] = ejemplolineal(16);

x32 = [0:1/32:1];
[u32,du32] = ejemplolineal(32);

x64 = [0:1/64:1];
[u64,du64] = ejemplolineal(64);

xexac = [0:0.001:1];
uexac  = sin(pi*xexac)/pi/pi; % func exacta
duexac = cos(pi*xexac)/pi;    % derivada func exacta

lWidth = 2;
sizeFontA = 16;
sizeFontB = 20;
figure(1)
plot (x4,u4,'r',x8,u8,'g',x16,u16,'b',x32,u32,'c',xexac,uexac,'k','LineWidth', lWidth)
grid
ylabel ('u(x)');
xlabel ('x');
set(gca,'Fontsize',sizeFontA)
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)
    
    
figure(2)
stairs (x4,du4,'r','LineWidth', lWidth)
hold
stairs (x8,du8,'g','LineWidth', lWidth)
stairs (x16,du16,'b','LineWidth', lWidth)
stairs (x32,du32,'c','LineWidth', lWidth)
plot   (xexac,duexac,'k','LineWidth', lWidth)
grid
ylabel ('du/dx');
xlabel ('x');
set(gca,'Fontsize',sizeFontA)
set(get(gca,'xlab'),'Fontsize',sizeFontB)
set(get(gca,'ylab'),'Fontsize',sizeFontB)
set(get(gca,'title'),'Fontsize',sizeFontB)
hold off

figure(3)
calcerror (x4, u4, x8, u8, x16, u16, x32, u32, x64, u64, xexac, uexac, duexac)
