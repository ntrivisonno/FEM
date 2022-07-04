%%
clear all;clc
close all
tic
%Datos
%m_DivProb = [4,8,16,32,64];
%m_DivProb =  [6,12,24,48,96,192];
m_DivProb = [4,8,16,32,64,128,256,512,1024,2048,4096];
%m_DivProb = [4,8,16,32,64,128,256,512,1024];
%m_DivProb = cumprod(2*ones(15,1))';
%m_DivProb(1) = [];
%m_DivProb = primes(200);
%m_DivProb(1) = [];
%
%Vector de colores
color=['r','[0.2 0.2 0.2]','g','o','y','m','c','[0.5 0.5 0.5]','b','k','[0.8 0.8 0.8]'];
%m_dom = [-1,1]; % dom seba cuad
m_dom = [-2,2]; % dom nico
%m_dom = [0,1];
%ee = 1;
ee = 0.001;
dxExac = 0.00001;
%
grPol = 1;
%grPol = 2;

saveArch = false;
s_NomArchVar = ['VarG1P3Epsi',strrep(num2str(ee),'.','_')];

syms x e real
uExac = (sqrt(pi)*e/2) *(erf(1/e)-erf(3/e)-erf((x-1)/e)+erf((x+1)/e)); 
%uExac = sin(pi*x)/pi^2;
duExac = diff(uExac,x);
s_f = (-2/(e^2))*((x-1)*(exp(-(((x-1)/e)^2)))-(x+1)*(exp(-(((x+1)/e)^2))));


%Reemplazo de e
uExac = subs(uExac,e,ee);
duExac = subs(duExac,e,ee);
s_f = subs(s_f,e,ee); % funcion fuente

%Valores de la soluciï¿½n exacta
xexac = m_dom(1):dxExac:m_dom(2);
f_uFNum = matlabFunction(uExac);
f_duFNum = matlabFunction(duExac);
m_uExac = f_uFNum(xexac);
m_duExac = f_duFNum(xexac);

% maneje para plotear funcion fuente
pp = matlabFunction(s_f); % convertimos el symbolic a handle funcion y ahora es funcion de x f=f(x)
pp2 = pp(xexac); % ahroa tenemos al funcion fuente para graficar
figure(6)
plot(xexac,pp2);
box on;
grid on;
xlabel('x')
ylabel('f(x)')
saveas(gcf,'Variacion de f(x).png')


nProb = length(m_DivProb);
l = m_dom(2)-m_dom(1);
m_Res = cell(nProb,2);
m_ErrorL2 = zeros(nProb,1);
m_ErrorL2Der = zeros(nProb,1);
c_ErrorPr = cell(nProb,1);
c_ResInterElem = cell(nProb,1);

for iPr = 1:nProb % for por la cant de refinamientos
   
   nDiv = m_DivProb(iPr);
   nElem = m_DivProb(iPr)/grPol;
   if rem(nElem,1)
      error('Las divisiones del dominio no son adecuadas para este grado de polinomio.')
   end
   switch grPol
      case 1
         [m_ui,m_dui] = SolucionElemLineal(nElem,m_dom,s_f);         
      case 2
         m_ui = SolucionElemCuadr(nElem,m_dom,s_f);
         m_dui = zeros(size(m_ui));
      otherwise
         error('Solucion de elemento finito no implementado.')
   end
   m_CoordNod = m_dom(1):l/nDiv:m_dom(2);
   [errorL2i,errorL2Deri,m_Error,c_Res] = f_ErrorL2Sol1D(f_uFNum,f_duFNum,m_ui,m_CoordNod,grPol);
   m_ErrorL2(iPr) = errorL2i;
   m_ErrorL2Der(iPr) = errorL2Deri;
   
   c_ResInterElem{iPr} = c_Res;
   if grPol==1
      m_Res{iPr} = [m_CoordNod;m_ui';m_dui'];
   else
      %En el caso del polinomios cuadrï¿½ticos (o mayor) ya no se devuelve un valor de la derivada por
      %elemento (o por nodo inicial del elemento) ya que ya no es constante.
      m_Res{iPr} = [m_CoordNod;m_ui'];
   end
   c_ErrorPr{iPr} = m_Error;
   
end
%
m_LongDiv = l./m_DivProb;

%% Pendiente numï¿½rica de logaritmo del error
m_Pend = diff(log(m_ErrorL2))./diff(log(m_LongDiv'));

%% Grï¿½ficas
%Legenda
s_NroElem = strsplit(num2str(m_DivProb));
%
figure(1)
hold on
box on 
grid on
for iPr = 1:nProb
   if grPol==1
          plot(m_Res{iPr}(1,:),m_Res{iPr}(2,:))
   else
      %Se superpone resultados en los nodos.
      m_ResPr = cat(1,c_ResInterElem{iPr}{:});
            plot(m_ResPr(:,1),m_ResPr(:,2))
   end
end



plot(xexac,m_uExac,'k')
 box on
 grid on
hold off
ylabel ('u(x)');
xlabel ('x');
legend(s_NroElem)
saveas(gcf,'Variacion de u(x).png')

figure(2)
hold on
 box on
 grid on
for iPr = 1:nProb   
   if grPol==1
      stairs(m_Res{iPr}(1,:),m_Res{iPr}(3,:))
   else
      m_ResPr = cat(1,c_ResInterElem{iPr}{:});
      plot(m_ResPr(:,1),m_ResPr(:,3))
   end
end
plot(xexac,m_duExac,'k')
hold off
ylabel ('du(x)/dx');
xlabel ('x');
grid on
legend(s_NroElem)
saveas(gcf,'Variacion de la derivada de u.png')

figure(3)
loglog(m_LongDiv,[m_ErrorL2,m_ErrorL2Der])
grid on
box on
xlabel('Tamaño de los intervalos')
ylabel('Error')
legend({'u','du/dx'},'Location','northwest')
saveas(gcf,'Error-intervalos.png')

figure(4)
hold on
for iPr = 1:nProb
   plot(c_ErrorPr{iPr}(:,1),c_ErrorPr{iPr}(:,2))
end
hold off
grid on
box on
xlabel('x')
ylabel('Error')
legend(s_NroElem)
saveas(gcf,'Error-x.png')

figure(5)
hold on
for iPr = 1:nProb
   plot(m_Pend,'b--o')
end
hold off
grid on
box on
ylabel('Orden del error')
saveas(gcf,'Orden del error.png')

%% Se guarda los resultados para comparar
if saveArch
save(s_NomArchVar,'m_dom','ee','dxExac','grPol','uExac','duExac','s_f',...
   'm_DivProb','m_LongDiv','m_ErrorL2','m_ErrorL2Der','c_ErrorPr','c_ResInterElem')
end

% l = m_dom(2)-m_dom(1);
% n = 4;
% x4 = m_dom(1):l/n:m_dom(2);
% [u4,du4] = SolucionElemLineal(n,m_dom,s_f);
% 
% n = 8;
% x8 = m_dom(1):l/n:m_dom(2);
% [u8,du8] = SolucionElemLineal(n,m_dom,s_f);
% 
% n = 16;
% x16 = m_dom(1):l/n:m_dom(2);
% [u16,du16] = SolucionElemLineal(n,m_dom,s_f);
% 
% n = 32;
% x32 = m_dom(1):l/n:m_dom(2);
% [u32,du32] = SolucionElemLineal(n,m_dom,s_f);
% 
% n = 64;
% x64 = m_dom(1):l/n:m_dom(2);
% [u64,du64] = SolucionElemLineal(n,m_dom,s_f);



% lWidth = 2;
% sizeFontA = 16;
% sizeFontB = 20;
% figure(1)
% plot (x4,u4,'r',x8,u8,'g',x16,u16,'b',x32,u32,'c',xexac,m_uExac,'k','LineWidth', lWidth)
% grid
% ylabel ('u(x)');
% xlabel ('x');
% set(gca,'Fontsize',sizeFontA)
% set(get(gca,'xlab'),'Fontsize',sizeFontB)
% set(get(gca,'ylab'),'Fontsize',sizeFontB)
% set(get(gca,'title'),'Fontsize',sizeFontB)
% 
% 
% figure(2)
% stairs (x4,du4,'r','LineWidth', lWidth)
% hold
% stairs (x8,du8,'g','LineWidth', lWidth)
% stairs (x16,du16,'b','LineWidth', lWidth)
% stairs (x32,du32,'c','LineWidth', lWidth)
% plot   (xexac,m_duExac,'k','LineWidth', lWidth)
% grid
% ylabel ('du/dx');
% xlabel ('x');
% set(gca,'Fontsize',sizeFontA)
% set(get(gca,'xlab'),'Fontsize',sizeFontB)
% set(get(gca,'ylab'),'Fontsize',sizeFontB)
% set(get(gca,'title'),'Fontsize',sizeFontB)
% hold off
% 
% figure(3)
% calcerror (x4, u4, x8, u8, x16, u16, x32, u32, x64, u64, xexac, m_uExac,m_duExac)
% axis equal



toc
