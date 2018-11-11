%     30/Abril/16
    clear;
    clc;
    clf;
    format short;
    hold on;
    fprintf('*****   RENDIMIENTO DE PRODUCTOS QUÍMICOS   *****\n\n');
    
    
%     Datos conocidos
    x0 = 150:10:210;
    y0 = [35.5,37.8,43.6,45.7,47.3,50.1,51.2];
%     Datos para formar grafica mediante interpolación
    x = 150:3:210;
    
    y = interp1(x0,y0,x,'linear');    
    plot(x0,y0,'bo',x,y,'b','markersize',5,'markeredgecolor','b','markerfacecolor','b');
    
%     Datos a INTERPOLAR con linear y spline
    x = 155;
    y = interp1(x0,y0,x,'linear');
    plot(x,y,'ro','markersize',10,'markeredgecolor','r','markerfacecolor','r');
    display( ['(linear)% Rendimiento a ',num2str(x),' °C = ', num2str(y)] );
    
    x = 199;
    y = interp1(x0,y0,x,'spline');
    plot(x,y,'mo','markersize',10,'markeredgecolor','m','markerfacecolor','m');
    display( ['(spline)% Rendimiento a ',num2str(x),' °C = ', num2str(y)] );
    
    
%     Agregar leyendas
    title(' Ejercicio 6 - % Rendimiento según temp. de proceso ');
    xlabel('Temperatura (°C)');
    ylabel('% Rendimiento');
    legend('Datos conocidos','linear','155°C linear','199°C spline');
    
    fprintf('\n\n');
    hold off;