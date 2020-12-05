%% Ejercicio 1
%{
h = [0.1,0.05,0.01];

% Valores funcion 1
xi1 = 0;
yi1 = 1;
min1 = 0;
max1 = 1;

% Valores funcion 2
xi2 = 1;
yi2 = 0;
min2 = 1;
max2 = 5;

% Valores funcion 3
xi3 = -5;
yi3 = 10;
min3 = -5;
max3 = 5;

subplot(2,2,1);
hold on
for k = h
    x1 = min1:k:max1;
    y1 = zeros(size(x1));
    y1(1) = yi1;
    
    for kk = 2:length(x1)
        y1(kk) = y1(kk-1)+ k*(exp(-0.2.*x1(kk-1)).*cos(15.*y1(kk-1)));
    end
    plot(x1,y1)
end
title("Funcion 1")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.001')
hold off

subplot(2,2,2);
hold on
for k = h
    x2 = min2:k:max2;
    y2 = zeros(size(x2));
    y2(1) = yi2;
    
    for kk = 2:length(x2)
        y2(kk) = y2(kk-1)+ k*(sqrt(x2(kk-1)^2+y2(kk-1)^2));
    end
    plot(x2,y2)
end
title("Funcion 2")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.001')
hold off

subplot(2,2,3);
hold on
for k = h
    x3 = min3:k:max3;
    y3 = zeros(size(x3));
    y3(1) = yi3;
    
    for kk = 2:length(x3)
        y3(kk) = y3(kk-1)+ k*(x3(kk-1)*sin(x3(kk-1)^2)*cos(y3(kk-1))); 
    end
    plot(x3,y3)
end
title("Funcion 3")
xlabel("x")
ylabel("y")    
legend('h = 0.1', 'h = 0.05', 'h = 0.001')
hold off
%}
%% Ejercicio 2
%{
ht = [0.5,0.1,0.01,0.00001];

xi1 = 0;   % Valor inicial de x
xf1 = 2;   % Valor final de x
yi1 = 1;

xi2 = 1;   % Valor inicial de x
xf2 = 2;   % Valor final de x
yi2 = 1;


xi3 = -10;   % Valor inicial de x
xf3 = 10;   % Valor final de x
yi3 = 5;

subplot(2,2,1);
hold on
for h = ht
    % Inicializar vectores "x" y "y"
    x1 = xi1:h:xf1;
    y1 = zeros(size(x1));

    % Inicializar el primer elemento de y
    y1(1) = yi1; 

    % Encuentra con Euler lo valores de y
    for k = 2:length(x1)
        y1(k) = y1(k-1) + h *(exp(-x1(k-1)*y1(k-1)));   % Valor inicial de y;
    end

    % Grafica resultado
    plot(x1, y1)   
end
title("Ejercicio 1")
xlabel("x")
ylabel("y")    
legend('h = 0.5', 'h = 0.1', 'h = 0.01', 'h = 0.00001')
hold off

subplot(2,2,2);
hold on 
for h = ht
    % Inicializar vectores "x" y "y"
    x2 = xi2:h:xf2;
    y2 = zeros(size(x2));

    % Inicializar el primer elemento de y
    y2(1) = yi2;

    % Encuentra con Euler lo valores de y
    for k = 2:length(x2)
        y2(k) = y2(k-1) + h *(x2(k-1)/y2(k-1));
    end

    % Grafica resultado
    plot(x2, y2)   
end
title("Ejercicio 2")
xlabel("x")
ylabel("y")    
legend('h = 0.5', 'h = 0.1', 'h = 0.01', 'h = 0.00001')
hold off 

subplot(2,2,3);
hold on 
for h = ht
    % Inicializar vectores "x" y "y"
    x3 = xi3:h:xf3;
    y3 = zeros(size(x3));

    % Inicializar el primer elemento de y
    y3(1) = yi3;

    % Encuentra con Euler lo valores de y
    for k = 2:length(x3)
        y3(k) = y3(k-1) + h *(sin(x3(k-1)^2)*cos(y3(k-1)));   % Valor inicial de y;
    end

    % Grafica resultado
    plot(x3, y3)   
end
title("Ejercicio 3")
xlabel("x")
ylabel("y")    
legend('h = 0.5', 'h = 0.1', 'h = 0.01', 'h = 0.00001')
hold off 
%}
%% Ejercicio 3
%{
m = .150;
kp = 0.25;
g = 9.8;
p = 0.01;
t = 0:p:10;

% Inicializa vectores posición, velocidad y aceleración
s = zeros(size(t)); %Posicion
v = zeros(size(t)); %Velocidad
a = zeros(size(t)); %Aceleracion

% Asigna valores iniciales
s(1) = 5;
v(1) = 25;
a(1) = -g - (kp/m) * (v(1));

% Calcula con Euler los valores de s, v, y a
hold on
for k = 2:length(t)
    s(k) = s(k-1) + p*v(k-1);
    v(k) = v(k-1) + p*a(k-1);
    a(k) = -g - (kp/m) * (v(k-1));
end

subplot(2,2,1);
plot(t,s);
title("Posicion")
xlabel("x")
ylabel("y")    

subplot(2,2,2);
plot(t,v);
title("Velocidad")
xlabel("x")
ylabel("y")    

subplot(2,2,3);
plot(t,a);
title("Aceleracion")
xlabel("x")
ylabel("y")    

hold off
%}
%% Ejercicio 4
%{
m = .450;
kp = 0.25;
g = 9.8;
p = 0.1;
t = 0:p:10;
radianes = 30*pi/180;

%-----------------------------------------------------------
% Inicializa vectores posición, velocidad y aceleración
sx = zeros(size(t)); %Posicion
vx = zeros(size(t)); %Velocidad
ax = zeros(size(t)); %Aceleracion

% Asigna valores iniciales
sx(1) = 0;
vx(1) = cos(radianes)*300;
ax(1) = -(kp/m) * (vx(1));
%-----------------------------------------------------------


%-----------------------------------------------------------
% Inicializa vectores posición, velocidad y aceleración
sy = zeros(size(t)); %Posicion
vy = zeros(size(t)); %Velocidad
ay = zeros(size(t)); %Aceleracion

% Asigna valores iniciales
sy(1) = .8;
vy(1) = sin(radianes)*300;
ay(1) = -g-(kp/m) * (vy(1));
%-----------------------------------------------------------

%"_______________________________________________________"
% Calcula con Euler los valores de s, v, y a

hold on
for k = 2:length(t)
    sx(k) = sx(k-1) + p*vx(k-1);
    vx(k) = vx(k-1) + p*ax(k-1);
    ax(k) = -(kp/m) * (vx(k-1));
end

%"_______________________________________________________"
for k = 2:length(t)
    sy(k) = sy(k-1) + p*vy(k-1);
    vy(k) = vy(k-1) + p*ay(k-1);
    ay(k) = -g -(kp/m) * (vy(k-1));
end
comet(sx,sy);
title("Valores de posicion")
xlabel("x")
ylabel("y")   
legend('sx,sy')

hold off
%"_______________________________________________________"
%}
