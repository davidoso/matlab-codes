%     09/Mayo/16
%     1a de las F�rmulas cerradas de integraci�n de Newton-Cotes
%     Regla del Trapecio con segmentos m�ltiples
%     Aproximar integral en intervalo [a,b]
%     mediante un Polinomio de 1er grado (l�nea recta)
%     F�RMULA: (b-a)/2n * [ f(x0) + 2E(i=1:1:n-1) f(xi) + f(xn) ]
%     F�RMULA: h/n * [ f(xa) + 2f(a+h)+2f(a+2h)+...+2f(a+n-1h) + f(xb) ]
    clc;
    clear;
    format short;
    fprintf('*****   INTEGRACI�N: REGLA DEL TRAPECIO   *****\n\n');
    
    syms x fx
    intg = 0;   %Sumador que guardar� el valor de la integral
    fx = input('Ingrese la funci�n a integrar, f(x)=  ');
    n = input('Ingrese el n�mero de trapecios para aproximar, n =  ');
    display('Seleccione las cotas');
    a = input('Inferior, a =  ');   %a = abs(a);
    b = input('Superior, b =  ');   %b = abs(b);
    h = (b-a) / n;   %Ancho
    
    for i=0:1:n
        if(i==0)
            x = a;      %f(a)
            intg = intg + eval(fx);
        elseif(i==n)    %f(b)
            x = b;
            intg = intg + eval(fx);
        else            %2f(a+h)+2f(a+2h)+...+2f(a+n-1h)
           x = a + i*h;
           intg = intg + 2*eval(fx);
        end
    end
    intg = (h/2)*intg;
    
    fprintf('\n La funci�n es: \n');
    pretty(fx);
    fprintf('\n La integral definida aproximada es: \n');
    fprintf('%6.6f', intg);
    
    fprintf('\n\n');