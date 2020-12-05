//se va a establecer la subtarea para llevar todos los motores a cero
void PH();
{
    stepDelay = 550;
  // CODIGO CANDADO PARA ESTABLECER EN "0" TODOS NUESTROS EJES
  if ((digitalRead(fcZ)==LOW)&&(interrupcion == 0))
   {
   while((digitalRead(fcZ)==LOW)&&(interrupcion == 0))
   {
    digitalWrite(dirZ,LOW);
      digitalWrite(stepZ, HIGH);
      delayMicroseconds(stepDelay);
      digitalWrite(stepZ, LOW);
      delayMicroseconds(stepDelay);
   }
   while((digitalRead(fcZ)==HIGH)&&(interrupcion == 0))
   {
    if ((digitalRead(fcY)==LOW)&&(interrupcion == 0))
    {
       while((digitalRead(fcY)==LOW)&&(interrupcion == 0))
   {
    digitalWrite(dirY,HIGH);
      digitalWrite(stepY, HIGH);
      delayMicroseconds(stepDelay);
      digitalWrite(stepY, LOW);
      delayMicroseconds(stepDelay);
   }
   while((digitalRead(fcY)==HIGH)&&(interrupcion == 0))
   {
    if ((digitalRead(fcX)==LOW)&&(interrupcion == 0))
    {
      while((digitalRead(fcX)==LOW)&&(interrupcion == 0))
   {
    digitalWrite(dirX,HIGH);
      digitalWrite(stepX, HIGH);
      delayMicroseconds(stepDelay);
      digitalWrite(stepX, LOW);
      delayMicroseconds(stepDelay);
   }
     while((digitalRead(fcX)==HIGH)&&(interrupcion == 0))
   {
  interrupcion =1;
   }
   }
   }
   }
   }
   }
   while(interrupcion2==0)
   {
  digitalWrite(dirX, LOW);
  digitalWrite(dirY, LOW);
  digitalWrite(dirZ, HIGH);
   for (int x = 0; x < 1000; x++)
   {
      digitalWrite(stepX, HIGH);
      delayMicroseconds(stepDelay);
      digitalWrite(stepX, LOW);
      delayMicroseconds(stepDelay);
   }
   for (int x = 0; x < 1000; x++)
   {
     
      digitalWrite(stepY, HIGH);
      delayMicroseconds(stepDelay);
      digitalWrite(stepY, LOW);
      delayMicroseconds(stepDelay);
   }
   for (int x = 0; x < 1000; x++)
   {
     
      digitalWrite(stepZ, HIGH);
      delayMicroseconds(stepDelay);
      digitalWrite(stepZ, LOW);
      delayMicroseconds(stepDelay);
   }
   interrupcion2=1;
   }
}

