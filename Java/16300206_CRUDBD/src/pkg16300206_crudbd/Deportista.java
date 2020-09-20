/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_crudbd;

/**
 *La clase deportista se utiliza para simbolizar a un deportista de la tabla deportista de la base de datos
 * @author carlo
 */
public class Deportista {
    String Nombre;
    String Apellido;
    int Edad;

    /**
     * Crea un deportista con valores de inicializacion
     */
    public Deportista(){
        this.Nombre = "Sin nombre";
        this.Apellido = "Sin apellido";
        this.Edad = 0;
    }
    
    /**
     * Crea un deportista con valores asignados
     * @param nombre Es el nombre del deportista
     * @param apellido Es el apellido del deportista
     * @param edad Es la edad del deportista
     */
    public Deportista(String nombre,String apellido,int edad){
        this.Nombre = nombre;
        this.Apellido = apellido;
        this.Edad = edad;
    }
    
    /**
     * Retorna un string con Todos los campos del deportista
     * @return Retorna una cadena con todos los datos de un deportista
     */
    public String ToString(){
        return "Nombre: " + this.Nombre+ "Apellido " + this.Apellido + " Edad" + this.Edad;
    }
    
}
