function [in,xx,iel,conec]=gen2d3n(lx,numx,ly,numy,file)
%  function [in,xx,iel,conec]=gen2d3n(lx,numx,ly,numy,file)
%  genera una malla rectangular 2d de triangulos
%
%  lx:    Longitud rectangulo en X
%  numx:  Numero de elementos sobre lado X
%  ly:    Longitud rectangulo en Y
%  numy:  Numero de elementos sobre lado Y
%  file:  Nombre del archivo a generar
%
   DX = lx/numx;
   DY = ly/numy;
   nodo=0;
   for k=1:numy+1
      for j=1:numx+1
         nodo       = nodo+1;
         in(nodo)   = nodo;
         xx(nodo,1) = (j-1)*DX;
         xx(nodo,2) = (k-1)*DY;
         xx(nodo,3) = 0;
      end
   end

   iele=0;
   id1 =[1   2 numx+2];
   id2 =[2 numx+3 numx+2];

   for k=1:numy
       for j=1:numx
          iele=iele+1;
          iel(iele) = iele;
          conec(iele,1:3)=((k-1)*(numx+1)+j-1)+id1;
          iele=iele+1;
          iel(iele) = iele;
          conec(iele,1:3)=((k-1)*(numx+1)+j-1)+id2;
       end
   end

   
     % Le fijo el tipo de elemento que utilzo para el problema.
   % Para el problema de stokes eltype = 7
   
   eltype = 7
   
   %Fijacion de las condicioens de borde
   %Borde inferior
   nodL1 = (numx+1)*2;
   nod1L1 = numx+1;
   nL1 = zeros(nodL1,1);
   A1 = (1:1:nod1L1);
   nL1(1:2:end) = A1(:);
   nL1(2:2:end) = A1(:);  
   zerL1 = zeros(nodL1,1);
   vL1 = zeros(nodL1,1)
   vL1(1:2:end) = 3
   vL1(2:2:end) = 2
   
   L1 = [nL1 vL1 zerL1];
   
   %Borde lateral izquierdo
   dezL2 = (numx+1);
   A1 = 0;
   A1 = ((numx+2):dezL2:(((numx+1)*(numy-1)+1)))';
   nodL2  = length(A1)*2;
   nL2 = zeros(nodL2,1);
   nL2(1:2:end) = A1(:);
   nL2(2:2:end) = A1(:);
   zerL2 = zeros(((numy-1)*2),1);
   vL2 = zeros(nodL2,1);
   vL2(1:2:end) = 3;
   vL2(2:2:end) = 2;
      
   L2 = [nL2 vL2 zerL2];
   
   %Borde lateral derecho
    dezL3 = (numx+1);
    A1 = 0
    A1 = (((numx+1)*2):dezL3:((numx+1)*(numy)))'
    nodL3  = length(A1)*2;
    nL3 = zeros(nodL3,1);
    nL3(1:2:end) = A1(:);
    nL3(2:2:end) = A1(:);
    zerL3 = zeros(((numy-1)*2),1);
    vL3 = zeros(nodL3,1);
    vL3(1:2:end) = 3;
    vL3(2:2:end) = 2;
    
    L3 = [nL3 vL3 zerL3];
    
    %Borde superior con Vx = 1 y Vy = 0
     nodL4 = (numx+1)*2;
     A1 = 0;
     A1 = (((numx+1)*(numy)+1):1:((numx+1)*(numy+1)))';
     nL4 = zeros(nodL4,1);
     nL4(1:2:end) = A1(:);
     nL4(2:2:end) = A1(:);
     zerL4 = zeros(nodL4,1);
     zerL4(1:2:end) = -1
     vL4 = zeros(nodL4,1);
     vL4(1:2:end) = 3;
     vL4(2:2:end) = 2;
     
     L4 = [nL4 vL4 zerL4];
     
     L = [L1; L2; L3; L4];
     
     lenL = length(L(:,1))
     
%   NXX  = [in(:) xx(:,1:3)];
%   ELEM = [iel(:) conec(:,1:3)];
   fid = fopen(file,'wt');
   fprintf(fid,'     %d \n', length(in));
   fprintf(fid,'     %d     %f      %f     %f \n', [in(:) xx(:,1:3)]' );
   fprintf(fid,'     %d  %d  \n', [length(iel) eltype]);
   fprintf(fid,'     %d     %d      %d     %d \n', [iel(:) conec(:,1:3)]' );
   fprintf(fid,'     %d  \n', [lenL]);
   fprintf(fid,'     %d     %d      %d  \n', [L(:,1:3)]');
   fclose (fid);
