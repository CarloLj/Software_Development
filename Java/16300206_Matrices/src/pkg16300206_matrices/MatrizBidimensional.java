/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_matrices;

/**
 * MatrizBidimensional es una clase que simula un objeto matriz bidimensional, es decir tiene dos valores, sus filas y sus columnas
 * @author carlo
 */
public class MatrizBidimensional {

    int filas;
    int columnas;
    int[][] matriz;
    
    /**
     * Esta funcion se encarga de construir una nueva matriz bidimensional, recibe dos valores: las filas y las columnas que tendra
     * @param filas Las filas de la matriz a construir
     * @param columnas Las columnas de la matriz a construir
     */
    public MatrizBidimensional(int filas, int columnas) {
        this.filas = filas;
        this.columnas = columnas;
        this.matriz = new int[filas][columnas];
    }
    
}
