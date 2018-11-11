function [] = mReglaFalsa()
%     ??/Marzo/16
%     Método cerrado de posición falsa para calcular raíces de ecuaciones
%     Argumentos de entrada: Ninguno
    %clc;
    clear;
    format short;
    fprintf('*****   MÉTODO DE FALSA POSICIÓN   *****\n\n');
    
    
%     Paso 1: Tabular y graficar
    syms x fx
    display('Por favor, ingrese los siguientes 2 argumentos');
    fx = input('1.- Función f(x) IGUALADA A CERO =  ');
    x = input('2.- VECTOR DOMINIO de la variable indp X[] =  ');
    fxEv = eval(fx);
    clf; %Limpiar gráficas
    plot(x,fxEv,'--g*','linewidth',2,'markersize',7,'markeredgecolor','m','markerfacecolor','m');
    grid on;
    title([char(fx),'  =  0'],'Color','r');
    xlabel('x','Color','r');
    ylabel('f(x)','Color','r');
    
    
%     Paso 2: Ingresar los puntos del intervalo
    display('Seleccione las cotas');
    a = input('Inferior a =  ');
    b = input('Superior b =  ');
    fprintf('%50s\n',strrep(blanks(50),'','-'));
    fprintf('n \t\tInferior \t\tSuperior \t\tPto medio/Raíz xr \t\tf(x) \t\tError Rel\n');
    error = 1;
    xi = 0; %Guarda valor anterior de xr para calcular error relativo
    n = 1; %Contador de iteraciones
    
    
%     Paso 3: Ciclo con condición de parada Error Relativo > 0.0000001
    while( error > 1e-7 )
%     Paso 4: Calcular f(a), f(b) y f(xr)
        x = a;
        fa = eval(fx);
        x = b;
        fb = eval(fx);
        xr = a - ( fa*(b-a) ) / (fb-fa) ;
        x = xr;
        fxr = eval(fx);
        error = abs( (xr-xi)/xr );
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
    if( fa*fxr == 0 )
        display( ['La raíz exacta es: ', num2str(xr)] );
    else
        fprintf('La raíz aprox. es: %15.12f\n', xr);
    end
    fprintf('No. iteraciones: %d\n\n', n);
    
end