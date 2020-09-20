/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package funciones;
import java.util.Scanner;
/**
 *
 * @author carlo
 */
public class Funciones {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Scanner reader = new Scanner(System.in);
        int iNumero;
        iNumero = reader.nextInt();
        
        
        
        /*
        int numeroaimprimir = 0;
        int espacio = iNumero;
        for(int x2 = 0; x2 <= iNumero; x2++){
            
            for(int c = 0 ; c < espacio ; c++){
            System.out.print(" ");
            }
            
            if(x2 % 2 != 0){
                numeroaimprimir = x2;
                espacio = numeroaimprimir;
                for(int x3 = 0; x3 < numeroaimprimir; x3++){
                System.out.print("x");
                }
            }
            System.out.println("");
        }
*/
        factorial(iNumero);
        divisibles(iNumero);
        piramide(iNumero);
    }
    
    public static void factorial(int iNumero){
        int iFactorial = 1;
        for (int x=2;x<=iNumero;x++){
            iFactorial = iFactorial * x;
        }
        System.out.println("El factorial del número " + Integer.toString(iNumero) +  " es " + Integer.toString(iFactorial));
    }
    
    public static void divisibles(int iNumero){
        for(int x1 = 2 ; x1 <= iNumero; x1++){
                if(iNumero % x1 == 0){
                    System.out.println("Numero divisible sin residuo: " + Integer.toString(x1));
                }
        }
    }
    
    public static void piramide(int iNumero){
        for(int altura = 1; altura<=iNumero; altura++){
            //Espacios en blanco
            for(int blancos = 1; blancos<=iNumero-altura; blancos++){
                System.out.print(" ");
            }
 
            //Asteriscos
            for(int asteriscos=1; asteriscos<=(altura*2)-1; asteriscos++){
                System.out.print("x");
            }
            System.out.println();
        }
    }
}
