#Programa de rapidez mental
"""
Realiza una aplicación para niños para practicar cálculo mental. Tu programa deberá mostrar un
menú para elegir entre las operaciones aritméticas básicas, a saber: suma, resta y multiplicación.
El reto de tu aplicación es diferente para cada operación aritmética:
• Sumas: tendrá que presentar 5 ejercicios con un dígito en los dos números (ejemplo: 9 + 8) si
contesta los 5 ejercicios correctamente, sube al nivel 2 y ahora tendrá que contestar 5
operaciones de un dígito + dos dígitos (ejemplo 8 + 38). Si lo logra, guardas su nombre en el
salón de la fama. (simbólicamente, sólo es un mensaje donde le dice al usuario que
pertenece al salón de la fama)
• Restas: presentarás 5 ejercicios con operaciones de dos dígitos, pero en este caso no lo
dejarás avanzar de una operación a otra, hasta que dé el resultado correcto de la operación.
• Multiplicación: tendrá que presentar 10 ejercicios con operaciones de un dígito (ejemplo 9 x
8), y en cada respuesta del usuario, evaluar si es correcta o incorrecta (manda mensaje al
usuario de correcta o incorrecta). Al terminar las 10 operaciones, mostrarás el número de
aciertos.
• El programa termina cuando el usuario elija SALIR
"""
#Autores:
#Gustavo Delgadillo Valenzuela A01639840
#Carlo Angel Lujan A01639847

#Area de imports
import math
from random import randint
import os

#Area de funciones
def multifuncion(tipo): #Esta funcion se encarga de generar numeros random de acuerdo a la variable "tipo" que puede ser, 1 = suma, 2 = multiplicacion, 3 = resta, y en caso de tener niveles extra utiliza la variable nivel 1= nivel 1 , 2 = nivel 2
    var_1 = 0
    var_2 = 0
    dato_ingresado = -10000
    if(tipo == 1): #OPCION PARA SUMA
        for i in range(1,6):
            var_1 = randint(0,10)
            var_2 = randint(0,10)
            print(f"Cuanto es la suma de {var_1} + {var_2} ")
            dato_ingresado = int(input())
            resultado = var_1+var_2
            if(resultado == dato_ingresado):
                print("Respuesta correcta")
            else:
                print("Respuesta incorrecta")
                return False
        print("¡Pasaste al segundo nivel!, dificultad incrementada")
        for i in range(1,6):
            var_1 = randint(0,10)
            var_2 = randint(0,100)
            print(f"Cuanto es la suma de {var_1} + {var_2}")
            dato_ingresado = int(input())
            resultado = var_1+var_2
            if(resultado == dato_ingresado):
                print("Respuesta correcta")
            else:
                print("Respuesta incorrecta")
                return False
        return True
    elif(tipo == 2): #OPCION PARA MULTIPLICACION
        num_aciertos = 0
        for i in range(1,11):
            var_1 = randint(0,10)
            var_2 = randint(0,10)
            print(f"Cuanto es la multiplicacion de {var_1} x {var_2} ")
            dato_ingresado = int(input())
            resultado = var_1*var_2
            if(resultado == dato_ingresado):
                print("Respuesta correcta")
                num_aciertos += 1
            else:
                print("Respuesta incorrecta")
        print(f"Numero de aciertos = {num_aciertos}")
        print(f"Numero de erroneas = {10-num_aciertos}")
        return True
    elif(tipo == 3): #OPCION PARA RESTA
        for i in range(1,6):
            var_1 = randint(0,100)
            var_2 = randint(0,100)
            resultado = var_1-var_2
            while(resultado != dato_ingresado):
                print(f"Cuanto es la resta de {var_1} - {var_2} ")
                dato_ingresado = int(input())
                if(resultado == dato_ingresado):
                    print("Respuesta correcta")
                else:
                    print("Vuelve a intentarlo")
        return True
    return False

def borrarPantalla(): #Definimos la función estableciendo el nombre que queramos
    if os.name == "posix":
       os.system ("clear")
    elif os.name == "ce" or os.name == "nt" or os.name == "dos":
       os.system ("cls")
       
#Area de salidas
def salonDeLaFama(): #Muestra el salon de la fama de los distintos jeugos y si ya fueron alcanzados
    print(f"¿Salon de la fama alcanzado en suma? {salon_suma}")
    print(f"¿Salon de la fama alcanzado en resta? {salon_resta}")
    print(f"¿Salon de la fama alcanzado en multiplicacion? {salon_mult}")

#Area de programa
opcion = "0"
nivel_actual = 1
salon_suma = False
salon_mult = False
salon_resta = False
comprobacion = False
comprobacion2 = False

while(opcion != "5"): #Mientras no sea 5, el programa se seguira ejecutando
    borrarPantalla()
    print("Bienvenido al menu")
    print("¿Que tipo de juego quieres?")
    print("[1] Suma")
    print("[2] Multiplicacion")
    print("[3] Resta")
    print("[4] Salon de la fama")
    print("[5] Salir")
    opcion = input()
    if(opcion == "1"):
        sig_nivel = multifuncion(1)
        if(sig_nivel):
            print("***************************")  
            print("Pasaste al salon de la fama")
            print("***************************")  
            salon_suma = True
    elif(opcion == "2"):
        sig_nivel = multifuncion(2)
        if(sig_nivel):
            print("***************************")  
            print("Pasaste al salon de la fama")
            print("***************************")  
            salon_mult = True
    elif(opcion == "3"):
        sig_nivel = multifuncion(3)
        if(sig_nivel):
            print("***************************")  
            print("Pasaste al salon de la fama")
            print("***************************")  
            salon_resta = True
    elif(opcion == "4"):
        salonDeLaFama()
    elif(opcion == "5"):
        print("Saliendo...")
    else:
        print("Error ingrese una opcion valida...")
    input(" --- Presiona una tecla para continuar ---  ")