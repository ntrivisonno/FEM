% Fun_Forma (Funcionde Forma de elemento triangular cuadrático)

 syms x y alpha1 alpha2 alpha3 beta1 beta2 beta3 gamma1 gamma2 gamma3...
     phi1 phi2 phi3 phi4 phi5 phi6 lambda1 lambda2 lambda3;
 
        lambda1=alpha1+ beta1*x+gamma1*y;
        lambda2=alpha2+ beta2*x+gamma2*y;
        lambda3=alpha3+ beta3*x+gamma3*y;
         
  %Funciones de Forma con Coordenadas de Area.
        phi1=lambda1*(2*lambda1-1);
        phi2=lambda2*(2*lambda2-1);
        phi3=lambda3*(2*lambda3-1);
        phi4=4*lambda1*lambda2;
        phi5=4*lambda2*lambda3;
        phi6=4*lambda1*lambda3;
        
%Calculo de Gradientes de Funciones de Forma.
  
GradPhi1=gradient(phi1, [x, y]);
GradPhi2=gradient(phi2, [x, y]);
GradPhi3=gradient(phi3, [x, y]);
GradPhi4=gradient(phi4, [x, y]);
GradPhi5=gradient(phi5, [x, y]);
GradPhi6=gradient(phi6, [x, y]);
        
%Generacion de los productos escalares de los Gradientes.
k11=dot(GradPhi1,GradPhi1);
k12=dot(GradPhi1,GradPhi2);
k13=dot(GradPhi1,GradPhi3);
k14=dot(GradPhi1,GradPhi4);
k15=dot(GradPhi1,GradPhi5);
k16=dot(GradPhi1,GradPhi6);
k22=dot(GradPhi2,GradPhi2);
k23=dot(GradPhi2,GradPhi3);
k24=dot(GradPhi2,GradPhi4);
k25=dot(GradPhi2,GradPhi5);
k26=dot(GradPhi2,GradPhi6);
k33=dot(GradPhi3,GradPhi3);
k34=dot(GradPhi3,GradPhi4);
k35=dot(GradPhi3,GradPhi5);
k36=dot(GradPhi3,GradPhi6);
k44=dot(GradPhi4,GradPhi4);
k45=dot(GradPhi4,GradPhi5);
k46=dot(GradPhi4,GradPhi6);
k55=dot(GradPhi5,GradPhi5);
k56=dot(GradPhi5,GradPhi6);
k66=dot(GradPhi6,GradPhi6);

%Ordenamiento de la Matriz de Rigidez.

Ke=[k11 k12 k13 k14 k15 k16;...
    k12 k22 k23 k24 k25 k26;...
    k13 k23 k33 k34 k35 k36;...
    k14 k24 k34 k44 k45 k46;...
    k15 k25 k35 k45 k55 k56;...
    k16 k26 k36 k46 k56 k66 ];

