/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mathpow;

import java.util.Scanner;

/**
 *
 * @author carlo
 */
public class MathPow {

    private static Scanner teclado;
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        teclado = new Scanner(System.in);
        
        System.out.print("Elevacion a la");
        int exponente = teclado.nextInt();
        System.out.print("Ingrese numero a elevar");
        int numero = teclado.nextInt();
        double eleavaicon = Math.pow(numero,exponente);
        System.out.print(eleavaicon);
        int wait = teclado.nextInt();
    }
    
}
