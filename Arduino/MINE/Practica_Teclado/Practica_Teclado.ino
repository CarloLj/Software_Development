#include <Keypad.h>
#include <LiquidCrystal.h>
#define COLS 16
#define ROWS 2

LiquidCrystal lcd(A0, A1, A2, A3, A4, A5);
const byte rowsCount = 4;
const byte columsCount = 4;
char keys[rowsCount][columsCount] = {
{ '1','2','3', 'A' },
{ '4','5','6', 'B' },
{ '7','8','9', 'C' },
{ '4','0','5', '6' }
};

const byte rowPins[rowsCount] = { 6, 7, 8, 9};
const byte columnPins[columsCount] = { 10, 11, 12, 13};

Keypad keypad = Keypad(makeKeymap(keys), rowPins, columnPins, rowsCount, columsCount);
void setup() {
lcd.begin(COLS, ROWS);
}
void loop() {
int firstNumber;
int secondNumber;
int thirdNumber;
lcd.clear();
lcd.setCursor(0,0);
lcd.print("1)c 2)x->y 3)>");
lcd.setCursor(0,1);
lcd.print("4)ec 5)or 6)im");
lcd.setCursor(15,1);
char key = keypad.getKey();
if (key) {
lcd.print(key);
delay(300);
switch (key)
{
case '1':
lcd.clear();
lcd.setCursor(0,0);
lcd.print("CARLO");
lcd.setCursor(0,1);
lcd.print("ANGEL");
for (byte i = 0; i <= 16; i++)
{
lcd.scrollDisplayRight();
delay(400);
}

delay(2000);
break;
case '2':
lcd.clear();
lcd.setCursor(0,0);
lcd.print("Primer numero");
lcd.setCursor(0,1);
firstNumber = takeNumber();
lcd.clear();
lcd.setCursor(0,0);
lcd.print("Segundo numero");
lcd.setCursor(0,1);
secondNumber = takeNumber();
while (firstNumber <= secondNumber)
{
lcd.clear();
lcd.setCursor(0,0);
lcd.print(firstNumber);
firstNumber++;
delay(500);
}
delay(2000);
break;
case '3': //Maximo de 3 numeros
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Primer numero");
lcd.setCursor(0, 1);
firstNumber = takeNumber();
delay(300);
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Segundo numero");
lcd.setCursor(0, 1);
secondNumber = takeNumber();
delay(300);
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Tercer numero");
lcd.setCursor(0, 1);
thirdNumber = takeNumber();
delay(300);
firstNumber = max(firstNumber, secondNumber);
thirdNumber = max(firstNumber, thirdNumber);
lcd.clear();
lcd.setCursor(0, 0);

lcd.print("Numero mas alto:");
lcd.setCursor(0, 1);
lcd.print(thirdNumber);
delay(2000);
break;
case '4': //Ecuación
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Primer numero");
lcd.setCursor(0, 1);
firstNumber = takeNumber();
delay(300);
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Segundo numero");
lcd.setCursor(0, 1);
secondNumber = takeNumber();
delay(300);
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Tercer numero");
lcd.setCursor(0, 1);
delay(500);
thirdNumber = takeNumber();
delay(300);
thirdNumber = 2 * (firstNumber * firstNumber) + 16 * secondNumber - 3 * thirdNumber; // 2x + 16x - 3y 
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Resultado: ");
lcd.setCursor(0, 1);
lcd.print(thirdNumber);
delay(2000);
break;
case '5':
option5();
break;
case '6':
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Primer numero");
lcd.setCursor(0, 1);
firstNumber = takeNumber();
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Segundo numero");

lcd.setCursor(0, 1);
secondNumber = takeNumber();
while (firstNumber <= secondNumber)
{
lcd.clear();
lcd.setCursor(0, 0);
lcd.print(firstNumber);
firstNumber+=2;
delay(500);
}
}
}
delay (200); //Para que no se vea al aventon
}
void option5() {
int numbers[6];
for (byte i = 0; i <= 5; i++)
{
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Numero ");
lcd.print(i);
lcd.setCursor(0, 1);
numbers[i] = takeNumber();
delay(500);
}
BubbleSortAsc(numbers,6);
for (byte i = 0; i <= 5; i++)
{
lcd.clear();
lcd.setCursor(0, 0);
lcd.print("Numero ");
lcd.setCursor(0, 1);
lcd.print(numbers[i]);
delay(700);
}
}
int takeNumber ()
{
int cont=0;
String numero="";
while (cont != 2)
{
char key = keypad.getKey();
if (key) {
lcd.print(key);

numero += key; //Agrego el valor al string
delay(200);
cont++;
}
}
return numero.toInt();
}
void BubbleSortAsc(int* values, int length)
{
int i, j, flag = 1;
int temp;
for (i = 1; (i <= length) && flag; i++)
{
flag = 0;
for (j = 0; j < (length - 1); j++)
{
if (values[j + 1] < values[j])
{
temp = values[j];
values[j] = values[j + 1];
values[j + 1] = temp;
flag = 1;
}
}
}
}

 
