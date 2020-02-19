%%
clear all;clc
close all
tic
%Datos
m_DivProb = [4,8,16,32,64];
%m_DivProb = [4,8,16,32,64,128,256,512,1024,2048,4096];
%m_DivProb = [4,8,16,32,64,128,256,512,1024];
%m_DivProb = cumprod(2*ones(15,1))';
%m_DivProb(1) = [];
%m_DivProb = primes(200);
%m_DivProb(1) = [];
%
%m_dom = [-1,1]; % dom seba cuad
m_dom = [-2,2]; % dom nico
%m_dom = [0,1];
%ee = 1;
ee = 0.01;
dxExac = 0.00001;
%
%grPol = 1;
grPol = 2;

saveArch = false;
s_NomArchVar = ['VarG1P3Epsi',strrep(num2str(ee),'.','_')];

syms x e real
uExac = e^2/2*(exp(-1/e^2) - exp(-x.^2/e^2)) + sqrt(pi)*e/2*(erf(1/e) - x.*erf(x/e));
%uExac = sin(pi*x)/pi^2;
duExac = diff(uExac,x);
s_f = exp(-x*x/e/e);
%s_f = sin(pi*x);

%Reemplazo de e
uExac = subs(uExac,e,ee);
duExac = subs(duExac,e,ee);
s_f = subs(s_f,e,ee);

%Valores de la soluci�n exacta
xexac = m_dom(1):dxExac:m_dom(2);
f_uFNum = matlabFunction(uExac);
f_duFNum = matlabFunction(duExac);
m_uExac = f_uFNum(xexac);
m_duExac = f_duFNum(xexac);

nProb = length(m_DivProb);
l = m_dom(2)-m_dom(1);
m_Res = cell(nProb,2);
m_ErrorL2 = zeros(nProb,1);
m_ErrorL2Der = zeros(nProb,1);
c_ErrorPr = cell(nProb,1);
c_ResInterElem = cell(nProb,1);
for iPr = 1:nProb
   
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
         error('Soluci�n de elemento finito no implementado.')
   end
   m_CoordNod = m_dom(1):l/nDiv:m_dom(2);
   [errorL2i,errorL2Deri,m_Error,c_Res] = f_ErrorL2Sol1D(f_uFNum,f_duFNum,m_ui,m_CoordNod,grPol);
   m_ErrorL2(iPr) = errorL2i;
   m_ErrorL2Der(iPr) = errorL2Deri;
   
   c_ResInterElem{iPr} = c_Res;
   if grPol==1
      m_Res{iPr} = [m_CoordNod;m_ui';m_dui'];
   else
      %En el caso del polinomios cuadr�ticos (o mayor) ya no se devuelve un valor de la derivada por
      %elemento (o por nodo inicial del elemento) ya que ya no es constante.
      m_Res{iPr} = [m_CoordNod;m_ui'];
   end
   c_ErrorPr{iPr} = m_Error;
   
end
%
m_LongDiv = l./m_DivProb;

%% Pendiente num�rica de logaritmo del error
m_Pend = diff(log(m_ErrorL2))./diff(log(m_LongDiv'));

%% Gr�ficas
%Legenda
s_NroElem = strsplit(num2str(m_DivProb));
%
figure(1)
hold on
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
hold off
ylabel ('u(x)');
xlabel ('x');
grid on
legend(s_NroElem)

figure(2)
hold on
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

figure(3)
loglog(m_LongDiv,[m_ErrorL2,m_ErrorL2Der])
grid on
xlabel('Tama�o de los intervalos')
ylabel('Error')
legend({'u','du/dx'})

figure(4)
hold on
for iPr = 1:nProb
   plot(c_ErrorPr{iPr}(:,1),c_ErrorPr{iPr}(:,2))
end
hold off
grid on
xlabel('x')
ylabel('Error')
legend(s_NroElem)

figure(5)
hold on
for iPr = 1:nProb
   plot(m_Pend,'o-','MarkerFaceColor','b')
end
hold off
grid on
ylabel('Orden del error')

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
