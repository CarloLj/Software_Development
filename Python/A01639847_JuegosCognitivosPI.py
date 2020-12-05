"""
RememberTrix
Hecho por: Carlo Angel Luján García A01639847 ITESM Campus GDL
14/10/2020 8:36:am
"""
import os
import time
import random
from colorama import Back, Fore, init
init(autoreset=True)

def borra_pantalla():
    """
    Esta funcion borra pantalla de acuerdo al sistema operativo
    """
    
    if os.name == "posix":
        var = "clear"        
    elif os.name == "ce" or os.name == "nt" or os.name == "dos":
        var = "cls"
    os.system(var)
    
def espera(n):
    """
    Esta funcion hace una pausa en el programa
    """
    
    time.sleep(n)
    
def bienvenida():
    """
    Esta funcion imprime el menú
    """
    
    opcion = ""
    print("------------------------------".center(50, " "))
    print("-----Hola bienvenido a--------".center(50, " "))
    print("------¡¡REMEMBERTRIX!!--------".center(50, " "))
    print("------------------------------".center(50, " "))
    print("----[1]Iniciar Nuevo Juego----".center(50, " "))
    print("-----[2] Ver Leaderboards-----".center(50, " "))
    print("----------[3]Salir------------".center(50, " "))
    print("------------------------------".center(50, " "))

def crea_tablero(renglones,columnas,maximo_actual,random_max,tiempo_espera):
    """
    Esta funcion crea una matriz con numeros random en su interior,
    recibe los numeros renglones, las columnas, el maximo actual en
    el que se encuentra el jugador, el numero random maximo que puede
    generarse dentro de la matriz y un tiempo de espera de acuerdo a
    la dificultad
    """
    
    matriz = []
    for i in range (renglones):
        nuevo_renglon = []
        for j in range (columnas):
            nuevo_renglon.append(random.randint(0, random_max))
        matriz.append(nuevo_renglon)
    return(imprime_tablero(matriz,maximo_actual,tiempo_espera))

def imprime_tablero(matriz,maximo_actual,tiempo_espera):
    """
    Esta funcion imprime los renglones del tablero generado en
    crea_tablero, espera cierta cantidad de segundos, borra a pantalla
    y luego manda llamar a la funcion que imprime las preguntas
    """
    
    print("------¡¡APRENDETELO!!--------".center(50, " "))
    for i in matriz:
        print(str(i).center(50, " "))
    espera(tiempo_espera)
    borra_pantalla()
    return(imprime_preguntas(matriz,maximo_actual))

def imprime_preguntas(matriz,maximo_actual):
    """
    Esta funcion imprime las preguntas y permite continuar el juego:
    se crean dos listas las cuales almacenan los valores diferentes que
    se generaron en la matriz y se van sumando de acuerdo a su posicion,
    si son iguales con los valores que pone el usuario, entonces seguira
    creando nuevos niveles ciclicamente. Esta funcion en caso de que el
    jugador se equivoque cierra todos los ciclos anteriores retornando el
    nivel maximo al que se llegó
    """
    
    diferentes = []
    cantidad = []
    for i in range (len(matriz)):
        for j in range (len(matriz[i])):
            if (matriz[i][j] not in diferentes):
                diferentes.append(matriz[i][j])
                cantidad.append(1)
            else:
                for f in range (len(diferentes)):
                    bandera = True
                    if diferentes[f] == matriz[i][j] and bandera:
                        cantidad[f] = cantidad[f]+1
                        bandera = False
    for i in range (len(diferentes)):
        print(f"¿Cuantos [{diferentes[i]}'s] habian en el tablero?".center(50, " "))
        respuesta = int(input("".center(25, " ")))
        if (respuesta == cantidad[i]):
            print("Respuesta correcta".center(50, " "))
        else:
            print("Respuesta incorrecta".center(50, " "))
            espera(1)
            borra_pantalla()
            return maximo_actual-1
    new = determina_col_ren(maximo_actual)
    borra_pantalla()
    return(crea_tablero(new[0],new[1],new[2],new[3],new[4]))

def determina_col_ren(maximo_actual):
    """
    Esta funcion determina el nivel de dificultad de la generacion
    de las matrices, estafuncion controla cuantos renglones, columnas
    y maximo actual que se va sumando conforme se va subiendo de nivel,
    el numero maximo random generado y el tiempo de espera para borrar
    la pantalla y hacer las preguntas. Solo recibe el nivel maximo para
    determinar lo anteriormente mencionado, y retorna una lista con los
    parametros para la creacion de tablero
    """
    
    if (maximo_actual < 3):
        res = [3,3,maximo_actual+1,1,2]
    elif (maximo_actual<=6):
        res = [4,4,maximo_actual+1,1,3]
    elif (maximo_actual<=9):
        res = [4,4,maximo_actual+1,2,5]
    elif (maximo_actual<=12):
        res = [5,5,maximo_actual+1,2,4]
    else:
        res = [5,5,maximo_actual+1,3,4]
    return res

def leaderboards():
    """
    Esta funcion muestra el jugador con record de juego, aparecera su
    nombre mas la cantidad de niveles que superó
    """
    
    borra_pantalla()
    print(Fore.RED + f"El trono lo tiene {NOMBRE_MAXIMO} con un record de \
{MAXIMO_NIVEL} niveles superados".center(50, " "))
    input(Fore.RED + "Presiona una tecla para continuar...".center(50, " "))
    borra_pantalla()
    
MAXIMO_NIVEL = 0
NOMBRE_MAXIMO = "Remembertrix"

#Variables temporales
opcion = ""
nivel_actual = 0

#Este es el programa principal: se repetira hasta que la opcion sea salir: "3"
while(opcion != "3"):
    bienvenida()
    opcion = input("------Selecciona una opcion: ".center(50, " "))
    if(opcion == "1"):
        borra_pantalla()
        res = determina_col_ren(nivel_actual)
        resultado_de_juego = crea_tablero(res[0],res[1],res[2],res[3],res[4])
        if(resultado_de_juego > MAXIMO_NIVEL):
            MAXIMO_NIVEL = resultado_de_juego
            borra_pantalla()
            NOMBRE_MAXIMO = input("Llegaste a un nuevo record, entraste a los \
leaderboards Ingresa tu nombre: ".center(50, " "))
            borra_pantalla()
    elif(opcion == "2"):
        leaderboards()
    else:
        if(opcion != "3"):
            print("Esa no es una opcion valida".center(50, " "))
            input("Presione cualquier tecla para continuar...".center(50, " "))
    borra_pantalla()
