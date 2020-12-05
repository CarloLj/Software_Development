%% Ejercicio 1

% Pregunta    1)
%x = linspace(5, 210, 100);
%disp(x);

% Pregunta    2)
%a = linspace(0, 100, 100);
%b = 0:100;
%disp(a);
%disp(b);

% Pregunta    3)
%a = 2:7;
%b = linspace(5, 20, 6);
%disp(a);
%disp(b);
%c = [a b];
%disp(c);

% Pregunta    4)
%a = 2:7;
%b = linspace(5, 20, 6);

%prueba = a';
%prueba = b';
%prueba = a.*b;
%prueba = [a' b'];
%prueba = [a; b];
%prueba = [a; b']; 
%prueba = a.^2; 
%prueba = [a' b']';
%prueba = [a'; b];
%disp(prueba)

% Pregunta    5)
%a = 1:2:20;
%b = a([1 7 3]);
%c = b(length(b):-1:1);

%disp(a);
%disp(b);
%disp(c);

% Pregunta    6)
%a = 5*ones(10000);
%disp(a)

% Pregunta    7)
%b = a([5 4 5 7]);
%disp(b)

% Pregunta    8)
%{
a = size(1000);
for c = 1:1000
   if rem(c,2)==0
        a(c)=3;
   else
        a(c)=-3;
   end
end

disp(a)
%}
%% Ejercicio 2

% Pregunta    1)
%a = 5*eye(10,10);
%disp(a)


% Pregunta    2)
%a = [1 2; 3 4];
%b = [5 6; 7 8];

%prueba = [a b];
%prueba = [a;b];
%prueba = [b' a];
%prueba =  [a';b'];
%prueba = [b;a'];
%disp(prueba)


% Pregunta    3 y 4)

%a = [1 2 3 4 5; 6 7 8 9 10; 11 12 13 14 15; 16 17 18 19 20];
%disp(a(:, 5))
%disp(a(2, :))
%disp(a(3, [2 4 1]))
%disp(a(4, 4:-1:2))
%disp(a(1:2:4, 5:-1:1))
%a(3,:) = 500;
%disp(a)

% Pregunta    5)

a = [1 2; 3 4; 5, 6];
b = [2 4; 6 8; 10, 12];

%disp(a);
%disp(b);
%prueba = a*b;
%prueba = a.*b;
%prueba = a./b; 
prueba = a^2;
%prueba = a.^2;
%prueba = b.*b;
disp(prueba)

%% Ejericio 3 
%{
t = linspace(-5, 10, 100);
f1 = (t.^3-3*t.^2+5)./(2*t+4);

plot(x,f1, 'r-')
xlabel("t")
ylabel("f(t)")
title("(t.^3-3*t.^2+5)./(2*t+4)")
%}
%% Ejercicio 4
%{
x = linspace(0, 5, 100);
f1 = x.*exp(-x);
f2 = 1-x./exp(x);
f3 = -2+x./exp(x);
f4 = 3-x./exp(x);

subplot(2,2,1)
plot(x,f1)
xlabel("x")
ylabel("y")
title("f(x)=x*exp(-x)")

subplot(2,2,2)
plot(x,f2)
xlabel("x")
ylabel("y")
title("f'(x)=1-x/exp(x)")

subplot(2,2,3)
plot(x,f3)
xlabel("x")
ylabel("y")
title("f''(x)=-2+x./exp(x)")

subplot(2,2,4)
plot(x,f4)
xlabel("x")
ylabel("y")
title("f'''(x)=3-x./exp(x)")
%}
%% Ejercicio 5
%{
x = linspace(0.5, 4, 100);
f1 = cos(2*pi*x);
f2 = exp(-2*x).*cos(5*pi*x);
f3 = cos(6*pi*x).*sin(12*pi*x);

figure()
hold on
subplot(2,2,1)
plot(x,f1,'r-', 'Markersize', 1)
xlabel("x")
ylabel("y")
title("f(x)=cos(2*pi*x)")
legend("f(x)")

subplot(2,2,2)
plot(x,f1,'bo', 'Markersize', 3)
xlabel("x")
ylabel("y")
title("g(x)=exp(-2*x)*cos(5*pi*x)")
legend("g(x)")

subplot(2,2,3)
plot(x,f1,'k*', 'Markersize', 3)
xlabel("x")
ylabel("y")
title("h(x)=cos(6*pi*x).*sin(12*pi*x)")
legend("h(x)")

hold off
%}

%%Ejercicio 5 modificado
%{
x = linspace(0.5, 4, 500);
f1 = cos(2*pi*x);
f2 = exp(-2*x).*cos(5*pi*x);
f3 = cos(6*pi*x).*sin(12*pi*x);

plot(x,f1,'r-', 'Markersize', 1)
title("Funciones Ejercicio 5")
hold on

plot(x,f2,'bo', 'Markersize', 3)
plot(x,f3,'k.-', 'Markersize', 3)

hold off

xlabel("x")
ylabel("y")
legend('f(x)=cos(2*pi*x)', 'g(x)=exp(-2*x)*cos(5*pi*x)', 'h(x)=cos(6*pi*x).*sin(12*pi*x)')
%}
