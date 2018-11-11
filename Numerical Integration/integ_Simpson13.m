%     12/Mayo/16
%     2a de las F�rmulas cerradas de integraci�n de Newton-Cotes
%     Regla de Simpson 1/3 con segmentos m�ltiples
%     Aproximar integral en intervalo [a,b]
%     mediante un Polinomio de 2do grado (par�bola)
%     F�RMULA: (b-a)/3n * [ f(x0) + 4E(i=1:2:n-1) f(xi) + 2E(j=2:2:n-2) f(xj) + f(xn) ]
%     F�RMULA: h/3n * [ f(xa) + 4f(a+1/3/5/7/...h) + 2f(a+2/4/6/...h) + f(xb) ]
    clc;
    clear;
    format short;
    fprintf('*****   INTEGRACI�N: REGLA DE SIMPSON 1/3   *****\n\n');
    
    syms x fx
    intg = 0;   %Sumador que guardar� el valor de la integral
    aux = 0;    %Sumador auxiliar para xi impar y xj par
    n = 1;      %N�mero de segmentos/trapecios. Debe ser PAR
    fx = input('Ingrese la funci�n a integrar, f(x)=  ');
    while( mod (n,2)~=0 )
        n = input('Ingrese N�MERO PAR de trapecios para aproximar, n =  ');
    end
    display('Seleccione las cotas');
    a = input('Inferior, a =  ');   %a = abs(a);
    b = input('Superior, b =  ');   %b = abs(b);
    h = (b-a) / n;   %Ancho
    
%     Part 1 of 4
    x = a;
    intg = intg + eval(fx);
    
%     Part 2 of 4
    for i=1:2:n-1
        x = a + i*h;
        aux = aux + eval(fx);
    end
    intg = intg + 4*aux;
   
%     Part 3 of 4
    aux = 0;
    for i=2:2:n-2
        x = a + i*h;
        aux = aux + eval(fx);
    end
    intg = intg + 2*aux;
    
%     Part 4 of 4
    x = b;
    intg = intg + eval(fx);
    intg = (h/3)*intg;
    
    fprintf('\n La funci�n es: \n');
    pretty(fx);
    fprintf('\n La integral definida aproximada es: \n');
    fprintf('%6.6f', intg);
    
    fprintf('\n\n');