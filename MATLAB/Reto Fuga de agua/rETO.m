%DATOS DE UNA FUGA-----------------------------
X1Carlo = xlsread('datos.xlsx','A5:A229');
Y1Carlo = xlsread('datos.xlsx','B5:B229');

X1Luis = xlsread('Datosjp.xlsx','A2:A1789');
Y1Luis = xlsread('Datosjp.xlsx','B2:B1789');

X1Pavel = xlsread('Tracker.xlsx','B4:B1322');
Y1Pavel = xlsread('Tracker.xlsx','C4:C1322');

X1Sebas = xlsread('Sebas.xlsx','A3:A358');
Y1Sebas = xlsread('Sebas.xlsx','C3:C358');

%DATOS DE DOBLE FUGA-----------------------------
X2Carlo = xlsread('carlofuga.xlsx','A2:A186');
Y2Carlo = xlsread('carlofuga.xlsx','B2:B186');

X2Luis = xlsread('jpfuga.xlsx','A2:A402');
Y2Luis = xlsread('jpfuga.xlsx','B2:B402');

X2Pavel = xlsread('Dosfugaspavel.xlsx','A3:A865');
Y2Pavel = xlsread('Dosfugaspavel.xlsx','B3:B865');

X2Sebas = xlsread('sebasfuga.xlsx','A3:A634');
Y2Sebas = xlsread('sebasfuga.xlsx','C3:C634');

%-------------------------------------------------------------------
%CONSTANTES EN EL SISTEMA (AREAS, PATM,DENSIDAD,GRAVEDAD) Y VECTORES
A1C = 0.0153;
A2C = 0.00007853;

A1L = 0.00196;
A2L = 0.000177;

A1P = 0.0154;
A2P = 0.0000785;

A1S = 0.001963495408;
A2S = 0.00007853981634;

%//////PRIMER CASO//////////
V2C = zeros(size(X1Carlo));
V2L = zeros(size(X1Luis));
V2P = zeros(size(X1Pavel));
V2S = zeros(size(X1Sebas));

FLC = zeros(size(X1Carlo));
FLL = zeros(size(X1Luis));
FLP = zeros(size(X1Pavel));
FLS = zeros(size(X1Sebas));

%//////SEGUNDO CASO//////////
V2CC = zeros(size(X2Carlo));
V2LL = zeros(size(X2Luis));
V2PP = zeros(size(X2Pavel));
V2SS = zeros(size(X2Sebas));

FLCC = zeros(size(X2Carlo));
FLLL = zeros(size(X2Luis));
FLPP = zeros(size(X2Pavel));
FLSS = zeros(size(X2Sebas));

PATM = 101300;
DENS = 1000;
GRAVEDAD = 9.81;
%------------------------------------------------------------------

%----------------------------------------------------------
%-------------------DOBLE FUGA-----------------------------
%----------------------------------------------------------
for k = 1:length(X1Carlo)
    Y1Carlo(k) = sqrt(Y1Carlo(k)^2);
    V2C(k) = sqrt(2.*GRAVEDAD.*(Y1Carlo(k)/100));
    FLC(k) = (V2C(k).*A2C).*1000;
end

for k = 1:length(X1Luis)
    V2L(k) = sqrt(2.*GRAVEDAD.*Y1Luis(k));
    FLL(k) = (V2L(k).*A2L).*1000;
end

for k = 1:length(X1Pavel)
    Y1Pavel(k) = sqrt(Y1Pavel(k)^2);
    V2P(k) = sqrt(2.*GRAVEDAD.*Y1Pavel(k));
    FLP(k) = (V2P(k).*A2P).*1000;
end


for k = 1:length(X1Sebas)
    V2S(k) = sqrt(2.*GRAVEDAD.*Y1Sebas(k));
    FLS(k) = (V2S(k).*A2S).*1000;
end
%----------------------------------------------------------
%-------------------DOS FUGAS-----------------------------
%----------------------------------------------------------
for k = 1:length(X2Carlo)
    V2CC(k) = sqrt(2.*GRAVEDAD.*Y2Carlo(k)/100);
    FLCC(k) = (V2CC(k).*A2C)*1000;
end

for k = 1:length(X2Luis)
    V2LL(k) = sqrt(2.*GRAVEDAD.*Y2Luis(k));
    FLLL(k) = (V2LL(k).*A2L)*1000;
end

for k = 1:length(X2Pavel)
    Y2Pavel(k) = sqrt(Y2Pavel(k)^2);
    V2PP(k) = sqrt(2.*GRAVEDAD.*Y2Pavel(k));
    FLPP(k) = (V2PP(k).*A2P)*1000;
end

for k = 1:length(X2Sebas)
    V2SS(k) = sqrt(2.*GRAVEDAD.*Y2Sebas(k));
    FLSS(k) = (V2SS(k).*A2S)*1000;
end

figure("Name",'Pavel');
%//////////////////////////////
p = tiledlayout(3,1); % Requires R2019b or later
%//////////////////////////////
nexttile
plot(X1Pavel,Y1Pavel);
hold on
plot(X2Pavel,Y2Pavel);
hold off
title("Posicion")
xlabel("Tiempo")
ylabel("Altura")
legend("1 fuga", "2 fugas")
nexttile
plot(X1Pavel,V2P)
hold on
plot(X2Pavel,V2PP);
hold off
title("Velocidad")
xlabel("Tiempo")
ylabel("Velocidad")    
legend("1 fuga", "2 fugas")
nexttile
plot(X1Pavel,FLP)
hold on
plot(X2Pavel,FLPP);
hold off
title("Flujo Volumetrico")
xlabel("Tiempo")
ylabel("L/seg")      
legend("1 fuga", "2 fugas")
%/////////////////////////////


figure("Name",'Carlo');
%//////////////////////////////
c = tiledlayout(3,1); % Requires R2019b or later
%//////////////////////////////
nexttile
plot(X1Carlo,Y1Carlo);
hold on
plot(X2Carlo,Y2Carlo);
hold off
title("Posición")
xlabel("Tiempo")
ylabel("Altura")
legend("1 fuga", "2 fugas")
nexttile
plot(X1Carlo,V2C)
hold on
plot(X2Carlo,V2CC);
hold off
title("Velocidad")
xlabel("Tiempo")
ylabel("Velocidad")   
legend("1 fuga", "2 fugas")
nexttile
plot(X1Carlo,FLC)
hold on
plot(X2Carlo,FLCC);
hold off
title("Flujo Volumetrico")
xlabel("Tiempo")
ylabel("L/seg")     
legend("1 fuga", "2 fugas")
%/////////////////////////////

figure("Name",'Juan');
%//////////////////////////////
j = tiledlayout(3,1); % Requires R2019b or later
%//////////////////////////////
nexttile
plot(X1Luis,Y1Luis);
hold on
plot(X2Luis,Y2Luis);
hold off
title("Posicion")
xlabel("Tiempo")
ylabel("Altura")
legend("1 fuga", "2 fugas")
nexttile
plot(X1Luis,V2L)
hold on
plot(X2Luis,V2LL);
hold off
title("Velocidad")
xlabel("Tiempo")
ylabel("Velocidad")   
legend("1 fuga", "2 fugas")
nexttile
plot(X1Luis,FLL)
hold on
plot(X2Luis,FLLL);
hold off
title("Flujo Volumetrico")
xlabel("Tiempo")
ylabel("L/seg")     
legend("1 fuga", "2 fugas")
%/////////////////////////////

figure("Name",'Sebastian');
%//////////////////////////////
s = tiledlayout(3,1); % Requires R2019b or later
%//////////////////////////////
nexttile
plot(X1Sebas,Y1Sebas);
hold on
plot(X2Sebas,Y2Sebas);
hold off
title("Posicion")
xlabel("Tiempo")
ylabel("Altura")
legend("1 fuga", "2 fugas")
nexttile
plot(X1Sebas,V2S)
hold on
plot(X2Sebas,V2SS);
hold off
title("Velocidad")
xlabel("Tiempo")
ylabel("Velocidad") 
legend("1 fuga", "2 fugas")
nexttile
plot(X1Sebas,FLS)
hold on
plot(X2Sebas,FLSS);
hold off
title("Flujo Volumetrico")
xlabel("Tiempo")
ylabel("L/seg")      
legend("1 fuga", "2 fugas")
%/////////////////////////////



%% Regla trapecio generalizada

deltax = (X1Pavel(1319)- X1Pavel(1))/1319;

suma = 0;

for k = 1:(length(X1Pavel))-1
    
    suma = suma + (((deltax)/2) .* (Y1Pavel(k) + Y1Pavel(k+1)));
   
end

disp(suma)

delta = (X1Carlo(length(X1Carlo))- X1Carlo(1))/length(X1Carlo);

sumac = 0;

for k = 1:(length(Y1Carlo))-1
    
    sumac = sumac + ((delta/2) .* ((Y1Carlo(k)) + (Y1Carlo(k+1)))/100);

    
end

disp(sumac)


deltay = (X1Luis(1787)- X1Luis(1))/1787;

suma = 0;

for k = 1:(length(X1Luis))-1
    
    suma = suma + ((deltay/2) .* (Y1Luis(k) + Y1Luis(k+1)));
   
end

disp(suma)

deltaz = (X1Sebas(355)- X1Sebas(1))/355;

suma = 0;

for k = 1:(length(X1Sebas))-1
    
    suma = suma + ((deltaz/2) .* (Y1Sebas(k) + Y1Sebas(k+1)));
   
end

disp(suma)

%% Segunda fuga

deltax = (X2Pavel(349)- X2Pavel(1))/862;

suma = 0;

for k = 1:(length(X2Pavel))-1
    
    suma = suma + (((deltax)/2) .* (Y2Pavel(k) + Y2Pavel(k+1)));
   
end

disp(suma)

delta = (X2Carlo(37)- X2Carlo(1))/184;

sumac = 0;

for k = 1:(length(Y2Carlo))-1
    
    sumac = sumac + ((delta/2) .* ((Y2Carlo(k)) + (Y2Carlo(k+1)))/100);

    
end

disp(sumac)

deltay = (X2Luis(65)- X2Luis(1))/400;

suma = 0;

for k = 1:(length(X2Luis))-1
    
    suma = suma + ((deltay/2) .* (Y2Luis(k) + Y2Luis(k+1)));
   
end

disp(suma)


deltaz = (X2Sebas(210)- X2Sebas(1))/631;

suma = 0;

for k = 1:(length(X2Sebas))-1
    
    suma = suma + ((deltaz/2) .* (Y2Sebas(k) + Y2Sebas(k+1)));
   
end

disp(suma)

