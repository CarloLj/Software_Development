/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejecucion;

public class Prueba extends Thread {
    private int value;
    private int id;
    
    public Prueba(int id, int value)
    {
        this.value = value;
        this.id = id;
    }

    @Override
    public void run() 
    {
        for (int i=0 ; i < value; i ++)
        {
            System.out.println(id + " - " + i);
        }
    }                   
}
