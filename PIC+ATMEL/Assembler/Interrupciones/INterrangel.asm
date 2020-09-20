ORG 0000H
LJMP START ;INICIO DE LA PANTALLA
ORG 0003H
LJMP INTE1 ;INICIO DE INTERRUPCION 1  "CARLO ANGEL"	
ORG 0013H
LJMP INTE2 ;INICIO DE UNTERRUPCION 2  "LUJAN GARCIA"
ORG 0025H


START:
	MOV IE,#85H	
	MOV	A,#38H  ;SE INICIA PANTALLA
	LCALL	CMD
	MOV	A,#0DH
	LCALL	CMD
	MOV	A,#01H
	LCALL	CMD
	MOV	A,#06H
	LCALL	CMD
	
START2:	;	PANTALLA DE INICIO EN ESPERA CON MOVIMIENTO 
	MOV	A,#01H
	LCALL	CMD
	MOV	A,#43H
	LCALL	DISP
	MOV	A,#45H
	LCALL	DISP
	MOV	A,#54H
	LCALL	DISP
	MOV	A,#49H
	LCALL	DISP
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	LCALL	CMD
	MOV	A,#1CH
	SJMP START2 ;SE REGRESA A LA PANTALLA DE INICIO
	
CMD:	;COMANDOS PARA FUNCIONES ESPECIALES DEL DISPLAY
	MOV	P1,A
	CLR	P3.0	
	SETB	P3.1 ;Se enciende la LCD
	CLR	P3.1 ;Se apaga la LCD
	LCALL	DELAY
	RET

DISP:	;COMANDO PARA ESCRITURA EN EL DISPLAY PANTALLA INICIO
	MOV	P1,A
	SETB	P3.0
	SETB	P3.1	
	CLR	P3.1
	LCALL	DELAY
	RET

	
DELAY:	;DELAY DE 1 SEG EN EL DISPLAY PANTALLA INICIO
	MOV	R5,#0FFH
	LOOP2:	MOV	R6,#0FFH
	LOOP1:	DJNZ	R6,LOOP1
		DJNZ	R5,LOOP2
		RET

	
CMD2:	;COMANDOS PARA FUNCIONES ESPECIALES DEL DISPLAY PANTALLA INTERRUPCIONES
	MOV	P1,A
	CLR	P3.0	
	SETB	P3.1 ;Se enciende la LCD
	CLR	P3.1 ;Se apaga la LCD
	LCALL	DELAY2
	RET

DISP2:	;COMANDO PARA ESCRITURA EN EL DISPLAY PANTALLA INTERRUPCIONES
	MOV	P1,A
	SETB	P3.0
	SETB	P3.1	
	CLR	P3.1
	LCALL	DELAY2
	RET

	
DELAY2:	;DELAY DE 1 SEG EN EL DISPLAY PANTALLA INICIO
	MOV	R5,#0FFH
	LOOP22:	MOV	R6,#0FFH
	LOOP12:	DJNZ	R6,LOOP12
		DJNZ	R5,LOOP22
		RET

INTE1:	;CARLO ANGEL
	MOV	A,#38H
	LCALL	CMD2
	MOV	A,#0DH
	LCALL	CMD2
	MOV	A,#01H
	LCALL	CMD2
	MOV	A,#06H
	LCALL	CMD2
	MOV	A,#01H
	LCALL	CMD2
	;--------------------------------------------
	MOV	A,#41H
	LCALL	DISP2
	MOV	A,#4EH
	LCALL	DISP2
	MOV	A,#47H
	LCALL	DISP2
	MOV	A,#45H
	LCALL	DISP2
	MOV	A,#4CH
	LCALL	DISP2
	RETI

INTE2:	;PADILLA GARCIA
	MOV	A,#38H
	LCALL	CMD2
	MOV	A,#0DH
	LCALL	CMD2
	MOV	A,#01H
	LCALL	CMD2
	MOV	A,#06H
	LCALL	CMD2
	MOV	A,#01H
	LCALL	CMD2
	;--------------------------------------------
	MOV	A,#50H
	LCALL	DISP2
	MOV	A,#41H
	LCALL	DISP2
	MOV	A,#44H
	LCALL	DISP2
	MOV	A,#49H
	LCALL	DISP2
	MOV	A,#4CH
	LCALL	DISP2
	MOV	A,#4CH
	LCALL	DISP2
	MOV	A,#41H
	LCALL	DISP2
	

	MOV     A,#14H
	LCALL CMD2

	MOV	A,#45H
	LCALL	DISP2
	MOV	A,#53H
	LCALL	DISP2
	MOV	A,#51H
	LCALL	DISP2
	MOV	A,#55H
	LCALL	DISP2
	MOV	A,#45H
	LCALL	DISP2
	MOV	A,#44H
	LCALL	DISP2
	MOV	A,#41H
	LCALL	DISP2
	RETI
	
	FIN:
END


