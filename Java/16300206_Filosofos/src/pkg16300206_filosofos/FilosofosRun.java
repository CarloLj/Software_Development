/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_filosofos;

/**
 *
 * @author carlo
 */
public class FilosofosRun {

    /**
     * Esta funcion se encarga de inicializar el programa generando la escena, 5 comensales(filosofos) , 5 tenedores, y 4 sillas
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Silla s = new Silla();
        Tenedor[] tenedores = new Tenedor[5];
        
        for(int i    = 0; i<tenedores.length; i++){
            tenedores[i] = new Tenedor(i);
        }
        
        Filosofo[] filosofos = new Filosofo[5];
        for(int i= 0; i<filosofos.length; i++){
            filosofos[i] = new Filosofo(i, tenedores[i], tenedores[(i+1)%5], s);
        }
        
        for(int i = 0; i<filosofos.length;i++){
            filosofos[i].start(); //Iniciamos el thread para cada uno de los filosofos
        }
    }
    
}
