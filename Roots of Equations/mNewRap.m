function [] = mNewRap()
%     ??/Marzo/16
%     Método abierto NEWTON-RAPHSON para calcular raíces de ecuaciones
%     Argumentos de entrada: Ninguno
    %clc;
    clear;
    format short;
    fprintf('*****   MÉTODO DE NEWTON-RAPHSON   *****\n\n');
    
    
%     Paso 1: Tabular y graficar
    syms x fx dx
    dx = x;
    display('Por favor, ingrese los siguientes 2 argumentos');
    fx = input('1.- Función f(x) IGUALADA A CERO =  ');
    x = input('2.- VECTOR DOMINIO de la variable indp X[] =  ');
    fxEv = eval(fx);
    clf; %Limpiar gráficas
    plot(x,fxEv,'--m*','linewidth',2,'markersize',7,'markeredgecolor','c','markerfacecolor','c');
    grid on;
    title([char(fx),'  =  0'],'Color','r');
    xlabel('x','Color','r');
    ylabel('f(x)','Color','r');
    
    
%     Paso 2: Ingresar valor inicial y límite de iteraciones
    display('Seleccione el punto inicial');
    x0 = input('x0:  ');
    x = x0;
    Nit = input('Ingrese el límite de iteraciones:  ');
    error = 1;
    fprintf('n \t\t\t\tx \t\t\t\tf(x)=0 \t\t\tError Rel\n');
    n = 1; %Contador
    
    
%     Paso 3: Ciclo con condición de parada Error Relativo > 0.00001 y
%     cantidad de iteraciones < Nit
    dfx = diff(fx,dx);
    while( error > 1e-5 && n <= Nit )
        fxEv = eval(fx);
        dfxEv = eval(dfx);
        fprintf('%2d    %15.6ef    %15.6ef    %1.6f\n', n, x, fxEv, error)
        if( fxEv==0 )
            break;
        end
        
        if( dfxEv==0 )
            break;
        else
            xi = x; %Guardar valor actual parar calcular error
            x = x - (fxEv/dfxEv);
        end
        
        if( x~=0 ) %Si x = 0 sería indeterminado
            error = abs( (x-xi)/x );
        end
        
        n = n+1;
    end
    
    
%     Paso 4: Imprimir resultados
    if( eval(fx)==0 )
        display( ['La raíz exacta es: ', num2str(x)] );
    elseif( abs(eval(fx)) < 1 && error < 1e-1 )
        fprintf('La raíz aprox. es: %15.6f\n', x);
    else
        fprintf('La raíz diverge\n');
    end
    fprintf('No. iteraciones: %d\n\n', n-1);
    
end