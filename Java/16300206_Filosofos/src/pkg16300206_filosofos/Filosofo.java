/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_filosofos;

import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Esta clase representa a un filosofo que a su vez tiene un constructor con el id, dos tenedors y una silla, este filosofo extiende a thread ya que es un hilo por cada uno de los filosofos
 * perimitiendo asi que este filosofo tenga sus propias tareas a la vez que los demas 
 * @author carlo
 */
public class Filosofo extends Thread{
    private int id;
    private Tenedor izquierda,derecha;
    private Silla s;
    public int vecescomidas;
    
    /**
     * Constructor de nuestro comensal(filosofo) no puse que espere para tomar el tenedor ya que espera hasta que esten los dos libres, asi que solamente tiene tiempo de espera para comer y despues tiene tiempo para pensar
     * @param id el id del filosofo
     * @param izquierda el tenedor que tomara a su izquierda
     * @param derecha el tenedor que tomara a su derecha
     * @param s la silla que tomara
     */
    public Filosofo(int id, Tenedor izquierda, Tenedor derecha, Silla s){
        this.id = id;
        this.izquierda = izquierda;
        this.derecha = derecha;
        this.s=s;
    }
    
    /**
     * Esta funcion corre el hilo hasta que el filosofo coma 10 veces, ya que habra quedado satisfecho
     */
    @Override
    public void run(){
        while(vecescomidas<10){
            try {
                s.TomarSilla(id);
                //Tomar tenedores
                izquierda.TomarTenedor(id);
                derecha.TomarTenedor(id);
                System.out.println("El filosofo " + id + " Esta comiendo");
                esperar(2); //Espera dos segundos para terminar de comer
                //Soltar tenedores
                derecha.SoltarTenedor(id);
                izquierda.SoltarTenedor(id);
                System.out.println("El filosofo " + id + " Termino de comer");
                s.SoltarSilla(id);
                int numero = (int)(Math.random()*4+1);
                System.out.println(seleccionarquepensar(numero, id));
                vecescomidas++;
                esperar(2); //Espera dos segundos para pensar antes de volver a comer
            } catch (InterruptedException ex) {
                Logger.getLogger(Filosofo.class.getName()).log(Level.SEVERE, null, ex);
            }     
        }
        System.out.println("El filosofo " + id + " Comio tantas veces que se murio de indigestion (se ha terminado su hilo) Descanse en Paz");
    }
    
    /**
     * Esta funcion escoje un pensamiento random entre cuatro disponibles
     * @param numero numero random de 1-4
     * @param id id del filosofo
     * @return retorna un string con el pensamiento
     */
    private String seleccionarquepensar(int numero, int id){
        String quepenso = "";
        switch(numero){
            case 1:
                quepenso = "El filosofo ["+ id + "] Esta pensando en la inmortalidad del cangrejo";
            break;
            
            case 2: 
                quepenso = "El filosofo ["+ id + "] Esta pensando en la chica que no lo quiere";
            break;
            
            case 3:
                quepenso = "El filosofo ["+ id + "] Esta pensando en que ya se harto de cenar lo mismo";
            break;
            
            case 4:
                quepenso = "El filosofo ["+ id + "] Esta pensando en que los programadores son la mera tola";
            break;
            
            default: 
                quepenso = "El filosofo ["+ id + "] No sabe en que pensar";
                break;
        }
        return quepenso;
    }
    
    /**
     * Espera cierto numero de segundos
     * @param segundos segundo a esperar
     */
    public void esperar (int segundos) {
        try {
            Thread.sleep (segundos*1000);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
