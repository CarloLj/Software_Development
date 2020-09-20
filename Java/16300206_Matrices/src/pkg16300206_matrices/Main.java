/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_matrices;

import pkg16300206_matrices.MatrizBidimensional;
import pkg16300206_matrices.OperacionesConMatriz;
import java.util.Scanner;
/**
 *Esta clase solo contiene un main, en el se leen dos matrices y despues se coloca un menu que te permite hacer operaciones basicas como suma, resta, multiplicacion, transponer o sacar la determianante de las matrices ingresadas
 * @author carlo
 */
public class Main {

    private static Scanner teclado;
    /**
     * Esta funcion main lee dos matrices para despues permitir hacer operaciones con ellas, se muestra un menu hasta que quieras salir
     * @param args
     */
    public static void main(String[] args) {
        
        MatrizBidimensional matriz1;
        MatrizBidimensional matriz2;
        OperacionesConMatriz operacion = new OperacionesConMatriz();
        
        teclado = new Scanner(System.in);
        boolean salir = false;
        System.out.print("Cuantas filas tiene la matriz 1?:");
        int m1filas = teclado.nextInt();
        System.out.print("Cuantas columnas tiene la matriz 1?:");
        int m1columnas = teclado.nextInt();
        System.out.print("Cuantas filas tiene la matriz 2?:");
        int m2filas = teclado.nextInt();
        System.out.print("Cuantas columnas tiene la matriz 2?:");
        int m2columnas = teclado.nextInt();
        
        matriz1 = new MatrizBidimensional(m1filas,m1columnas);
        matriz2 = new MatrizBidimensional(m2filas,m2columnas);
        
        System.out.println("----VALORES DE LA PRIMER MATRIZ----");
        for(int f=0;f<matriz1.matriz.length;f++) {
            for(int c=0;c<matriz1.matriz[f].length;c++) {
                System.out.print("Ingrese valor de fila ["+ f + "] columna [" + c +"] :");
                matriz1.matriz[f][c]=teclado.nextInt();
            }
        }
        
        System.out.println("----Ingresar VALORES DE LA SEGUNDA MATRIZ----");
        for(int f=0;f<matriz2.matriz.length;f++) {
            for(int c=0;c<matriz2.matriz[f].length;c++) {
                System.out.print("Ingrese valor de fila["+ f + "] columna [" + c +"] :");
                matriz2.matriz[f][c]=teclado.nextInt();
            }
        }
        
        do{
        System.out.println("-------------------------------------------");
        System.out.println("Ingresa que quieres hacer con tus matrices");
        System.out.println("[1] Sumar Matrices");
        System.out.println("[2] Restar Matrices");
        System.out.println("[3] Multiplicar Matrices");
        System.out.println("[4] Transponer Matrices");
        System.out.println("[5] Sacar la Determimante de las Matrices");
        System.out.println("[6] Salir");
        System.out.println("-------------------------------------------");
        
        int seleccion = teclado.nextInt();
        switch(seleccion){
            
            case 1:
                if(operacion.VerifyEquality(matriz1.matriz, matriz2.matriz)){
                    operacion.ImprimirMatriz(operacion.sumar(matriz1.matriz, matriz2.matriz));
                    System.out.println("Presiona culaquier tecla para continuar");
                    new java.util.Scanner(System.in).nextLine();
                }
                else{
                    System.out.println("Para poder sumar las matrices es necesario que sean de los mismos tamaños...");
                    new java.util.Scanner(System.in).nextLine();
                }
                break;
                
            case 2:
                if(operacion.VerifyEquality(matriz1.matriz, matriz2.matriz)){
                    operacion.ImprimirMatriz(operacion.restar(matriz1.matriz, matriz2.matriz));
                    System.out.println("Presiona culaquier tecla para continuar");
                    new java.util.Scanner(System.in).nextLine();
                }
                else{
                    System.out.println("Para poder restar las matrices es necesario que sean de los mismos tamaños...");
                    new java.util.Scanner(System.in).nextLine();
                }
                break;
                
            case 3:
                if(operacion.VerifyMultiplicity(matriz1.matriz, matriz2.matriz)){
                    operacion.ImprimirMatriz(operacion.multiplicar(matriz1.matriz, matriz2.matriz));
                    System.out.println("Presiona culaquier tecla para continuar");
                    new java.util.Scanner(System.in).nextLine();
                }
                else{
                    System.out.println("Para poder multiplicar las matrices es necesario que el numero de columnas de la primera matriz sea igual al numero de filas de la segunda matriz");
                    new java.util.Scanner(System.in).nextLine();
                }
                break;
            case 4:
                System.out.println("¿Que matriz quiere transponer?");
                System.out.println("[1]");
                System.out.println("[2]");
                int selecciontranspuesta = teclado.nextInt();
                switch(selecciontranspuesta){
                    case 1:
                        operacion.ImprimirMatriz(operacion.transponer(matriz1.matriz));
                        System.out.println("Presiona culaquier tecla para continuar");
                        new java.util.Scanner(System.in).nextLine();
                        break;
                    
                    case 2:
                        operacion.ImprimirMatriz(operacion.transponer(matriz2.matriz));
                        System.out.println("Presiona culaquier tecla para continuar");
                        new java.util.Scanner(System.in).nextLine();
                        break;
                    
                    default:
                        System.out.println("Usted se equivoco, seleccionando la primer matriz por defecto");
                        operacion.ImprimirMatriz(operacion.transponer(matriz1.matriz));
                        System.out.println("Presiona culaquier tecla para continuar");
                        new java.util.Scanner(System.in).nextLine();
                        break;
                }
                
                break;
            case 5:
                System.out.println("¿De que matriz quieres sacar la determinante?");
                System.out.println("[1]");
                System.out.println("[2]");
                int selecciondeterminante = teclado.nextInt();
                switch(selecciondeterminante){
                    case 1:
                        if(matriz1.matriz.length < 10){
                            System.out.println(operacion.determinante(matriz1.matriz));
                            System.out.println("Presiona culaquier tecla para continuar");
                            new java.util.Scanner(System.in).nextLine();
                        }else{
                            System.out.println("Tiene que ser menor que 10 * 10");
                            new java.util.Scanner(System.in).nextLine();
                        }
                        break;
                    
                    case 2:
                        if(matriz1.matriz.length < 10){
                            System.out.println(operacion.determinante(matriz2.matriz));
                            System.out.println("Presiona culaquier tecla para continuar");
                            new java.util.Scanner(System.in).nextLine();
                        }else{
                            System.out.println("Tiene que ser menor que 10 * 10");
                            new java.util.Scanner(System.in).nextLine();
                        }
                        break;
                    
                    default:
                        System.out.println("Usted se equivoco, seleccionando la primer matriz por defecto");
                        System.out.println(operacion.determinante(matriz1.matriz));
                        System.out.println("Presiona culaquier tecla para continuar");
                        new java.util.Scanner(System.in).nextLine();
                        break;
                }
                break;
            case 6:
                salir = true;
                break;
            default:
                System.out.print("Selecciona una opcion valida");
                break;
        }
        }while(!salir);
    }
}
