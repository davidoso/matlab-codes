%     19/Abril/16
%     Interpolación lineal
    clear;
    clf;
    format short;
    
%     Valores conocidos
%     IMPORTANTE: CADA DATO DOMINIO X POSEE SU RESPECTIVA IMAGEN F(X)
    x0 = [0.97 1.12 2.92 3.00 3.33 3.97 6.10 8.39 8.56 9.44];
    y0 = [2.58 0.43 0.06 5.74 7.44 8.07 6.37 2.51 1.44 0.52];
    
%     Valores a interpolar
    x = [1.0 2.0 3.5 5.5 8.0];
    y = interp1(x0,y0,x,'linear');
    
%     Mostrar resultados interpolados
    disp([x' y']);
    hold on;
    plot(x0,y0,'-o','markersize',4,'markerfacecolor','r');
    plot(x,y,'o','markersize',5,'markerfacecolor','g');
    xlabel('x');
    ylabel('y');
    title(' Interp lineal de GASTOS/INGRESOS ');
    legend('Conocidos','Interpolados');
    
    fprintf('\n\n');
    hold off;