def insertionSort(l):
    for i in range(1, len(l)):
        first = l[i]
        j = i - 1
        while (j >= 0 and first < l[j]):
            l[j+1] = l[j]
            l[j] = first
            j -= 1
    return l

def busquedaBinaria(dato,lst):
    izquierda = 0
    derecha = len(lst)-1
    while(izquierda <= derecha):
        medio = (izquierda+derecha)//2
        if(lst[medio]==dato):
            return medio
        elif(lst[medio]>dato):
            derecha = medio - 1
        else:
            izquierda = medio + 1
    return None
        

def buscar(dato,lst):
    res = busquedaBinaria(dato,lst)
    if(res != None):
        return "El dato %d fue encontrado en el indice: [%d]"%(dato, res)
    else:
        return "Ese dato no existe"

lista = [9,8,7,6,2,1,4,5,23,3,3]
lista_nueva = insertionSort(lista)
print(lista_nueva)
#print(lista_nueva)
dato = int(input("Que numero quiere buscar: "))
print(buscar(dato,lista_nueva))