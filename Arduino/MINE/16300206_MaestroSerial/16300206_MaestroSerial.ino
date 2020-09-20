#include <Keypad.h>

const byte rowsCount= 4; // Tiene 4 filas
const byte columnsCount= 4; // Tiene 4 columnas

char keys[rowsCount][columnsCount] = {
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'#','0','*','D'}
};

const byte rowPins[rowsCount] = {44, 46, 48, 50};
const byte columnPins[columnsCount] = {45, 47, 49, 51};

Keypad keypad = Keypad(makeKeymap(keys), rowPins, columnPins, 4, 4);

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  char tecla = keypad.getKey();
  if (tecla) {
    Serial.write(tecla);
  }
}
