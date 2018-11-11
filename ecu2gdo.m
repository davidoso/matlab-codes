function [] = ecu2gdo()
%     09/Marzo/16
%     Función que determina las raíces de la ecuación ax^2 + bx + c = 0
%     Argumentos de entrada: Ninguno
    clc;
    clear;
    format short;
    fprintf('*****   SOLUCIÓN EC. DE 2 GRADO   *****\n\n');
    
    fprintf('Ax^2+ Bx + C = 0 \n\n');
    a = input('Ingrese el valor de a: ');
    b = input('Ingrese el valor de b: ');
    c = input('Ingrese el valor de c: ');
    Dis = b^2-4*a*c;
    x1 = ( -b+sqrt(Dis) )/( 2*a );
    x2 = ( -b-sqrt(Dis) )/( 2*a );
    if Dis>=0
        fprintf('Valor de x1: %7.3f\n', x1);
        fprintf('Valor de x2: %7.3f\n', x2);
    else
        fprintf('Valor de x1: %7.3f + %6.3fi\n', real(x1), imag(x1));
        fprintf('Valor de x2: %7.3f + %6.3fi\n', real(x2), imag(x2));
    end
    
end