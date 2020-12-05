%% Ejercicio 1
%Escriban un programa que dados dos números enteros positivos (pueden obtenerse de manera aleatoria), 
%indique si el mayor de ellos es múltiplo del otro. Investiguen la función mod para resolver este ejercicio.
%{
x1 = randi(10,1);
x2 = randi(100,1);

mayor = 0;
menor = 0;

if (x1 > x2)
    mayor = x1;
    menor = x2;
else
    mayor = x2;
    menor = x1;
end

if(mod(mayor,menor) == 0)
    disp("El numero " + mayor + " es multiplo de " + menor + "")
else
    disp("El numero " + mayor + " no es multiplo de " + menor + "")
end
%}
%% Ejercicio 2
%{
disp("Qué funcion quiere graficar?");
disp("[1]   f(x) = sin(5x) + 2   0<=x<=5       ");
disp("[2]   f(x) = cos(3x) - 2   0<=x<=5       ");
disp("[3]   f(x) = 3e^-5x  + 2   0<=x<=2       ");
disp("[4]   f(x) = raiz(10x^3)   0<=x<=1       ");
disp("[5]   f(x) = |4x| - 2      -5<=x<=5       ");
opc = input("Ingrese su opcion");
switch(opc)
    case 1
        resultado = sin(5.*numero)+2;
        x = linspace(0, 5, 500);
        f1 = sin(5.*x)+2;
        figure()
        plot(x,f1,'r-', 'Markersize', 1);
        title("sin(5.*x)+2")
        xlabel("x")
        ylabel("y")
    case 2
        x = linspace(0, 5, 500);
        f1 = cos(3.*x)-2;
        figure()
        plot(x,f1,'r-', 'Markersize', 1)
        title("cos(3.*x)-2")
        xlabel("x")
        ylabel("y")
    case 3
        x = linspace(0, 2, 500);
        f1 = 3*exp(-5*x) + 2;
        figure()
        plot(x,f1,'r-', 'Markersize', 1)
        title("3*exp(-5*x)+2")
        xlabel("x")
        ylabel("y")
    case 4
        x = linspace(0, 1, 500);
        f1 = sqrt(10*x.^3);
        figure()
        plot(x,f1,'r-', 'Markersize', 1)
        title("sqrt.(10*x^3)")
        xlabel("x")
        ylabel("y")
    case 5
        x = linspace(-5, 5, 500);
        f1 = abs(4*x)-2;
        figure()
        plot(x,f1,'r-', 'Markersize', 1)
        title("abs(4*numero)-2")
        xlabel("x")
        ylabel("y")
    otherwise
        disp("Opcion no valida")
end
%}
%% Ejercicio 3
%{
    numero = randi(20, 1);
    for k = 0:20
        disp(""+k+" x "+numero+" = " + k*numero);
    end
%}
%% Ejercicio 4
%{
for hr = 0:23
    for min = 0:59
        for seg = 0:59
            fprintf("%d: %d: %d",hr,min,seg);
            disp(" ")
        end
    end
end
%}
%% Ejercicio 5
%{
numero = 0;
max = 0;
sumatoria = 0;
while(numero >= 0)
    numero = input("Ingrese un numero a sumar o un numero negativo para dejar de tomar datos");
    if(numero>0)
        sumatoria = sumatoria + numero;
        max = max+1;
    end
end
disp("El promedio es de : " + sumatoria/max);
%}
%% Ejercicio 6
%{
for k = 1:10
    numero = input("Ingrese el precio numero "+ k +": ");
    if(k == 1)
        mayor = numero;
        menor = numero;
    else
        if(mayor < numero)
            mayor = numero;
        else
            if(numero < menor)
                menor = numero;
            end
        end
    end
end
disp("El mayor precio es: " + mayor)
disp("El menor precio es: " + menor)
%}
%% Ejercicio 7
%{
personas = [];
for k = 1:11
    personas = [personas,(input("¿Cuantas personas entraron a la tienda a las "+ (k+7) +":00?"))];
end
disp(personas)
x = 8:1:18;
disp(x)
plot(x, personas)
title("Cuantas personas entraron a la tienda de 8-18 horas?")
xlabel("Hora del dia")
ylabel("Cantidad de personas")
%}
%% Ejercicio 8
%{
xn = 0;
firstfn = 0.1;
firsttime = true;
generados = [];
for k = 0:.1:100
    if(firsttime)
        nextfn = firstfn + 0.1.*cos(xn)*exp(-firstfn);
        nextxn = xn+0.1;
        generados = [generados, nextfn];
        firsttime = false
    else
        nextfn = nextfn + 0.1.*cos(nextxn)*exp(-nextfn);
        nextxn = nextxn + 0.1;
        generados = [generados, nextfn];
    end
end
figure()
l = 0:0.1:100;
plot(l,generados,'r-', 'Markersize', 1)
title("Posicion de un elemento movil de una maquina")
xlabel("Tiempo")
ylabel("Funcion de posicion de acuerodo a tiempo")
%}
%% Ejercicio 9

h = 0.1;
t = 0.1:h:100;
x = t
f = zeros(size(t));
f(0) = 0.1;
y = [];
y = [y,f(0) + h .* cos(t()).* exp(-f(0-1))];
y = [y,f(1-1) + h .* cos(t(1-1)).* exp(-f(1-1))];

for k = 2:length(t)
    y = [y,f(k-1) + h .* cos(t(k-1)).* exp(-f(k-1))]; 
end

plot(t,y)
xlabel('tiempo');
ylabel('Posición con respecto al tiempo');
title('Posición de un elemento móvil de una máquina');