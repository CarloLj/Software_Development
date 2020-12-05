%% Ejercicio 1 
h = 0.1;
x = 1;
y = 5;

disp("x = " + num2str(x) + " y = " + num2str(y))

while x <= 3 
    y = y+h*  (  6-2*y/x  );
    x = x+h;
    
    disp("x = " + num2str(x) + "y = " + num2str(y))
    
    %
    % Actualizar gráfico
    %
end

%% Ejercicio 1

ht = [0.1 0.05 0.01];

xi = 1;
xf = 3;
yi = 5;


hold on
for h = ht            
    x = xi:h:xf;
    y = zeros(size(x));
    
    y(1)= yi;
    
    for k = 2:length(x)
        y(k) = y(k-1) + h*( 6 - 2*y(k-1)/x(k-1) );
    end

    plot(x,y)
end


x = linspace(xi,xf,100);
y = (2*x.^3 + 3)./x.^2;
plot(x,y)

hold off

title("Ejercicio 1")
xlabel("X")
ylabel("y")

%% Ejercicio 2
%{
ht = [0.1 0.05 0.01];

xi = 1;
xf = 3;
yi = 5;


hold on
for h = ht            
    x = xi:h:xf;
    y = zeros(size(x));
    
    y(1)= yi;
    
    for k = 2:length(x)
        y(k) = y(k-1) + h*( 6 - 2*y(k-1)/x(k-1) );
    end

    plot(x,y)
end


x = linspace(xi,xf,100);
y = (2*x.^3 + 3)./x.^2;
plot(x,y)

hold off

title("Ejercicio 1")
xlabel("X")
ylabel("y")
%}
%% Ejercicio 3
%{
%% Ejercicio 3
ht = [0.1 0.05 0.01]; % Tamaños de paso que voy a probar

xi = -1.5;  % Valor inicial de x
xf = 1.5;   % Valor final de x
yi = 0;     % Valor inicial de y

hold on
for h = ht
    
    % Inicializar vectores "x" y "y"
    x = xi:h:xf;
    y = zeros(size(x));

    % Inicializar el primer elemento de y
    y(1) = yi;

    % Encuentra con Euler lo valores de y
    for k = 2:length(x)
        y(k) = y(k-1) + h *(  (50*x(k-1)^2 - 10*y(k-1))/3   );
    end

    % Grafica resultado
    plot(x, y)   

end

% Decora gráfica con resultados
hold off

title("Ejercicio 3")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.01')
%}
%% Ejercicio 4
%{
g = 9.81;
h = 0.1;

% Inicializa vector de tiempo.
t = 0:h:30;

% Inicializa vectores posición, velocidad y aceleración
s = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));

% Asigna valores iniciales
s(1) = 5000;
v(1) = 0;
a(1) = -g;

% Calcula con Euler los valores de s, v, y a
for k = 2:length(t)
    s(k) = s(k-1) + h*v(k-1);
    v(k) = v(k-1) + h*a(k-1);    
    a(k) = -g;
end

% Grafica resultados
subplot(1,3,1)
plot(t, s)
xlabel('t')
ylabel('s(t)')
title('Posición')

subplot(1,3,2)
plot(t, v)
xlabel('t')
ylabel('v(t)')
title('Velocidad')

subplot(1,3,3)
plot(t, a)
xlabel('t')
ylabel('a(t)')
title('Aceleración')
%}
%% Ejercicio 5

g = 9.81;
h = 0.1;
kp = 0.5;
m = 70;

t = 0:h:100;

% Inicializa vectores posición, velocidad y aceleración
s = zeros(size(t));
v = zeros(size(t));
a = zeros(size(t));

% Asigna valores iniciales
s(1) = 5000;
v(1) = 0;
a(1) = -g + (kp/m) * (v(1)^2);

% Calcula con Euler los valores de s, v, y a
for k = 2:length(t)
    s(k) = s(k-1) + h*v(k-1);
    v(k) = v(k-1) + h*a(k-1);    
    a(k) = -g + (kp/m) * (v(k-1)^2);
end

subplot(1,3,1)
plot(t, s)
xlabel('t')
ylabel('s(t)')
title('Posición')

subplot(1,3,2)
plot(t, v)
xlabel('t')
ylabel('v(t)')
title('Velocidad')

subplot(1,3,3)
plot(t, a)
xlabel('t')
ylabel('a(t)')
title('Aceleración')