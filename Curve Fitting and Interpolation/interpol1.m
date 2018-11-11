%     12/Abril/16
%     Introducción a interpolación de polinomios
    clear;
    clf;
    format short;
    
    t = 1:1:5;
    p = [3,5,7,5,6];
    x = 1:0.1:6;
    y = interp1(t,p,x,'spline');
    plot(t,p,'o',x,y);
    y = interp1(t,p,2.5,'spline');
    display( ['y(2.5) = ', num2str(y)] );
    y = interp1(t,p,5,'spline');
    display( ['y(5) = ', num2str(y)] );
    
    fprintf('\n\n');
    hold off;