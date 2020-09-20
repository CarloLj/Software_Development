/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejecucion;

/**
 *
 * @author ismae
 */
public class Ejecucion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Thread uno = new Prueba(1,50000);
        Thread dos = new Prueba(2,100000);
        Thread tres = new Prueba(3,750000);
        
        uno.start();
        dos.start();
        tres.start();
        
    }  
    
    
}
