% script that generates the full 3D polinimial since the degree (grPol)

grPol = 1;

%%
syms x y z real
m_Pot = zeros(1,3);
m_Term = sym(0);

%%
indCoef = 0;
for indx = 0:grPol
   for indy = 0:grPol
      for indz = 0:grPol
         if indx+indy+indz <= grPol 
            indCoef = indCoef+1;
            m_Pot(indCoef,:) = [indx,indy,indz];
            m_Term(indCoef) = x^indx*y^indy*z^indz;
         end
      end
   end
end
nTermPol = indCoef
fprintf('El polinomio completo es:\n')
pretty(m_Term)
