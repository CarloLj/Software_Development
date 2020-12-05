def busquedaLineal(dato):
    for x in range(len(lista)):
        if(lista[x] == dato):
            return x
    return None

def buscar(dato):
    res = busquedaLineal(dato)
    if(res==None):
        return "El dato %d no se encontró"%(dato)
    else:
        return "El dato %d se encontro en el indice: %d"%(dato,res)

lista = [9,8,7,6,2,1,4,5,23,3,3]
dato = int(input("Que numero quiere buscar: "))
print(buscar(dato))