%%ejercicio 1

t = linspace(0,4*pi,600);
f = sin(t);

plot(t,f)
xlabel('t')
ylabel('sen(t)')

%% Ejercicio 2

t = 0:0.02:5;
f = exp(-0.5*t).*cos(15*t);
g = -2*t+2;
h = (t.^2 - t + 3) ./ (t-8);

plot(t,f,t,g,t,h);
xlabel("0<=t<=5")
ylabel("f(t)")
title("Graficas de multiples funciones")

%% Ejercicio 3

t = 0:0.02:5;
f = exp(-0.5*t).*cos(15*t);
g = -2*t+2;
h = (t.^2 - t + 3) ./ (t-8);

hold on
plot(t,f)
plot(t,g)
plot(t,h)
hold off

xlabel("0<=t<=5")
ylabel("f(t)")
title("Graficas de multiples funciones")

legend('exp(-0.5*t).*cos(15*t)', '-2*t+2;', "(t.^2 - t + 3) ./ (t-8)")

%% Ejercicio 4
x = linspace(-5, 5, 100);
f1 = 2*x.^4 + 15*x.^2;
f2 = 8*x.^3 + 30*x;
f3 = 24*x.^2 + 30;
f4 = 48*x;

subplot(2,2,1)
plot(x,f1)
xlabel("x")
ylabel("y")
title("2*x.^4 + 15*x.^2")

subplot(2,2,2)
plot(x,f2)
xlabel("x")
ylabel("y")
title("8*x.^3 + 30*x")

subplot(2,2,3)
plot(x,f3)
xlabel("x")
ylabel("y")
title("24*x.^2 + 30")

subplot(2,2,4)
plot(x,f4)
xlabel("x")
ylabel("y")
title("48*x")

%% Ejercicio 5

x = linspace(-5, 5, 100);
f1 = 2*x.^4 + 15*x.^2;
f2 = 8*x.^3 + 30*x;
f3 = 24*x.^2 + 30;
f4 = 48*x;

figure()
hold on
plot(x,f1, 'rO')
plot(x,f2, 'b--')
plot(x,f3, 'g-.', "linewidth",2)
plot(x,f4, 'b*')
hold off

%% Ejercicio 6
t = linspace(0, 4*pi, 100);
f = sin(t);

hold on
plot(t, f)
plot(pi/2, 1, 'ro', 'Markersize', 10)
text(pi/2 + 0.1, 1, 'Máximo', 'Fontsize', 12)

plot(5*pi/2, 1, 'ro', 'Markersize', 10)
text(5*pi/2 + 0.1, 1, 'Máximo', 'Fontsize', 12)

plot(3*pi/2, -1, 'g*', 'Markersize', 10)
text(3*pi/2 + 0.1, -1, 'Mínimo', 'Fontsize', 12)

plot(7*pi/2, -1, 'g*', 'Markersize', 10)
text(7*pi/2 + 0.1, -1, 'Mínimo', 'Fontsize', 12)

hold off

ylim([-1.1, 1.1])
xlim([2, 5])

