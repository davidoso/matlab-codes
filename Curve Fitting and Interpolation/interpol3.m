%     19/Abril/16
%     Interpolaci�n lineal
    clear;
    clf;
    format short;
    
%     Definir datos conocidos con sus correspondientes valores en f(x)
%     IMPORTANTE: MODIFICAR INTERVALO (pi,pi/2,pi/3)
%     PARA OBSERVAR IMPACTO EN CADA M�TODO
    x0 = 0:pi/4:2*pi;
    y0 = sin(x0);
    
%     Definir valores para construir f(x) (los que se interpolar�n primero)
    x = 0:pi/16:2*pi;
    
%     Interpolar f(x) y graficar
    y = interp1(x0,y0,x,'linear');
    plot(x0,y0,'bo',x,y,'b:.');
    xlim([0 2*pi]);
    hold on;
    y = interp1(x0,y0,x,'spline');
    plot(x,y,'g:.');
    y = interp1(x0,y0,x,'pchip');
    plot(x,y,'m:.');
    
%     Agregar leyendas
    title(' M�todos de interp lineal en comando interp1() ');
    xlabel('x');
    ylabel('f(x)');
    legend('x0','linear','spline','pchip');
    
    fprintf('\n\n');
    hold off;