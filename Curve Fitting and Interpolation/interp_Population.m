%     30/Abril/16
    clear;
    clc;
    clf;
    format short;
    hold on;
    fprintf('*****   EJERCICIO 2 - LINEAR POBLACIÓN   *****\n\n');
    
    
%     Datos conocidos
    x0 = 1900:10:1990;
    y0 = [75.99,91.97,105.71,123.20,131.66,150.69,179.32,203.21,226.50,249.63];
%     Datos para formar grafica mediante interpolación
    x = 1900:2:1990;
    
    y = interp1(x0,y0,x,'linear');
    plot(x0,y0,'bo',x,y,'b','markersize',5,'markeredgecolor','b','markerfacecolor','b');
    
%     Dato a interpolar con linear
    x = 1975;
    y = interp1(x0,y0,x,'linear');
    plot(x,y,'ro','markersize',10,'markeredgecolor','r','markerfacecolor','r');
    display( ['(linear)Población en año ',num2str(x),' = ', num2str(y)] );
    
%     Dato a EXTRAPOLAR con linear y spline
    x = 1991;
    
    y = interp1(x0,y0,x,'linear');
    plot(x,y,'ro','markersize',10,'markeredgecolor','r','markerfacecolor','r');
    display( ['(linear)Población en año ',num2str(x),' = ', num2str(y)] );
    
    y = interp1(x0,y0,x,'spline');
    plot(x,y,'go','markersize',10,'markeredgecolor','g','markerfacecolor','g');
    display( ['(spline)Población en año ',num2str(x),' = ', num2str(y)] );
    
    
%     Agregar leyendas
    title(' Ejercicio 2 - Población por décadas en Brasil ');
    xlabel('Décadas');
    ylabel('Millones de personas');
    legend('Datos conocidos','linear','1975 linear','1991 linear (indeterminado)','1991 spline (extrapolación)');
    
    fprintf('\n\n');
    hold off;