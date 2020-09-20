list p=16f877
#include<p16f877.inc>
__CONFIG _PWRTE_ON & _WDT_OFF & _CP_OFF & _HS_OSC & _BODEN_OFF & _WRT_OFF & _LVP_OFF & _CPD_OFF 
    
    ORG 0x00
    GOTO INICIO
    ORG 0x04
    GOTO INTER
   
    INICIO:
    BCF	STATUS,RP1
    BCF	STATUS,RP0;	BANCO 0
    CLRF PORTD;		Pantalla
    CLRF PORTE;		RS - E
    CLRF PORTB;		Push-Button
    
    BCF	STATUS,RP1
    BSF	STATUS,RP0;	BANCO 1
    MOVLW 0x06
    MOVWF ADCON1;	PORTE como Digital
    MOVLW 0x00
    MOVWF TRISE;	PORTE como Salida
    MOVLW 0x00
    MOVWF TRISD;	PORTD como Salida
    MOVLW 0xFF
    MOVWF TRISB;	PORTB como Entrada
    
    BSF OPTION_REG,INTEDG;
    
    BSF INTCON,GIE;	Habilita las Interrupciones Globales
    BSF INTCON,INTE;	Habilita la Interrupción Externa
    BCF INTCON,INTF;	Desactiva la bandera de activación de la INT
    
    BCF	STATUS,RP1
    BCF	STATUS,RP0;	BANCO 0
    
    CALL PANTALLA
    
    ;********************;
    ;* DATOS EN MEMORIA *;
    ;********************;
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'A'
    MOVWF PORTD
    CALL TIME2
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'L'
    MOVWF PORTD
    CALL TIME2
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'A'
    MOVWF PORTD
    CALL TIME2
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'N'
    MOVWF PORTD
    CALL TIME2
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW ' '
    MOVWF PORTD
    CALL TIME2

    GOTO INICIO
    
    ;****************;
    ;* INTERRUPCIÓN *;
    ;****************;
    INTER:
    CALL PANTALLA
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'L'
    MOVWF PORTD
    CALL TIME
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'O'
    MOVWF PORTD
    CALL TIME
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'P'
    MOVWF PORTD
    CALL TIME
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'E'
    MOVWF PORTD
    CALL TIME
    
    MOVLW B'11'
    MOVWF PORTE
    MOVLW 'Z'
    MOVWF PORTD
    CALL TIME
    
    CALL TIME2
    CALL TIME2
    CALL TIME2
    CALL TIME2
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x01;		Display Clear
    MOVWF PORTD;
    CALL TIME;
    
    BCF INTCON, INTF
    RETFIE
    
    ;*********;
    ;* 5mSeg *;
    ;*********;
    TIME:
    MOVLW 0x01;
    MOVWF 0x20;
    Pacuya:
    MOVLW 0xFA;
    MOVWF 0x21;
    Paca:
    MOVLW 0x0A;
    MOVWF 0x22;
    Aca:
    DECFSZ 0x22;
    GOTO Aca;
    DECFSZ 0x21;
    GOTO Paca;
    DECFSZ 0x20;
    GOTO Pacuya;
    MOVLW B'00'
    MOVWF PORTE;	E=0 , RS=0
    RETURN;
    
    ;***********;
    ;* 500mSeg *;
    ;***********;
    TIME2:
    MOVLW 0x64;
    MOVWF 0x20;
    Pacuya2:
    MOVLW 0xFA;
    MOVWF 0x21;
    Paca2:
    MOVLW 0x0A;
    MOVWF 0x22;
    Aca2:
    DECFSZ 0x22;
    GOTO Aca2;
    DECFSZ 0x21;
    GOTO Paca2;
    DECFSZ 0x20;
    GOTO Pacuya2;
    MOVLW B'00'
    MOVWF PORTE;	E=0 , RS=0
    RETURN;
    
    ;******************************;
    ;* INICIALIZACIÓN DE PANTALLA *;
    ;******************************;
    PANTALLA:
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x38;		1° Function Set
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x38;		2° Function Set
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x38;		3° Function Set
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x38;		Function Set (N y F)
    MOVWF PORTD;
    CALL TIME; 
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x0C;		Display ON
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x01;		Display Clear
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x06;		Entry Mode Set
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x0E;		Display ON Control
    MOVWF PORTD;
    CALL TIME;
    
    MOVLW B'01';	RS=0 (Comandos) , E=1
    MOVWF PORTE;
    MOVLW 0x80;		Cursor al inicio
    MOVWF PORTD;
    CALL TIME;
    RETURN
    
    END