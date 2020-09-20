#include <doxygen.h>
#include <ESP8266.h>
//include <Adafruit_NeoPixel.h>
#include <SoftwareSerial.h>
 

const char* SSID = "Dumb trapVirus";
const char* PASSWORD = "Infinitum01";

//#define PIN 52
//#define NUMPIXELS 16
//Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);
 
SoftwareSerial softSerial(2, 3); // RX, TX
ESP8266 wifi(softSerial);
//ESP8266 wifi(Serial1);
 
void setup(void)
{
   //pinMode(LED_BUILTIN, OUTPUT); 115200

//   pixels.begin();

  //UpdateLeds(255,255,255);
   
   Serial.begin(115200 );
   //Serial1.begin(115200 );
   softSerial.begin(115200);
   Serial.print("setup begin\r\n");
   
   wifi.restart();
   delay(500);
   if (wifi.setOprToStationSoftAP()) {
      Serial.print("to station + softap ok\r\n");
   }
   else {
      Serial.print("to station + softap err\r\n");
   }
 
   if (wifi.joinAP(SSID, PASSWORD)) {
      Serial.print("Join AP success\r\n");
      Serial.print("IP: ");
      Serial.println(wifi.getLocalIP().c_str());
   }
   else {
      Serial.print("Join AP failure\r\n");
   }
 
   if (wifi.enableMUX()) {
      Serial.print("multiple ok\r\n");
   }
   else {
      Serial.print("multiple err\r\n");
   }
 
   if (wifi.startTCPServer(80)) {
      Serial.print("start tcp server ok\r\n");
   }
   else {
      Serial.print("start tcp server err\r\n");
   }
 
   if (wifi.setTCPServerTimeout(20)) {
      Serial.print("set tcp server timout 20 seconds\r\n");
   }
   else {
      Serial.print("set tcp server timout err\r\n");
   }
 
   Serial.println("setup end\r\n");
}
 
#define wifiWrite(A) wifi.send(mux_id, (uint8_t*) A, sizeof(A) - 1);
void loop(void)
{
   uint8_t buffer[128] = { 0 };
   uint8_t mux_id;
 
   uint32_t len = wifi.recv(&mux_id, buffer, sizeof(buffer), 100);

   if (len > 0) {
      Serial.print("Received from: ");
      Serial.print(mux_id);
      Serial.print("\r\n");
 
      wifiWrite("HTTP/1.1 200 OK\r\nnContent-Type: /html\r\nConnection: close\r\n\r\n");
      wifiWrite("<html>\n<head>\n<title>RGB</title>\n</head>\n<body>");
      wifiWrite("<h2>Color</h2>");
      //wifiWrite("<button onClick=location.href='./?data=0'>ON</button>");
     // wifiWrite("<button onClick=location.href='./?data=1'>OFF</button>");


      wifiWrite("<form action='/get'>");
      wifiWrite("<input type='color' id='color' name='color'><br><br>");
      wifiWrite("<button type = 'submit'>ok</button>");
      wifiWrite("</form><br>");
      wifiWrite("</body></html>");
 
      Serial.println("Send finish");

      byte red, green, blue;
      String color ="";
      for(int i = 18; i < 24; i++){
        color += (char)buffer[i];
      }
      //unsigned long rgb = 0x6f56a3;
      char *ptr;
      unsigned long rgb = strtoul( color.c_str(), &ptr, 16 );

      red = rgb >> 16;

      green = (rgb & 0x00ff00) >> 8;

      blue = (rgb & 0x0000ff);
      //Serial.print("R:" + (int)red + " G:" + (int)green + " B:" + (int)blue);
      Serial.println((int)red);
       Serial.println((int)green);
        Serial.println((int)blue);
      UpdateLeds((int)red,(int)green,(int)blue);
    
   }
}


void UpdateLeds(int R, int G, int B){
//  for(int i = 0; i < NUMPIXELS; i++){
    //pixels.setPixelColor(i, pixels.Color(R,G,B)); 
 // }
  //pixels.show(); 
}
