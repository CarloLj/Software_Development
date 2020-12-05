/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author fabio
 */
public class Materia {
    String nombre;
    String grado;
    
    public Materia(){
        nombre = "-";
        grado = "99°";
    }
    
    public Materia(String _nombre, String _grado){
        nombre = _nombre;
        grado = _grado;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }
}
