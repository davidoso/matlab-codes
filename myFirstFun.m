function  y = myFirstFun()
%     04/Marzo/16
%     Familia de funciones y = x^m
%     La función se representa entre los valores -n y n
%     Argumentos de entrada: Ninguno
    n = input('Ingrese n para el rango de x[-n,n]:  ');
    i = input('Ingrese el máximo grado de la función:  ');
    x = -n:1:n;
    con = 0;
    while( con<i )
        y = x.^con;
        grid on;
        hold on;
        plot(x,y);
        con = con+1;
    end
    
    fprintf('\n\n');
    hold off;
    
end