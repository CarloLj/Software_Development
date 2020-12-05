%% Solucion reto
ht = 0.01;  %Paso de euler
ti = 0;     %Tiempo inicial (s)
tf = 20;   %Tiempo final (s)

m = 4000;   %Masa del auto (kg)
l = 2.895;  %Batalla del auto (m) la batalla es proporcional 
            %al angulo de ackermann

vi = 5;     %20;  %Velocidad inicial del auto (m/s)

t = ti:ht:tf; %Rango de tiempo (s)
tetaL = [linspace(-1*pi/180,2*pi/180,length(t)/2), linspace(2*pi/180,-1*pi/180,length(t)/2)]; % Angulo en radianes partido entre dos intervalos,
                                                                                              % generado de un angulo especifico a otro con
                                                                                              % variacion uniforme
phi = (zeros(size(t))); % Angulo estandar para la velocidad
v = (zeros(size(t)));   % Velocidad del carro (m/s)
x = (zeros(size(t)));  % Posicion en x del carro
y = (zeros(size(t)));   % Posicion en y del carro
    
% Declaracion de las condiciones de inicio
phi(1) = 1; 
v(1) = vi;
Ft = 1;
x(1) = 1;
y(1) = 1;
   
%Ciclo for para darle valores a cada una de las variables usando el metodo de Euler 
for k = 2:length(t) % K es el indice de posicion del arreglo de los valores de tiempo
    v(k) = v(k-1) + ht*(Ft/m); %Velocidad m/s
    phi(k) = phi(k-1) + ht*v(k-1)*(sin(tetaL(k-1))/l); %Ecuacion del angulo estandar para la velocidad en radianes
    x(k) = x(k-1) + ht*v(k-1)*cos(phi(k-1)); %Ecuacion para la posicion en x (m)
    y(k) = y(k-1) + ht*v(k-1)*sin(phi(k-1)); %Ecuacion para la posicion en y (m)
end

plot(x,y) %Graficacion del modelo de posicion del carro


%https://youtu.be/q87L9R9v274