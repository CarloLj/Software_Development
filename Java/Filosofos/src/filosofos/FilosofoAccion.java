/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filosofos;

/**
 * FilosofoAccion
 * Hilo que realiza la accion del filosofo
 * @author Angel
 */
public class FilosofoAccion extends Thread{
    
    static Mesa mesa; // mesa del filosofo
    Filosofo filosofo; // filosofo
    
    /**
     * FilosofoAccion
     * accion del filosoco
     * @param mesa mesa del filosofo
     * @param filosofo filosofo que realiza la accion
     */
    public FilosofoAccion(Mesa mesa, Filosofo filosofo){
        this.mesa = mesa;
        this.filosofo = filosofo;
    }
    
    /**
     * run
     * metodo que realiza la accion, si el filosofo esta comiendo revisa que los 
     * tenedores que necesita esten libres, si estan libes los toma, si no lo 
     * estan imprime un mensaje de que tenedor esta ocupado.
     * Realiza un for de 500000 ciclos para hacer tiempo y luego le indica a la
     * mesa que este filosofo ya termino su accion
     */
    @Override
    public void run(){
        if(filosofo.estado == Filosofo.FilosofoState.comiendo){
            if(filosofo.tenedorDer.getOcupado() && filosofo.der.estado == Filosofo.FilosofoState.comiendo)
                System.out.println("TENEDOR OCUPADO: derecho #" + filosofo.index);
            else
                filosofo.tenedorDer.setOcupado(true);
            if(filosofo.izq.tenedorDer.getOcupado() && filosofo.izq.estado == Filosofo.FilosofoState.comiendo)
                System.out.println("TENEDOR OCUPADO: izquierdo #" + filosofo.index);
            else
                filosofo.izq.tenedorDer.setOcupado(true);
        }
        for(int i = 0; i < 500000; i++ ){
            //tiempo
        }
        mesa.filosofoDone(filosofo.index);
    }
}
