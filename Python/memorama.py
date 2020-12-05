import random
import os

def pantalla_principal():
    print("--------------------------")
    print("-- Ingrese una opcion ----")
    print("---[1]Memorama------------")
    print("---[2]Busca iguales-------")
    print("---[3]Salir---------------")
    print("--------------------------")
    
def borra():
    if os.name == "posix":
        var = "clear"        
    elif os.name == "ce" or os.name == "nt" or os.name == "dos":
        var = "cls"
    os.system(var)

def ya_gano():
    bandera = False
    for i in range (len(DESVOLTEADAS)):
        for j in range (len(DESVOLTEADAS[i])):
            if(DESVOLTEADAS[i][j] == False):
                return False
    return True
    
def preguntas(tablerito):
    """Esta funcion nos va a decir si el jugador volteo las dos cartas bien"""
    renglon1 = 0
    renglon2 = 0
    columna1 = 0
    columna2 = 0
    for i in range (2):
        if(i == 0):
            renglon1 = int(input("Escoge un renglon: "))
            columna1 = int(input("Escoge una columna: "))
            pantalla_especifica(1,tablerito,renglon1,columna1,"","")
        elif(i == 1):
            renglon2 = int(input("Escoge un renglon: "))
            columna2 = int(input("Escoge una columna: "))
            return(pantalla_especifica(2,tablerito,renglon1,columna1,renglon2,columna2))     
    return False

def pantalla(w):
    for i in range(1,len(w)+1):
        for j in range(1,len(w[i-1])+1):
            if(i == 5 and j == 5):
                print(" ",end = " ")
            else:
                if(DESVOLTEADAS[i-1][j-1]):
                    print(f"[{w[i-1][j-1]}]",end = " ")
                else:
                    print("[ ]",end = " ")
        print()

def pantalla_especifica(caso,matriz,renglon1,columna1,renglon2,columna2):
    respuesta = False
    if(caso == 1):
        for i in range(1,len(matriz)+1):
            for j in range(1,len(matriz[i-1])+1):
                if(i == 5 and j == 5):
                    print(" ",end = " ")
                else:
                    if(i == renglon1 and j == columna1):
                        print(f"[{matriz[i-1][j-1]}]",end = " ")
                    else:
                        if(DESVOLTEADAS[i-1][j-1] == True):
                            print(f"[{matriz[i-1][j-1]}]",end = " ")
                        else:
                            print("[ ]",end = " ")
            print()
    elif(caso == 2):
        caracter1 = ""
        caracter2 = ""
        for i in range(1,len(matriz)+1):
            for j in range(1,len(matriz[i-1])+1):
                if(i == 5 and j == 5):
                    print(" ",end = " ")
                else:
                    if(i == renglon1 and j == columna1):
                        print(f"[{matriz[i-1][j-1]}]",end = " ")
                        caracter1 = matriz[i-1][j-1]
                    elif(i == renglon2 and j == columna2):
                        print(f"[{matriz[i-1][j-1]}]",end = " ")
                        caracter2 = matriz[i-1][j-1]
                    else:
                        if(DESVOLTEADAS[i-1][j-1] == True):
                            print(f"[{matriz[i-1][j-1]}]",end = " ")
                        else:
                            print("[ ]",end = " ")
            print()
        if(caracter1 == caracter2):
            DESVOLTEADAS[renglon1-1][columna1-1] = True
            DESVOLTEADAS[renglon2-1][columna2-1] = True
            return True
        else:
            return False
        
def generacion_tablero(fichas,puestas,colyreng):
    tablero = []
    for i in range (colyreng):
        renglon = []
        for j in range (colyreng):
            if(i == 4 and j == 4):
                renglon.append(-9999)
            else:
                encontrado = False
                while(encontrado == False):
                    numero = random.randint(0, len(fichas)-1)
                    if(puestas[numero]==2):
                        encontrado = False
                    elif(puestas[numero] < 2):
                        renglon.append(fichas[numero])
                        puestas[numero] += 1
                        encontrado = True
        tablero.append(renglon)
    return tablero

def imprime_tablero(matriz):
    for i in matriz:
        print(i)

def memorama(fich,puest,colyren):
    MAX_INTENTOS = 20
    m = generacion_tablero(fich,puest,colyren)
    termino = False
    contador_intentos = 0
    while(termino == False and contador_intentos < MAX_INTENTOS):
        pantalla(m)
        if(preguntas(m)):
            print("Correcto desvolteaste un par")
            input("Ingrese una tecla para continuar...")
            if(ya_gano()):
                termino = True
                print("¡Has ganado!")
            borra()
        else:
            contador_intentos += 1
            print(f"No encontraste un par, te quedan {MAX_INTENTOS-contador_intentos} intentos")
            input("Ingrese una tecla para continuar...")
            borra()
    if(contador_intentos == MAX_INTENTOS):
        print("Has perdido")
    for i in range(len(PUESTAS)):
        PUESTAS[i] = 0
    for i in range(len(DESVOLTEADAS)):
        for j in range(len(DESVOLTEADAS)):
            if(i == 4 and j == 4):
                DESVOLTEADAS[i][j] = True
            else:
                DESVOLTEADAS[i][j] = False

"""PROGRAMA PRINCIPAL"""
COLYRENG = 5
FICHAS = ["*","+","-","?","8","%","&","=","(",")","o","x"]
PUESTAS = [0,0,0,0,0,0,0,0,0,0,0,0]
DESVOLTEADAS = [[False,False,False,False,False],
                [False,False,False,False,False],
                [False,False,False,False,False],
                [False,False,False,False,False],
                [False,False,False,False,True]]
opcion = ""
while(True):
    pantalla_principal()
    opcion = input(": ")
    if(opcion == "1"):
        borra()
        memorama(FICHAS,PUESTAS,COLYRENG)
        input("Ingrese una tecla para continuar...")
        borra()
    elif(opcion == "2"):
        borra()
        print("En proceso de creacion")
        input("Ingrese una tecla para continuar...")
        borra()
    else:
        if(opcion != "3"):
            print("SELECCIONE UNA OPCION CORRECTA!!")
            input("Ingrese una tecla para continuar...")
        else:
            break
