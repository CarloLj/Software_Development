import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
"""from mpl_toolkits.mplot3d import Axes3D"""
from sklearn.linear_model import LinearRegression
from sklearn.metrics import r2_score

path1 = 'Registro_Final_Carlo.csv'
df1 = pd.read_csv(path1, index_col=1)
Df_Fechas = df1['Fecha']
Y = df1['Calorias (kcal)']
X1 = df1['Carbohidratos (g)']
X2 = df1['Lípidos (g)']
X3 = df1['Proteína (g)']
SF2 = df1[['Calorias (kcal)', 'Carbohidratos (g)', 'Lípidos (g)', 'Proteína (g)']]
SF2.head()
df1.isnull().sum()
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.scatter(Y, X1, X2, c=['green'], marker='.', s=50)
ax.set_xlabel('Calorias')
ax.set_ylabel('Carbohidratos')
ax.set_zlabel('Lípidos')
#plt.show()
lista = ['Carbohidratos (g)', 'Lípidos (g)', 'Proteína (g)']

ind_var = df1[lista]
dep_var = df1['Calorias (kcal)']
regressor = LinearRegression()
regressor.fit(ind_var, dep_var)

df1['Calorias Predichas (kcal)'] = regressor.predict(ind_var)
df1.head()
df2 = df1[['Calorias Predichas (kcal)','Calorias (kcal)','Carbohidratos (g)','Lípidos (g)', 'Proteína (g)']]
df2.head()

precision = r2_score(dep_var, regressor.predict(ind_var))
print("La precision del modelo es", precision*100, "%")

Y2 = df2['Calorias Predichas (kcal)']
Y1 = df1['Calorias (kcal)']

diffY = Y2-Y1
equis1 = df2['Carbohidratos (g)']
equis2 = df2['Lípidos (g)']
equis3 = df1['Proteína (g)']
#-------------------------------------------------------------------
fig = plt.figure()
ax = fig.add_subplot(111, projection = '3d')
ax.scatter(equis1,equis2, diffY, c ='red', marker = '.', s = 100)
ax.set_xlabel('Carbohidratos')
ax.set_ylabel('Grasas')
ax.set_zlabel('Diferencia en Calorias')
#-------------------------------------------------------------------
fig = plt.figure()
ax = fig.add_subplot(111, projection = '3d')
ax.scatter(equis3,equis2, diffY, c ='skyblue', marker = '.', s = 100)
ax.set_xlabel('Proteinas')
ax.set_ylabel('Grasas')
ax.set_zlabel('Diferencia en Calorias')
#-------------------------------------------------------------------
fig = plt.figure()
ax = fig.add_subplot(111, projection = '3d')
ax.scatter(equis1,equis2, equis3, c ='blue', marker = '.', s = 100)
ax.set_xlabel('Carbohidratos')
ax.set_ylabel('Grasas')
ax.set_zlabel('Proteínas')
#-------------------------------------------------------------------
plt.show()
Calsxdia = []
anterior = Df_Fechas[0][0:2]
sumacalsxdia = 0
for i in range(1, len(Df_Fechas)):
    if((Df_Fechas[i][0:2])==anterior):
        sumacalsxdia += Y[i]
    else:
        anterior = Df_Fechas[i][0:2]
        Calsxdia.append(sumacalsxdia)
        sumacalsxdia = 0
        sumacalsxdia += Y[i]

figurine = plt.figure()
dfcalorias = pd.DataFrame({"Calorias por dia": Calsxdia})
figurine = plt.plot(np.linspace(0,85,85),Calsxdia)
plt.xlabel("Dia", color= "black")
plt.ylabel("Cantidad de calorías", color= "black")
plt.show()

suma = 0
prom = 0
for i in Calsxdia:
  suma+=i
prom = suma/len(Calsxdia)
if(prom<2000):
  print("El promedio de calorias consumidas en estos", str(len(Calsxdia)), "dia(s) fue de:", str(prom), "lo cual es un poco bajo")
elif(prom>2400 and prom<3000):
  print("El promedio de calorias consumidas en estos ", str(len(Calsxdia)), "dia(s) fue de: ", str(prom), "lo cual es un perfecto")
else:
  print("El promedio de calorias consumidas en estos ", str(len(Calsxdia)), "dia(s) fue de: ", str(prom), "lo cual es arriba de lo normal")

Carbohidratos = float(input('Ingrese los carbohidratos del alimento: '))
Grasas = float(input('Ingrese los lipidos del alimento: '))
Proteinas = float(input('Ingrese las proteinas del alimento: '))
lista_pred = [[Carbohidratos, Grasas, Proteinas]]
resp = regressor.predict(lista_pred)
print('Calorias predichas: ' + str(resp))