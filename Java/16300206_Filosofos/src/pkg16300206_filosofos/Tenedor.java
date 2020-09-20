/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_filosofos;

/**
 * La clase tenedor nos representa un tenedor y solamente sirve para saber si esta libre o no
 * @author carlo
 */
public class Tenedor {
    private int id;
    private boolean libre = true;
    
    /**
     * Constructor del tenedor
     * @param id id del tenedor a crear
     */
    public Tenedor(int id){
        this.id = id;
    }
    
    /**
     * Esta funcion se encarga de esperar a que haya un tenedor libre y una vez que esta libre entonces tomara un tenedor 
     * @param i id del filosofo
     * @throws InterruptedException Excepcion en caso de que ocurra un InterruptedException
     */
    public synchronized void TomarTenedor(int i) throws InterruptedException{
        while(!libre){
            System.out.println("Filosofo [" + i + "] Esta esperando un tenedor");
            wait();
        }
        System.out.println("Filosofo [" + i + "] toma tenedor [" + id + "]");
        libre = false;
    }
    
    /**
     *  Esta funcion se encarga de notificar cuando hay un tenedor libre para ser tomado por un filosofo
     * @param i 
     */
    public synchronized void SoltarTenedor(int i){
        libre = true;
        System.out.println("Filosofo [" + i + "] Suelta el tenedor [" + id + "]");
        notify();
    }
}
