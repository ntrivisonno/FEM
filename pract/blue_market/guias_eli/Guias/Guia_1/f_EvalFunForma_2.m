function [m_Pol,m_DerPol] = f_EvalFunForma_2(m_uNod,m_xNod,m_xEval)

   %Se evalúa las funciones de forma de cualquier grado de polinomio en las coordenadas m_xEval.

   nNodElem = length(m_uNod);
   grPol = nNodElem-1;
   nPuntCalc = length(m_xEval);
   %Resta de las coordenadas para el denominador de cada función de forma.
   %m_DenLag = prod(reshape(nonzeros(bsxfun(@minus,m_xNod,m_xNod')'),2,3),2)';     %Se asume que m_xNod es un vector de columnas (se hace operaciones innecesarias).
   m_DifCoord = zeros(nNodElem,grPol);
   for iNod = 1:grPol
      
      m_DifCoordiNod = m_xNod(iNod)-m_xNod(iNod+1:end);
      m_DifCoord(iNod,iNod:end) = m_DifCoordiNod;
      m_DifCoord(iNod+1:end,iNod) = -m_DifCoordiNod;
      
   end
   m_DifCoordProd = prod(m_DifCoord,2);
   %Se asegura que sea un vector columna.
   m_xEval = m_xEval(:);
   %Se asegura que se un vector fila
   m_xNod = m_xNod(:)';
   %Resta de coordenadas del numerador 
   m_DifCoord = bsxfun(@minus,m_xEval,m_xNod);
   
   %Sumatoria del aporte de cada función de forma al polinomio aproximante.
   m_Pol = zeros(nPuntCalc,1);
   for iNod = 1:nNodElem
      
      %Se podría evitar cálculo almacenando grupo de productos en común que se usa en las diferentes funciones
      %de forma.
      m_ProdiNod = prod(m_DifCoord(:,[1:iNod-1,iNod+1:nNodElem]),2);
      m_Pol = m_Pol+m_uNod(iNod)*m_ProdiNod/m_DifCoordProd(iNod);
      
   end
   
   %Sumatoria del aporte de cada función de forma a la derivada del polinomio aproximante.
   m_DerPol = zeros(nPuntCalc,1);
   for iNod = 1:nNodElem
      
      %m_DerPol = m_DerPol+m_valPoliNod.*sum(1./m_DifCoord(:,[1:iNod-1,iNod+1:nNodElem]),2);  %En algunos casos puede quedar 0/0.
      m_DifiNod = m_DifCoord(:,[1:iNod-1,iNod+1:nNodElem]);
      m_sumProdParc = zeros(nPuntCalc,1);
      %Muchas operaciones innecesarias.
      for iSum = 1:size(m_DifiNod,2)
         
         m_DifiNodiSum = m_DifiNod;
         m_DifiNodiSum(:,iSum) = [];
         m_sumProdParc = m_sumProdParc+ones(nPuntCalc,1).*prod(m_DifiNodiSum,2);
         
      end
      m_DerPol = m_DerPol+m_uNod(iNod)*m_sumProdParc/m_DifCoordProd(iNod);
      
   end
   
end