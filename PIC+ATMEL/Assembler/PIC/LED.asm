list p=16f84 
include <p16f84A.inc>
tiempo EQU 0X0C

    org 0
    bsf STATUS,RP0
    CLRF PORTB
    bcf STATUS, RP0
    ;-------
	BSF PORTB, 0 
	END
