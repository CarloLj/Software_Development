#include <DHT.h>
#include <DHT_U.h>
#include <LiquidCrystal.h>

// Definimos el pin digital donde se conecta el sensor
#define DHTPIN 2
// Dependiendo del tipo de sensor
#define DHTTYPE DHT11
 
// Inicializamos el sensor DHT11
DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal lcd(11, 10, 9, 8, 7, 6);

void setup() {
  // Inicializamos comunicación serie
  Serial.begin(9600);
  // Comenzamos el sensor DHT
  lcd.begin(16,2);
  lcd.clear();
  dht.begin();
  pinMode(4, OUTPUT);
  pinMode(3, OUTPUT);
 
}
 
void loop() {
    // Esperamos 5 segundos entre medidas
  delay(5000);
 
  // Leemos la humedad relativa
  float h = dht.readHumidity();
  // Leemos la temperatura en grados centígrados (por defecto)
  float t = dht.readTemperature();
  // Leemos la temperatura en grados Fahreheit
  float f = dht.readTemperature(true);
 
  // Comprobamos si ha habido algún error en la lectura
  if (isnan(h) || isnan(t) || isnan(f)) {
    Serial.println("Error obteniendo los datos del sensor DHT11");
    return;
  }
 
  // Calcular el índice de calor en Fahreheit
  float hif = dht.computeHeatIndex(f, h);
  // Calcular el índice de calor en grados centígrados
  float hic = dht.computeHeatIndex(t, h, false);
 
  Serial.print("Humedad: ");
  Serial.print(h);
  lcd.setCursor(0, 0);
  lcd.write("Humedad: ");
  lcd.print(h);
  lcd.print("%");
  Serial.print("%\t");
  Serial.print("Temperatura: ");
  Serial.print(t);
  lcd.setCursor(0, 1);
  lcd.write("Temper: ");
  lcd.print(t);
  lcd.print("*C");
  Serial.print(" *C ");
  Serial.print(f);
  
  Serial.print(" *F\t");
  Serial.print("Índice de calor: ");
  Serial.print(hic);
  Serial.print(" *C ");
  Serial.print(hif);
  Serial.println(" *F");

  if(t < 28){
    digitalWrite(4,HIGH);
    digitalWrite(3,HIGH);
  }

  if(t > 28){
    digitalWrite(3,LOW);
    digitalWrite(4,LOW);
  }

 
}
