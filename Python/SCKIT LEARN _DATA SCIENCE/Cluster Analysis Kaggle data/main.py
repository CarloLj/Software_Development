import pandas as pd
import matplotlib.pyplot as plt

from google.colab import drive
drive.mount("/content/drive")
path1 = pd.read_csv('/content/Wholesale_customers_data.csv')
#path1.head()
#path1.dtypes
#path1.shape[0] 
indices = []

for i in range(100,path1.shape[0]-300):
  indices.append(i)
muestras = pd.DataFrame(path1.loc[indices],columns = path1.keys()).reset_index(drop = True)
"""path1 = path1.drop(['Region', 'Channel'], axis = 1)
muestras = muestras.drop(['Region', 'Channel'], axis = 1)"""

from sklearn import preprocessing
data_escalada = preprocessing.Normalizer().fit_transform(muestras) #Como tenian muchas variaciones los hacemos mas pequeños

from sklearn.cluster import KMeans
X = data_escalada.copy()
#hallar el valor optimo de K aplicando el metodo de codo
#Se calcula el algoritmo de agrupacion para diferentes valores de K
inercia = []
for i in range(1,len(data_escalada)+1):
  algoritmo = KMeans(n_clusters= i, init = 'k-means++', max_iter = 300, n_init = 10)
  algoritmo.fit(X)
  #Para cada K se calcula a suma total del cuadrado dentro del cluster 
  inercia.append(algoritmo.inertia_)

algoritmo = KMeans(n_clusters=6,init = 'k-means++', max_iter = 300, n_init = 10)
#Se entrena el algoritmo
algoritmo.fit(X)
#se obtienen los datos de los centroides y las etiquetas
centroides, etiquetas = algoritmo.cluster_centers_,algoritmo.labels_
muestra_prediccion = algoritmo.predict(data_escalada)
##
#for i,pred in enumerate(muestra_prediccion):
#print("Muestra", i, "Se encuentra en el cluster:", pred)"""

indicesfin = []
for i in range(1,path1.shape[0]):
  indicesfin.append(i)
XS = pd.DataFrame(path1.loc[indicesfin],columns = path1.keys()).reset_index(drop = True)
"""path1 = path1.drop(['Region', 'Channel'], axis = 1)"""
#XS = muestras.drop(['Region', 'Channel'], axis = 1)
from sklearn import preprocessing
data_escalada2 = preprocessing.Normalizer().fit_transform(XS) #Como tenian muchas variaciones los hacemos mas pequeños

from sklearn.cluster import KMeans
XS = data_escalada2.copy()

from sklearn.decomposition import PCA
modelo_pca = PCA(n_components = 2)
modelo_pca.fit(XS)
pca = modelo_pca.transform(XS)
centroides_pca = modelo_pca.transform(centroides)

algoritmo.fit(XS)
etiquetas2 = algoritmo.labels_

colores = ['blue','red', 'green', 'orange', 'gray', 'brown']

colores_cluster = [colores[etiquetas2[i]] for i in range(len(pca))]

plt.scatter(pca[:,0], pca[:,1], c = colores_cluster, marker = 'o', alpha = 0.4)

plt.scatter(centroides_pca[:,0], centroides_pca[:,1], marker = 'x', s = 100, linewidths = 3, c = colores)

xvector = modelo_pca.components_[0] * max(pca[:,0])
yvector = modelo_pca.components_[1] * max(pca[:,1])
columnas = path1.columns
for i in range(len(columnas)):
  plt.arrow(0,0,xvector[i], yvector[i], color = 'black', width = 0.0005, head_width = 0.02, alpha = 0.75)
  plt.text(xvector[i], yvector[i], list(columnas)[i], color = 'black', alpha = 0.75)