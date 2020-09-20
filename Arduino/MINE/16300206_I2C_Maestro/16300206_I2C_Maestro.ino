#include <Wire.h>
#include <Keypad.h>

const byte rowsCount= 4; // Tiene 4 filas
const byte columnsCount= 4; // Tiene 4 columnas

char keys[rowsCount][columnsCount] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'#','0','*','D'}
};

const byte rowPins[rowsCount] = {46, 48, 50, 52};
const byte columnPins[columnsCount] = {47, 49, 51, 53};

Keypad keypad = Keypad(makeKeymap(keys), rowPins, columnPins, 4, 4);

void setup() {
  Wire.begin();
}

void loop() {
 char tecla = keypad.getKey();
  if (tecla) {
    Enviar(tecla);
  }
}

void Enviar(char letra){
  Wire.beginTransmission(1);
  Wire.write(letra);
  Wire.endTransmission();
  delay(500);
}
