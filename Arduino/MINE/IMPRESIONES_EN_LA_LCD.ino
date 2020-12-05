void menu ()
{
lcd.clear();
lcd.setCursor(0,0);
lcd.print ("Accion deseada");
lcd.setCursor(0,2);
lcd.print ("A=Estado de vagones ");    
lcd.setCursor(0,3);
lcd.print ("C=Descarga B=Carga");
}

void A()
{
  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print("Estado de vagones");
  lcd.setCursor(0,1);
  lcd.print("A1=");
  lcd.print(   Au);
  lcd.setCursor(7,1);
  lcd.print("A2=");
  lcd.print(   Ad);
  lcd.setCursor(13,1);
  lcd.print("B1=");
  lcd.print(   Bu);
  lcd.setCursor(7,2);
  lcd.print("B2=");
  lcd.print(   Bd);
}
void B()
{
  lcd.clear();
lcd.setCursor(0,0);
lcd.print("Cargar al vagon");
lcd.setCursor(0,1);
lcd.print("   1=A1   2=A2");
lcd.setCursor(0,2);
lcd.print("   3=B1   4=B2");
}

void C()
{
 lcd.clear();
lcd.setCursor(0,0);
lcd.print("Descargar del vagon");
lcd.setCursor(0,1);
lcd.print("   1=A1   2=A2");
lcd.setCursor(0,2);
lcd.print("   3=B1   4=B2"); 
}

