%     30/Abril/16
%     Polinomio interpolador de Lagrange
%     Cortesía de Internet
    clc;
    clear;
    format long;
    fprintf('*****   POLINOMIO INTERPOLADOR DE LAGRANGE   *****\n\n');
    
    
    xi = input('Ingrese vector fila de datos en X: ');
    yi = input('Ingrese vector fila de datos en Y: ');
    n = length(xi);
    x = sym('x'); %Este comando permite trabajar con x sin tener que asignarle un valor
    
    for j=1:n
        producto = 1;
        for i=1:j-1
            producto = producto*(x-xi(i)); %Cálculo del producto 1 superior de L
        end
        producto2 = 1;
        for i=j+1:n
            producto2 = producto2*(x-xi(i)); %Cálculo del producto 2 superior de L
        end
        producto3 = 1;
        for i=1:j-1
            producto3 = producto3*(xi(j)-xi(i)); %Cálculo del producto 3 inferior de L
        end
        producto4 = 1;
        for i=j+1:n
            producto4 = producto4*(xi(j)-xi(i)); %Cálculo del producto 4 inferior de L
        end
        L(j) = (producto*producto2) / (producto3*producto4); %Cálculos de las L para poder hallar todo el polinomio
        
        fprintf('\n L%d:\n', j-1);
        disp(L(j));
    end
    
    pn = 0;
    for j=1:n
        pn = pn + L(j) * yi(j); %Cálculo del polinomio interpolador
    end
    
    fprintf('\n POLINOMIO INTERPOLADOR DE LAGRANGE \n');
    disp(pn);
    
    fprintf('\n POLINOMIO EXPRESADO CON SIMPLE \n');
    pn = simple(pn);
    disp(pn);
    
    fprintf('\n POLINOMIO EXPRESADO CON PRETTY \n');
    pretty(pn);
    
    x = input('\nIngrese el valor de x a interpolar, x = ');
    y = eval(pn);
    display( ['f(',num2str(x),') = ', num2str(y)] );
    
    fprintf('\n\n');