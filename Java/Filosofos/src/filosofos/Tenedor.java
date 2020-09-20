/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filosofos;

/**
 * Tenedor
 * tenedor que usan los filosofos
 * @author Angel
 */
public class Tenedor {
    private boolean ocupado; // esta ocupado?
    
    /**
     * Tenedor
     * constructor
     */
    public Tenedor(){
        ocupado = false;
    }
    
    /**
     * setOcupado
     * pone si esta ocupado o no el tenedor
     * @param ocupado esta ocupado el tenedor?
     */
    public void setOcupado(boolean ocupado){
        this.ocupado = ocupado;
    }
    
    /**
     * getOcupado
     * retorna si el tenedor esta ocupado
     * @return true si si esta ocupado y false si no lo esta
     */
    public boolean getOcupado(){
        return ocupado;
    }
}
