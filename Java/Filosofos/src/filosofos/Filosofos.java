/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filosofos;

/**
 * Filosofos
 * Esat clase crea una mesa para 5 filosofos
 * @author Angel
 */
public class Filosofos {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        Mesa mesa = new Mesa(5);  
        mesa.Start();
        
    }
    
}
