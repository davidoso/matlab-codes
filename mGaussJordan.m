function [] = mGaussJordan()
%     10/Marzo/16
%     M�todo de eliminaci�n de Gauss-Jordan
%     para resolver sistemas de ecuaciones lineales
    %clc;
    clear;
    format short;
    fprintf('*****   ELIMINACI�N DE GAUSS-JORDAN   *****\n\n');
    
    
%     Paso 1: Entrada de argumentos
    n = input('Ingrese CANTIDAD DE VARIABLES:  '); %S�lo matrices cuadradas
    A = zeros(n,n+1); %Crear matriz de ceros
    disp('Ingresar COEFICIENTES seguidos del T�RMINO INDEPENDIENTE:  ');
    for i=1:n
        for j=1:n+1
            A(i,j)=input('');
        end
    end
    display(A);
    Am = A; %Guardar matriz aumentada
    
    
%     Paso 2: Determinar clasificaci�n de sistema
    if( rank(A(:,1:n)) == rank(A) ) %Comparar matriz de coeficientes con aumentada
        if( rank(A) == n )
            tipoSis = 1; %Compatible determinado
        else
            tipoSis = 2; %Compatible indeterminado
        end
    else
        tipoSis = 3; %Incompatible
    end
    
    
%     Paso 3: Obtener matriz escalonada reducida mediante Ops. de Rengl�n
%     n = No. filas
%     n+1 = No. columnas
    for piv=1:1:n
        if( abs(A(piv,piv)) <= 1e-7 ) %Si pivote = 0, intercambiar filas
            aux = piv+1;
            while( aux<=n && A(aux,aux)==0 )
                aux = aux+1;
            end
            if( aux<=n )
                A([piv aux],:) = A([aux piv],:); %*
                display(A);
            else
                break;
            end
        end
        fprintf('Limpiando Columna %d\n', piv);
        A(piv,:) = A(piv,:) / A(piv,piv); %**
        for f=1:1:n
            if( f ~= piv )
                A(f,:) = A(f,:) - A(f,piv)*A(piv,:); %***
                display(A);
                pause()
            end
        end
    end
    fprintf('Fin eliminaci�n iterativa \n-----------------------------------\n');
    display('Matriz escalonada reducida con rref');
    display(rref(Am));
    
    
%     Paso 4: Desplegar soluci�n
    x = A(:,n+1); %Vector de inc�gnitas
    switch tipoSis
        case 1
            display('Sistema compatible determinado');
            display('�nica soluci�n');
            for i=1:1:n
                fprintf('X%d = %12.4f \n', i, x(i,1));
            end
            
        case 2
            display('Sistema compatible indeterminado');
            display('Infinitas soluciones');
            for i=1:1:n
                if( x(i,1) == 0 )
                    fprintf('X%d = t \n', i); %Valor arbitrario
                else
                    fprintf('X%d = Despejar manualmente \n', i);
                end
            end
            
        case 3
            display('Sistema incompatible');
            display('No existe soluci�n');
    end
    
end

%% NOTAS

% piv no hace referencia al elemento, sino al �ndice
% de fila y/o columna donde se encuentra.
% Al estar en la diagonal principal, ambos son iguales

% OPERACIONES DE RENGL�N UTILIZADAS
% *   Equivale a Rij; intercambiar rengl�n
% **  Equivale a cRi; Ej: R2 = 1/5 R2
% *** Equivale a cRi + Rj; Ej: R3 = R3 - 2R1

% SUSTITUCI�N HACIA ATR�S
% Si la cantidad de variables es mayor al n�mero de ecuaciones indp,
% las soluciones ser�n ecuaciones param�tricas