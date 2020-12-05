lista = [9,8,7,6,2,1,4,5,23,3]
print(lista)
for i in range(len(lista)):
    for j in range(len(lista)-1):
        if(lista[j]>lista[j+1]):
            temp = lista[j]
            lista[j] = lista[j+1]
            lista[j+1] = temp
    print(lista)
print(lista)
            