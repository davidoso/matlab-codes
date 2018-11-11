function [] = mPuntoFijo()
%     ??/Marzo/16
%     Método abierto de punto fijo para calcular raíces de ecuaciones
%     Argumentos de entrada: Ninguno
    %clc;
    clear;
    format short;
    fprintf('*****   MÉTODO DE PUNTO FIJO   *****\n\n');
    
    
%     Paso 1: Gráficar las 2 curvas mIzq mDer
%     para observar puntos de intersección
    syms x fx mIzq mDer
    display('Por favor, ingrese los siguientes 4 argumentos');
    mIzq = input('1.- MIEMBRO IZQUIERDO de la función =  ');
    mDer = input('2.- MIEMBRO DERECHO de la función =  ');
    fx = input('3.- Función f(x) DESPEJADA PARA X =  ');
    x = input('4.- VECTOR DOMINIO de la variable indp X[] =  ');
    mIzqEv = eval(mIzq);
    mDerEv = eval(mDer);
    clf; %Limpiar gráficas
    plot(x,mIzqEv,'g','linewidth',2,'markersize',6,'markeredgecolor','m','markerfacecolor','m');
    hold on;
    grid on;
    plot(x,mDerEv,'m--o','linewidth',2,'markersize',6,'markeredgecolor','b','markerfacecolor','b');
    title ( [char(mIzq),'  =  ',char(mDer)],'Color','r' );
    xlabel('x');
    ylabel('f(x)');
    legend(char(mIzq), char(mDer));
    
    
%     Paso 2: Ingresar valor inicial y límite de iteraciones
    display('Seleccione el punto inicial');
    x0 = input('x0:  ');
    x = x0;
    Nit = input('Ingrese el límite de iteraciones:  ');
    error = 1;
    fprintf('n \t\t\t\tx \t\t\t\tx=f(x) \t\t\tError Rel\n');
    n = 1; %Contador
    
    
%     Paso 3: Ciclo con condición de parada Error Relativo > 0.00001 y
%     cantidad de iteraciones < Nit
    while( error > 1e-5 && n <= Nit )
        fxEv = eval(fx);
        fprintf('%2d    %15.6ef    %15.6ef    %1.6f\n', n, x, fxEv, error)
        if( n>1 && fxEv==xi ) %Si fx(x actual) = xi(x pasada) la raíz es exacta
            break;
        end
        
        xi = x; %Guardar valor actual parar calcular error
        x = fxEv; %Valor de evaluar fx se vuelve nuevo valor de x
        if( x~=0 ) %Si x = 0 sería indeterminado
            error = abs( (x-xi)/x );
        end
        
        n = n+1;
    end
    
    
%     Paso 4: Imprimir resultados
    if( x == xi )
        display( ['La raíz exacta es: ', num2str(x)] );
    elseif( abs( x - abs(eval(fx)) ) < 1 && error < 1e-1 )
        fprintf('La raíz aprox. es: %15.6f\n', x);
    else
        fprintf('La raíz diverge\n');
    end
    fprintf('No. iteraciones: %d\n\n', n-1);
    
end