
function [M_PosNodFron]=gen2d3n_NodFrontera(lx,ly,file_frontera)
%  function [in,xx,iel,conec]=gen2d3n_NodFrontera(lx,ly,file_frontera)
%  genera una malla frontera sobre la malla rectangular
%
%  lx:    Longitud rectangulo en X
%  ly:    Longitud rectangulo en Y
%  file_frontera:  Nombre del archivo a generar
%

clear all
clc
file = 'file_malla2x1.txt'
fileprint ='file_malla2x1front.txt'

%Abro el archivo
fid = fopen(file,'rt');
lx=20;
ly=20;

%Lista de nodos y coordenadas completa

    numnp    = fscanf(fid,'%d',1); 
    A = fscanf(fid,'%f',[4,numnp]);
    A=A';
    
%Vectores de Coordenadas Nodos Frontera  
Nod_Front_A = [find(abs(0-A(:,3))<1e-4)];    %Busca por x en y=0
Tam_NFA= length(Nod_Front_A);

Nod_Front_B = [find(abs(lx-A(:,2))<1e-4)];   %Busca por y en X=lx
Tam_NFB= length(Nod_Front_B);

Nod_Front_C = [find(abs(ly-A(:,3))<1e-4)];   %Busca por X en y=ly
Tam_NFC= length(Nod_Front_C);

Nod_Front_D= [find(abs(0-A(:,2))<1e-4)];     %Busca por y en x=0
Tam_NFD= length(Nod_Front_D);

%Vectores  de Conectividades 
%Va Recorriendo los lados A.B.C y D y los agrega a CONECT

Num_Elem=(Tam_NFA+Tam_NFB+Tam_NFC+Tam_NFD-4);
CONECT=zeros(Num_Elem,3);

for i=1:(Num_Elem);
  if i<=(Tam_NFA-1);
CONECT(i,:) = [i Nod_Front_A(i) Nod_Front_A(i+1)];
  elseif  i<=(Tam_NFB-1+Tam_NFA-1);
CONECT(i,:) = [i Nod_Front_B(i-(Tam_NFA-1)) Nod_Front_B(i-(Tam_NFA-2))];
  elseif  i<=(Tam_NFC-1+Tam_NFB-1+Tam_NFA-1);
CONECT(i,:) = [i Nod_Front_C(i-(Tam_NFB+Tam_NFA-2)) Nod_Front_C(i-(Tam_NFB+Tam_NFA-3))];
  else
CONECT(i,:) = [i Nod_Front_D(i-(Tam_NFC+Tam_NFB+Tam_NFA-3)) Nod_Front_D(i-(Tam_NFC+Tam_NFB+Tam_NFA-4))]; 
  end
end


%Vector COMPLETO de Coordenadas Nodos Fronteras
Nod_Front = [Nod_Front_A;   %Busca por X en y=0
    Nod_Front_B;            %Busca por y en X=lx
    Nod_Front_C;            %Busca por X en y=ly
    Nod_Front_D];          %Busca por y en x=0

B=unique(Nod_Front);    %Elimina los nodos repetidos y los ordena

%Matriz de Posicion de Nodos frontera

M_PosNodFront=(A(B,:));

%IMPIRIME EL ARCHIVO TXT
   fid = fopen(fileprint,'wt');
   fprintf(fid,'%d \n', length(M_PosNodFront));
   fprintf(fid,'%d %f %f %f \n ', (M_PosNodFront)');
   fprintf(fid,'%d \n',(Num_Elem));
   fprintf(fid,'%d %d %d \n ', (CONECT)');
   
   fclose (fid);

end

   
