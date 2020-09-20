/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_crud;

/**
 *
 * @author carlo
 */
public class Deportista {

    private String nombre;
    private Integer edad;
    private String deporte;
    private String mejorprueba;
    private String mejortiempo;

     @Override
    public String toString() { 
        return "-----------------------" + "\nNombre: " + nombre +" \nEdad: "+ edad + " \nDeporte: " + deporte + " \nMejor Prueba: " + mejorprueba + " \nMejor Tiempo: " + mejortiempo ;
    }
    
    public Deportista() {
        this.nombre = "Sin nombre";
        this.edad = 0;
        this.deporte = "Sin deporte";
        this.mejorprueba = "No tiene pruebas";
        this.mejortiempo = "00:00:00:00";
    }
    
    public Deportista(String nombre, Integer edad, String deporte, String mejorprueba, String mejortiempo) {
        this.nombre = nombre;
        this.edad = edad;
        this.deporte = deporte;
        this.mejorprueba = mejorprueba;
        this.mejortiempo = mejortiempo;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getDeporte() {
        return deporte;
    }

    public void setDeporte(String deporte) {
        this.deporte = deporte;
    }

    public String getMejorprueba() {
        return mejorprueba;
    }

    public void setMejorprueba(String mejorprueba) {
        this.mejorprueba = mejorprueba;
    }

    public String getMejortiempo() {
        return mejortiempo;
    }

    public void setMejortiempo(String mejortiempo) {
        this.mejortiempo = mejortiempo;
    }
    
   
}
