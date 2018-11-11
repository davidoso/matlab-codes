%     30/Abril/16
    clear;
    clc;
    clf;
    format short;
    hold on;
    fprintf('*****   EJERCICIO 1 - SPLINE TEMPERATURA   *****\n\n');
    
    
%     Datos conocidos
    x0 = 1:1:12;
    y0 = [5,8,9,15,25,29,31,30,22,25,27,24];
%     Datos para formar grafica mediante interpolación
    x = 1:0.1:12;
    
    y = interp1(x0,y0,x,'linear');
%     plot(x0,y0,'mo',x,y,'mo');
%     linear une los puntos conocidos con rectas
%     Por tanto es misma gráfica de unir los puntos interpolados con linear
    
    plot(x0,y0,'bo',x,y,'b','markersize',5,'markeredgecolor','b','markerfacecolor','b');
    y = interp1(x0,y0,x,'spline');
    plot(x,y,'m--');
    
%     Datos a INTERPOLAR con spline
    x = 4.75;
    y = interp1(x0,y0,x,'spline');
    plot(x,y,'ro','markersize',10,'markeredgecolor','r','markerfacecolor','r');
    display( ['Temperatura en ',num2str(x),' horas = ', num2str(y)] );
    
    x = 9.25;
    y = interp1(x0,y0,x,'spline');
    plot(x,y,'go','markersize',10,'markeredgecolor','g','markerfacecolor','g');
    display( ['Temperatura en ',num2str(x),' horas = ', num2str(y)] );
    
    
%     Agregar leyendas
    title(' Ejercicio 1 - Temperatura por horas en Springfield ');
    xlabel('Horas');
    ylabel('Temperatura (°C)');
    legend('Datos conocidos','linear','spline','4.75 hrs spline','9.25 hrs spline');
    
    fprintf('\n\n');
    hold off;