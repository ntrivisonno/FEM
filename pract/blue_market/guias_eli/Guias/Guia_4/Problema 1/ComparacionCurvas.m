%% Gráfica que compara resultados del error
%%Datos
c_NomMatRes = {'VarG1P3Epsi0_01','VarG1P3Epsi1.mat','VarG1P3Epsi10.mat'};
c_Leyenda = {'u (\epsilon = 0.01)','du/dx (\epsilon = 0.01)',...
   'u (\epsilon = 1)','du/dx (\epsilon = 1)',...
   'u (\epsilon = 10)','du/dx (\epsilon = 10)'};

%% Lectura de variables
nArchMat = length(c_NomMatRes);
c_VarLeidas = cell(nArchMat,1);
for iMat = 1:nArchMat
   c_VarLeidas{iMat} = load(c_NomMatRes{iMat});
end

%% Ploteo de los errores
close all
for iMat = 1:nArchMat
   loglog(c_VarLeidas{iMat}.m_LongDiv,[c_VarLeidas{iMat}.m_ErrorL2,c_VarLeidas{iMat}.m_ErrorL2Der])
   %Tiene que estar adentro del for, 
   hold on
end
hold off
grid on
xlabel('Tamaño de los intervalos')
ylabel('Error')
legend(c_Leyenda,'Location','northwest')
