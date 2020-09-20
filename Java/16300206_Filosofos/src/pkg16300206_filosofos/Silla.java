/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_filosofos;

/**
 * La clase silla representa sillas en un cuarto, en  donde los filosofos se turnaran las sillas
 * @author carlo
 */
public class Silla {
    private int sLibre = 4;
    
    /**
     * Esta funcion se encarga de esperar hasta que haya una silla dispnible en caso de que tome una silla, resta una silla
     * @param i el id de elfilosofo que querra tomar la silla
     * @throws InterruptedException 
     */
    public synchronized void TomarSilla(int i) throws InterruptedException{
        while(sLibre == 0){
            System.out.println("Filosofo [" + i + "] Esta esperando una silla para tomar");
            wait();
        }
        System.out.println("Filosofo " + i + " toma una silla");
        sLibre--;
    }
    
    /**
     * Esta funcion se encarga de notificar que hay una silla disponible y que esta lista para ser tomada
     * @param i 
     */
    public synchronized void SoltarSilla(int i){
        sLibre++;
        System.out.println("Filosofo " + i + " suelta una silla");
        notify();
    }
}
