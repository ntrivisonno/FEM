function [errorL2,errorL2Der,m_Error,c_Res] = f_ErrorL2Sol1D_2(...
   f_ValExac,f_DerExacta,m_ValAprox,m_CoordNod,gradPol)

   %Se evalúa el error integral L2 de una cierta aproximación de elementos finitos, integrando en cada
   %elemento del dominio, de un problema 1D.
   
   %Cantidad de intervalos usados para integrar cada elemento, cuidado si se está integrando intervalos no
   %uniformes.
   n = 20;
   
   %Se transforma en vectores fila
   m_ValAprox = m_ValAprox(:)';
   m_CoordNod = m_CoordNod(:)';
   
   nElem = (length(m_CoordNod)-1)/gradPol;
   errorL2 = 0;
   errorL2Der = 0;
   m_Error = zeros(nElem*n+1,3);
   %Ocupa mucha memoria pero permite guardar todos los puntos dentro del elemento y capturando correctamente la
   %discontinuidad de la primera derivada.
   c_Res = cell(nElem,1);
   for iElem = 1:nElem
      
      %Considerado elementos ordenados en forma monótonamente creciente.
      %x0 = m_CoordNod(iElem);
      %x1 = m_CoordNod(iElem+1);
      %u0 = m_ValAprox(iElem);
      %u1 = m_ValAprox(iElem+1);
      m_CoordElem = m_CoordNod((iElem-1)*gradPol+1:iElem*gradPol+1);
      m_ValAproxElem = m_ValAprox((iElem-1)*gradPol+1:iElem*gradPol+1);      
      %
      %Coordenada nodo inicial del elemento.
      x1 = m_CoordElem(1);
      %Coordenada nodo final del elemento.
      x2 = m_CoordElem(end);
      hElem = x2-x1;
      m_xEval = (x1:hElem/n:x2)';
      
      %Resultado numéricos
      %[m_ResNum,m_DerResNum] = f_EvalFunForma([u0,u1],[x0,x1],m_xEval);
      [m_ResNum,m_DerResNum] = f_EvalFunForma_2(m_ValAproxElem,m_CoordElem,m_xEval);  
      
      c_Res{iElem} = [m_xEval,m_ResNum,m_DerResNum];
      
      %Resultados exactos
      m_ResExac = f_ValExac(m_xEval);
      m_DerExac = f_DerExacta(m_xEval);
      
      m_ErrorL2 = (m_ResExac-m_ResNum).^2;
      m_ErrorL2Der = (m_DerExac-m_DerResNum).^2;
      errorL2 = errorL2+trapz(m_xEval,m_ErrorL2);
      errorL2Der = errorL2Der+trapz(m_xEval,m_ErrorL2Der);
      
      m_Error(n*(iElem-1)+1:n*iElem,:) = [m_xEval(1:end-1),sqrt(m_ErrorL2(1:end-1)),sqrt(m_ErrorL2Der(1:end-1))];
      
   end
   m_Error(end,:) = [m_xEval(end),sqrt(m_ErrorL2(end)),sqrt(m_ErrorL2Der(end))];
   
   errorL2 = sqrt(errorL2);
   errorL2Der = sqrt(errorL2Der);

end

