function [] = mBiseccion()
%     ??/Marzo/16
%     Método cerrado de bisección para calcular raíces de ecuaciones
%     Argumentos de entrada: Ninguno
    %clc;
    clear;
    format short;
    fprintf('*****   MÉTODO DE BISECCIÓN   *****\n\n');
    
    
%     Paso 1: Tabular y graficar
    syms x fx
    display('Por favor, ingrese los siguientes 2 argumentos');
    fx = input('1.- Función f(x) IGUALADA A CERO =  ');
    x = input('2.- VECTOR DOMINIO de la variable indp X[] =  ');
    %funx = input('Ingrese la función f(x):  ','s'); %'s' para que lo considere como string sin calcular
    fxEv = eval(fx);
    clf; %Limpiar gráficas
    plot(x,fxEv,'-.mo','linewidth',2,'markersize',7,'markeredgecolor','b','markerfacecolor','b');
    grid on;
    title([char(fx),'  =  0'],'Color','r');
    xlabel('x','Color','r');
    ylabel('f(x)','Color','r');
    
    
%     Paso 2: Ingresar los puntos del intervalo
    display('Seleccione las cotas');
    a = input('Inferior a =  ');
    b = input('Superior b =  ');
    fprintf('%50s\n',strrep(blanks(50),'','-')); %Dejar espacios en blanco para tabla
    fprintf('n \t\tInferior \t\tSuperior \t\tPto medio/Raíz xr \t\tf(x) \t\tError Rel\n');
    error = 1;
    xi = 0; %Guarda valor anterior de xr para calcular error relativo
    n = 1; %Contador de iteraciones
    
    
%     Paso 3: Ciclo con condición de parada Error Relativo > 0.0000001
    while( error > 1e-7 )
        xr = (a+b)/2;
        error = abs( (xr-xi)/xr );
%     Paso 4: Calcular f(a) y f(xr)
        x = xr; %x es la variable indp para evaluar la función, debe asignársele un valor para obtener el par ordenado
        fxr = eval(fx);
        x = a;
        fa = eval(fx);
        fprintf('%2d  %15.12f  %15.12f  %15.12f  %15.8f      %1.8f\n', n,  a,  b,  xr,  fxr,  error)
        
        if( fa*fxr < 0 )
            b = xr; %La raíz se encuentra en el primer subintervalo
        elseif( fa*fxr > 0 )
            a = xr; %La raíz se encuentra en el segundo subintervalo
        else
            break; %Si es = 0, xr es la raíz exacta
        end
        
        xi = xr;
        n = n+1;
    end
    
    
%     Paso 5: Imprimir resultados
    x = xr;
    if( fa == 0 )
        display( ['La raíz exacta es: ', num2str(a)] );
    elseif( fxr == 0)
        display( ['La raíz exacta es: ', num2str(x)] );
    elseif( abs(eval(fx)) < 1 )
        fprintf('La raíz aprox. es: %15.12f\n', x);
    else
        fprintf('La raíz diverge\n');
    end
    fprintf('No. iteraciones: %d\n\n', n);
    
end