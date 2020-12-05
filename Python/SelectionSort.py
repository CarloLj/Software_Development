lista = [9,8,7,6,2,1,4,5,23,3]
print(lista)
for i in range(len(lista)):
    minimo = i
    for j in range(i, len(lista)):
        if lista[j] < lista[minimo]:
            minimo = j
    temp = lista[i]
    lista[i] = lista[minimo]
    lista[minimo] = temp
print(lista)