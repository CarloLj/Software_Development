MOV	SCON,#40H
MOV	TMOD,#20H
MOV	TH1,#0FDH
SETB 	ES
SETB	EA
SETB	TR1

LOOP:
AQUI:	JNB P2.0,AQUI
MOV	SBUF,P0
TRANSMICIONINC: JNB TI,TRANSMICIONINC
CLR TI
SJMP LOOP
END