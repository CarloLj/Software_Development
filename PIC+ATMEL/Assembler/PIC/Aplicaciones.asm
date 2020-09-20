IST p=16f84a
#INCLUDE <p16f84a.inc>
    
  ;__config _CP_OFF & _WDT_OFF & _PWRITE_ON & _XT_OSC
    
    ;CP = PROTECCION DEL CODIGO
    ;WDT OFF : PERRO GUARDIAN DEL CODIGO
    ;PWRITE ON : PERMITE LA ACTIVACION DEL RESET POR MEDIO DE LA ALIMENTACION ESTA NEGADO
    ;XT OSC : OSCILDOR DE CRISTAL
    
    ORG 0x00
    
   BSF STATUS, RP0 ;ACCEDEMOS AL BANCO 1 
    BSF TRISA, 0 ;permite la configuracion como entrada o salida
    BSF TRISA, 1 ;Se configura como entrada en el pin 0
    BCF TRISB, 0;Se configura el puerto b como salida en el pin 0
    BCF STATUS, RP0; Se devuelve al banco 0
    BCF PORTB, 0 ;Inicia el puerto b en el pin 0 como apagado 
    
    ;INICIO DEL PROGRAMA ------
    
    ENCENDER
	BTFAS PORTA, 0 ;Pregunta por un 1 en el puerto a en el pin 0 
	GOTO ENCENDER ; Se regresa hasta que haya un 1
	BSF PORTB, 0 ; Si se cumplio la opcion ENCENDER  mandara un 1  al puerto b en el pin 0 
	
estado
	BTFAS PORTA, 1 ; PREGUNTA POR UN 1 EN EL PUERTO A EN EL PIN 1 
	GOTO estado ;si es falso va a estado
	BCF PORTB, 0 ; Si es verdadero coloca un 0 en el puerto b en el pin 0
	GOTO ENCENDER ;Se retorna a encener

END
