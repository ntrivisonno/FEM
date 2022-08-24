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
% ojo que no especifica el tipo de elemento, es decir los GDL 1:lineal 2:cuad
  
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

%   NXX  = [in(:) xx(:,1:3)];
%   ELEM = [iel(:) conec(:,1:3)];
   fid = fopen(file,'wt');
   fprintf(fid,'     %d \n', length(in));
   fprintf(fid,'     %d     %f      %f     %f \n', [in(:) xx(:,1:3)]' );
   fprintf(fid,'     %d \n', length(iel));
   fprintf(fid,'     %d     %d      %d     %d \n', [iel(:) conec(:,1:3)]' );
   fclose (fid);
