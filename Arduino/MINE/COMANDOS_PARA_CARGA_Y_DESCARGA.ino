void carga()
{
 while (x<1)
{
char key = keypad.getKey();
//condiciones de error
//ERROR PARA A1
if ((key=='1')&&(Au == 3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon A1 lleno");
delay(1000);
x=1;
menu();
}
//ERROR PARA A2
if ((key=='2')&&(Ad == 3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon A2 lleno");
delay(1000);
x=1;
menu();
}
//ERROR PARA B1
if ((key=='3')&&(Bu == 3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon B1 lleno");
delay(1000);
x=1;
menu();
}
//ERROR PARA B2
if ((key=='4')&&(Bd == 3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon B2 lleno");
delay(1000);
x=1;
menu();
}

//Para cargar a A1
if ((key=='1')&&(Au<3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Cargando a A1");
delay(1000);
x=1;
menu();
Au++;
}
//Para cargar a A2
if ((key=='2')&&(Ad<3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Cargando a A2");
delay(1000);
x=1;
menu();
Ad++;
}
//Para Carggar a B1
if ((key=='3')&&(Bu<3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Cargando a B1");
delay(1000);
x=1;
menu();
Bu++;
}
//para cargar a B2
if ((key=='4')&&(Bd<3))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Cargando a B2");
delay(1000);
x=1;
menu();
Bd++;
}
if(key=='*')
{
  menu();
  x=1;
}
}
}

void descarga()
{
while (x<1)
{
char key = keypad.getKey();
//condiciones de error
// ERROR PARA A1 
if ((key=='1')&&(Au == 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon A1 Vacio");
delay(1000);
x=1;
menu();
}
//ERROR PARA A2
if ((key=='2')&&(Ad == 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon A2 Vacio");
delay(1000);
x=1;
menu();
}
//ERROR PARA B1
if ((key=='3')&&(Bu == 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon B1 Vacio");
delay(1000);
x=1;
menu();
}
//ERROR PARA B2
if ((key=='4')&&(Bd == 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Vagon B1 Vacio");
delay(1000);
x=1;
menu();
}

//Condiciones para descargar
//Para descargar a A1
if ((key=='1')&&(Au > 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Descargando de A1");
delay(1000);
x=1;
menu();
Au--;
}
//Para descargar a A2
if ((key=='2')&&(Ad > 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Descargando de A2");
delay(1000);
x=1;
menu();
Ad--;
}
//Para descargar a B1
if ((key=='3')&&(Bu > 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Descargando de B1");
delay(1000);
x=1;
menu();
Bu--;
}
//Para descargar a B2
if ((key=='4')&&(Bd > 0))
{
lcd.clear();
lcd.setCursor(0,1);
lcd.print("Descargando de B2");
delay(1000);
x=1;
menu();
Bd--;
}
if(key=='*')
{
    menu();
  x=1;
}
}
}

