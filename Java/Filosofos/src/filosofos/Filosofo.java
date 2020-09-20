/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filosofos;

/**
 * Filosofo
 * esta clase "hace" la accion que le toca al filosoco por medio de un hilo,
 * guarda su filodof a la derecha y la izquierda
 * @author Angel
 */
public class Filosofo{
    
    /**
     * Posibles acciones de un filosofo
     */
    public enum FilosofoState{ 
        comiendo,
        pensando
    }
    
    int index; //indice en la lista de la mesa de este filosofo (id)
    static Mesa mesa; //mesa en donde esta sentado
    
    Filosofo der, izq; // filosofos a su derecha e izquierda
    Tenedor tenedorDer; // tenedor a su derecha
    FilosofoState estado;  // accion que esta o estaba realizando
    boolean done; // ya termino la accion pasada?
    
    Thread accion; // hilo que "realiza" la accion
    
    /**
     * Constructor
     * @param index indice del filosofo
     * @param mesa mesa donde esta sentado el filosofo
     */
    public Filosofo(int index, Mesa mesa){
        this.index = index;
        this.mesa = mesa;
        estado = FilosofoState.pensando;
        tenedorDer = new Tenedor();
        done = true;
       
    }
    
    /**
     * setIzq
     * colocas un filosofo en la izquierda de este filosofo
     * @param izq filosofo que esta en la izquierda de este filosofo
     */
    public void setIzq(Filosofo izq){
        this.izq = izq;
    }
    
    /**
     * setDer
     * colocas un filosofo en la derecha de este filosofo
     * @param izq filosofo que esta en la derecha de este filosofo
     */
    public void setDer(Filosofo der){
        this.der = der;
    }
    
    /**
     * setEstado
     * accion que va a realizar el filosofo
     * @param estado accion que va a realizar
     */
    public void setEstado(FilosofoState estado){
        this.estado = estado;
        done = false;
    }
    
    /**
     * beginAccion
     * comienza el hilo para realizar la accion
     */
    public void beginAccion(){
        done = false;
        accion = new FilosofoAccion(mesa,this);
        accion.start();
    }
    
    /**
     * toString
     * combienrte el filosofo en string 
     * @return retorna al filosof en string
     */
    @Override
    public String toString() {
        String s = "";
        if(estado == FilosofoState.comiendo)
            s = "comiendo";
        else if(estado == FilosofoState.pensando)
            s = "pensando";
        return " Filosofo #"+index +", estado: "+s + " completado: " + done;
    }
}
