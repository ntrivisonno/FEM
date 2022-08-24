function [xy,conec] = gen2d4n(lx,ly,nx,ny,file)
% [xy,conec] = GenRectangularMeshQuad4(lx,ly,nx,ny)

if isempty(nx)
   x = lx;
   nx = length(x)-1;
else
   dx = lx/nx;
   x = 0:dx:lx;
end

if isempty(ny)
   y = ly;
   ny = length(y)-1;
else
   dy = ly/ny;
   y = 0:dy:ly;
end

[X,Y] = meshgrid(x,y);
xy = [Y(:) X(:)];

conec = zeros(nx*ny,4);

if nx < ny
   c = (1:ny)';
   for i = 1:nx
         jj = (i-1)*ny+1:i*ny;
         conec(jj,1) = c;
         conec(jj,4) = c+ny+1;
         conec(jj,3) = conec(jj,2)+1;
         conec(jj,2) = conec(jj,1)+1;
         c = c+ny+1;
   end
   
else
   c = (1:ny+1:nx*(ny+1))';
   for i = 1:ny
         jj = (i-1)*nx+1:i*nx;
         conec(jj,1) = c;
         conec(jj,4) = c+ny+1;
 %        conec(jj,3) = conec(jj,2)+1;
         conec(jj,2) = conec(jj,1)+1;
        conec(jj,3) = c+ny+2 ;
         c = c+1;
   end   
end
cero = zeros(length(xy(:,1)),1);
numeracionnod = [1:1:length(xy(:,1))]';
xy = [numeracionnod,xy,cero]
numeracionel = [1:1:length(conec(:,1))]'
conec = [numeracionel,conec]

  %Aplico condiciones de borde para cavidad cuadrada
  xx = xy(:,2:4);
  count=1;
  count2=1;
  for i=1:length(xx(:,1))
      if xx(i,1)<1e-10 && xx(i,1)>-1e-10 && xx(i,2)<(1-1e-10) && xx(i,2)>1e-10
          ufront(count) = i;
          count = count+1;
      elseif xx(i,1)<(1+1e-10) && xx(i,1)>(1-1e-10) && xx(i,2)<(1-1e-6) && xx(i,2)>1e-10
          ufront(count) = i;
          count = count+1;
      elseif xx(i,2)<1e-10 && xx(i,2)>-1e-10
          ufront(count) = i;
          count = count+1;
      elseif xx(i,2)<(1+1e-10) && xx(i,2)>(1-1e-10)
          uvel(count2)= i;
          count2 = count2 +1;
      end
  end
  
  for i=1:length(ufront)
      Ufront2 (2*i-1,:) = [ufront(i) , 1 ,0];
      Ufront2 (2*i,:) = [ufront(i) , 2 ,0];
  end
  for i=1:length(uvel)
      Uvel2 (2*i-1,:) = [uvel(i) , 1 , 1];
      Uvel2 (2*i,:) = [uvel(i) , 2 ,0];
  end
  
  P=[Ufront2;Uvel2];

   fid = fopen(file,'wt');
   fprintf(fid,'     %d \n', length(xy(:,1)));
   fprintf(fid,'     %d     %f      %f     %f \n', [xy]' );
   fprintf(fid,'     %d \n', length(conec(:,1)));
   fprintf(fid,'     %d     %d      %d     %d     %d    \n', [conec]' );
   fprintf(fid,'     %d \n', length(P(:,1)));
   fprintf(fid,'     %d     %d      %d     \n', P');
   fclose (fid);

% return
% 
% 
% 
% dy = ly/ny;
% dx = lx/nx;
% n_nod_x = nx+1;
% n_nod_y = ny+1;
% NbrOfNodes = n_nod_x*n_nod_y;
% n=1;
% xy = zeros(NbrOfNodes,2);
% for j=0:n_nod_y-1
%    y = j*dy;
%    for i=0:n_nod_x-1
%       x = i*dx;
%       xy(n+i, :) = [x,y];
%    end
%    n = n + n_nod_x;
% end
% 
% NbrOfElements = (n_nod_x-1)*(n_nod_y-1);
% conec = zeros(NbrOfElements,4);
% 
% ele = 0;
% n = 0;
% while ele < NbrOfElements
%    for i=1:n_nod_x-1
%       n1 = n+i;
%       n2 = n1+1;
%       n3 = n2+n_nod_x;
%       n4 = n1+n_nod_x;
%       ele = ele + 1;
%       conec(ele,:) = [n1 n2 n3 n4];
%    end
%    n = n + n_nod_x;
% end
