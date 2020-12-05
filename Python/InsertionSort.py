lista = [9,8,7,6,2,1,4,5,23,3,3]
for i in range(1, len(lista)):
    first = lista[i]
    j = i - 1
    while (j >= 0 and first < lista[j]):
        lista[j+1] = lista[j]
        lista[j] = first
        j -= 1
print(lista)

"""Hasta que llegue a la posicion 0 de nuestro arreglo o el del
indice anterior sea menor va recorriendo hacia la izquierda"""