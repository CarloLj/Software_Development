	ORG	00H
	LJMP	INICIO
	ORG	10H
NOMBRE:	DB 'PABLO CARDONA'
	DB 1DH
MENSAJE:DB 'HOLA QUE TAL'
	DB 30H
	
;MAIN
	ORG	50H
INICIO:	MOV	P1,#11110010b
	LCALL	RETARD
	MOV	P1,#00000000b
	LCALL 	RETARD;	
	MOV	P1,#11110010b	
	MOV	R7,#25H
CTRL:	JNB	P3.5,CTRL
	DJNZ	R7,CTRL
	MOV	A,P3
	ANL	A,#0FH
	MOV	R1,A;
	CJNE	R1,#00H,CASEB
	LJMP	CASOA
CASEB:	CJNE	R1,#01H,CASEC
	LJMP	CASOB	
CASEC:	CJNE	R1,#02H,CASED
	LJMP 	CASOC
CASED:	CJNE	R1,#03H,FIN
	LJMP 	CASOD
FIN:	SJMP	FIN;
;TERMINA EL MAIN

;CODIFICADOR
DECOD:	MOV	R1,A
	CJNE	R1,#20H,CA
	MOV	P1,#00000000b
	RET
CA:	CJNE	R1,#41H,CB
	MOV	P1,#11101110b
	RET
CB:	CJNE	R1,#42H,CC
	MOV	P1,#00111110b
	RET
CC:	CJNE	R1,#43H,CD
	MOV	P1,#10011100b
	RET
CD:	CJNE	R1,#44H,CE
	MOV	P1,#01111010b
	RET
CE:	CJNE	R1,#45H,CF
	MOV	P1,#10011110b
	RET
CF:	CJNE	R1,#46H,CG
	MOV	P1,#10001110b
	RET
CG:	CJNE	R1,#47H,C_H
	MOV	P1,#11110110b
	RET
C_H:	CJNE	R1,#48H,CI
	MOV	P1,#00101110b
	RET
CI:	CJNE	R1,#49H,CJ
	MOV	P1,#01100000b
	RET
CJ:	CJNE	R1,#4AH,CK
	MOV	P1,#11110000b
	RET
CK:	CJNE	R1,#4BH,C_L
	MOV	P1,#01101110b
	RET
C_L:	CJNE	R1,#4CH,CM
	MOV	P1,#00011100b
	RET
CM:	CJNE	R1,#4DH,CN
	MOV	P1,#11101100b
	RET
CN:	CJNE	R1,#4EH,CO
	MOV	P1,#00101010b
	RET
CO:	CJNE	R1,#4FH,CP
	MOV	P1,#11111100b
	RET
CP:	CJNE	R1,#50H,CQ
	MOV	P1,#11001110b
	RET
CQ:	CJNE	R1,#51H,C_R
	MOV	P1,#11100110b
	RET
C_R:	CJNE	R1,#52H,CS
	MOV	P1,#00001010b
	RET
CS:	CJNE	R1,#53H,CT
	MOV	P1,#10110110b
	RET
CT:	CJNE	R1,#54H,CU
	MOV	P1,#00011110b
	RET
CU:	CJNE	R1,#55H,CV
	MOV	P1,#01111100b
	RET
CV:	CJNE	R1,#56H,CW
	MOV	P1,#00111000b
	RET
CW:	CJNE	R1,#57H,CX
	MOV	P1,#01111110b
	RET
CX:	CJNE	R1,#58H,C_Y
	MOV	P1,#01101100b
	RET
C_Y:	CJNE	R1,#59H,CZ
	MOV	P1,#01110100b
	RET
CZ:	CJNE	R1,#5AH,FIN_DEC
	MOV	P1,#11011010b
FIN_DEC:RET

RETARD:	MOV	R5,#08D;
CETI3:	MOV	R6,#0FFH;
CETI2:	MOV	R7,#0FFH;
CETI:	DJNZ	R7,CETI;
	DJNZ	R6,CETI2;
	DJNZ	R5,CETI3;
	RET

CASOA:	MOV	P1,#00000000B
	MOV	P1,#01100000B
	LCALL 	RETARD
	MOV	P1,#11011010B
	LCALL 	RETARD
	MOV	P1,#11110010B
	LCALL 	RETARD
	MOV	P1,#01100110B
	LCALL 	RETARD
	MOV	P1,#10110110B
	LCALL 	RETARD
	MOV	P1,#01100001B
	LCALL 	RETARD
	SJMP	CASOA

CASOB:	MOV	R4,#00H
	MOV	DPTR,#NOMBRE
CASOB_1:MOV	A,R4
	MOVC	A,@A+DPTR
	LCALL	DECOD
	LCALL 	RETARD
	INC 	R4
	CJNE	A,#1DH,CASOB_1
	LJMP 	FIN

CASOC:	MOV	R4,#00H
	MOV	DPTR,#MENSAJE
CASOC_1:MOV	A,R4
	MOVC	A,@A+DPTR
	LCALL  	DECOD
	LCALL	RETARD
	INC	R4
	CJNE	A,#30H,CASOC_1
	LJMP 	FIN

CASOD:	MOV	A,#'F'
	LCALL	DECOD
	LCALL	RETARD
	MOV	A,#'A'
	LCALL	DECOD
	LCALL	RETARD
	MOV	A,#'C'
	LCALL	DECOD
	LCALL	RETARD
	MOV	A,#'I'
	LCALL	DECOD
	LCALL	RETARD
	MOV	A,#'L'
	LCALL	DECOD
	LCALL	RETARD
	LJMP	FIN
	

