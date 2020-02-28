# para descomprimir

$ unrar x MatFEM.rar 

x -> es cuando quiere conservar los directorios originiales

el prog principal es analysis

--------------------------------------
en consola:

$ file='datter1.txt'
$ analysis
--------------------------------------

si mantenemos el orden de nodos, no es necesaria utilizar indof

para correr el main, primero hay que indicarle el archivo de malla, para eso file='datter1.txt' y una vez cargada la variable file con el archivo de malla correr el main, ver ejem

Ojo -> la func getsol.m hay que corregir cuando resuelve el sistema de ecuaciones para obtener la soluci\'on 'u'

    %f1 = full(S(:,fixa))*vfix;
    f1  = S(:,fixa)*vfix;
    f  = f - f1;

    u = (S\f)';  % el t'ermino ind debe ser f = f-f1


