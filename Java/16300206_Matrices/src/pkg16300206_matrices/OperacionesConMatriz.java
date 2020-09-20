/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_matrices;

/**
 * Esta clase permite hacer las operaciones basicas para coco de una matriz
 * @author carlo
 */
public class OperacionesConMatriz {
    
    /**
     * La funcion sumar suma dos matrices bidimensionales
     * @param mat1 La primer matriz a sumar
     * @param mat2 La segunda matriz a sumar
     * @return Retorna la suma de las dos matrices recibidas
     */
    public int[][] sumar(int[][] mat1, int[][] mat2) {
        
        int[][] matrizSumada = new int[mat1.length][mat1[0].length];
        
        for(int i = 0; i < mat1.length; i++){
            for(int j = 0; j < mat1[0].length; j++){
                matrizSumada[i][j] = mat1[i][j] + mat2[i][j];
            }
        }
        return matrizSumada;
    }

    /**
     * La funcion sumar resta dos matrices bidimensionales
     * @param mat1 La primer matriz a restar
     * @param mat2 La segunda matriz a restar
     * @return Retorna la resta de las dos matrices recibidas
     */
    public int[][] restar(int[][] mat1, int[][] mat2) {
        
        int[][] matrizSumada = new int[mat1.length][mat1[0].length];
        
        for(int i = 0; i < mat1.length; i++){
            for(int j = 0; j < mat1[0].length; j++){
                matrizSumada[i][j] = mat1[i][j] - mat2[i][j];
            }
        }
        return matrizSumada;
    }
    
    /**
     * La funcion multiplicar multiplica dos matrices bidimensionales
     * @param mat1 La primer matriz a multiplicar
     * @param mat2 La segunda matriz a multiplicar
     * @return Retorna la multiplicacion de las dos matrices recibidas
     */
    public int[][] multiplicar(int[][] mat1, int[][] mat2) {
        
        int[][] matrizMultiplicada = new int[mat1[0].length][mat2.length];
        
        for (int i = 0; i < mat1.length; i++) {
            for (int j = 0; j < mat2[0].length; j++) {
                for (int k = 0; k < mat1[0].length; k++) {
                    // aquí se multiplica la matriz
                    matrizMultiplicada[i][j] += mat1[i][k] * mat2[k][j];
                }
            }
        }
        return matrizMultiplicada;
    }
    
    /**
     * La funcion transponer intercambia las filas por columnas de la matriz ingresada
     * @param mat recibe la matriz a transponer
     * @return Retorna la matriz transpuesta
     */
    public int[][] transponer(int[][] mat) {
        
        int[][] matrizMultiplicada = new int[mat[0].length][mat.length];
        
        for(int x = 0 ; x < mat.length; x++){
            for(int y = 0 ; y < mat[0].length; y++){
                matrizMultiplicada[y][x] = mat[x][y];
            }
        }

        return matrizMultiplicada;
    }
    
    /**
     * La funcion imprimir matriz imprime la matriz recibida 
     * @param matrizAImprimir La matriz a imprimir
     */
    public void ImprimirMatriz(int[][] matrizAImprimir){
        for(int i = 0 ; i< matrizAImprimir.length; i++){
            for(int j = 0 ; j < matrizAImprimir[0].length; j++){
                System.out.print("[");
                System.out.print(matrizAImprimir[i][j] + "]");
            }
            System.out.println("");
        }
    }
    
    /**
     * VerifyEquality recibe dos matrices para verificar que sean iguales, en caso de serlo retorna un true en caso de no, un false
     * @param mat1 matriz uno a verificar si es igual
     * @param mat2 matriz dos a verificar si es igual
     * @return Retorna la primer matriz es igual a la segunda (true/false)
     */
    public boolean VerifyEquality(int[][] mat1, int[][] mat2){
        if(mat1.length == mat2.length && mat1[0].length == mat2[0].length){
            return true;
        }
        else{
            return false;
        }
    }
    
    /**
     * La funcion VerifyMultiplicity recibe dos matrices y las compara, para ver si se pueden multiplicar o no
     * @param mat1 La primer matriz a verificar
     * @param mat2 La segunda matriz a verificar
     * @return Retorna si es o no es multiplicable (true/false)
     */
    public boolean VerifyMultiplicity(int[][] mat1, int[][] mat2){
        if(mat1[0].length == mat2.length){
            return true;
        }
        else{
            return false;
        }
    }
    

    /**
     * La funcion determinante saca la determinante de la matriz bidimensional recibida, en caso de medir uno por uno entonces retorna el valor de (0,0), la variable det guarda el valor de la determiannte hasta temrminar el ciclo
     * @param mat La matriz a sacar la determiante
     * @return Retorna un valor entero con la determimante
     */
    public int determinante(int mat[][]) {
        int det = 0;
 
        if (mat.length == 1) {
            return mat[0][0];
 
        } else {
            for (int j = 0; j < mat.length; j++) {
                det = det + mat[0][j] * cof(mat, 0, j);
            }
        }
        return det;
    }

    /**
     * La funcion cof se encarga de crear submatrices en las que se le vuelve a sacar la determiannte, esta funcion debe ser usada como un metodo por la funcion determinante
     * @param mat La matriz a sacar su submatriz
     * @param fila La fila en donde empieza 
     * @param columna La columna actual en la que se encuentra la matriz
     * @return Retorna el valor determinante sumado por cada ciclo y submatriz 
     */
    public int cof(int mat[][], int fila, int columna) {
 
        int submatriz[][];
        int n = mat.length - 1;
        
        submatriz = new int[n][n];
        int x = 0;
        int y = 0;
        for (int i = 0; i < mat.length; i++) {
            for (int j = 0; j < mat.length; j++) {
                if (i != fila && j != columna) {
                    submatriz[x][y] = mat[i][j];
                    y++;
                    if (y >= n) {
                        x++;
                        y = 0;
                    }
                }
            }
        }
        return (int)Math.pow(-1.0, fila + columna) * determinante(submatriz);
    }
    
}
