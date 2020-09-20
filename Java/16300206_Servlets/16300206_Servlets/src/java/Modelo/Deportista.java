/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 * Esta clase es un objeto deportista con sus parametros de acuerdo a lo mas importante del deportista
 * @author carlo
 */
public class Deportista {

    public int id;
    public String Nombre;
    public String Apellidos;
    public int Edad;
    public String Deporte;
    
    /**
     * Constructor sin id para un deportista
     * @param Nombre Nombre del deportista
     * @param Apellidos Apellidos del deportista
     * @param Edad Edad del deportista
     * @param Deporte Deporte del deportista
     */
    public Deportista(String Nombre, String Apellidos, int Edad, String Deporte) {
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Edad = Edad;
        this.Deporte = Deporte;
    }
    
    /**
     * Constructor con id definido para un depotista
     * @param id id del deportista
     * @param Nombre nombre del deportista
     * @param Apellidos apellidos del deportista
     * @param Edad edad del deportista
     * @param Deporte Deporte del deportista
     */
    public Deportista(int id, String Nombre, String Apellidos, int Edad, String Deporte) {
        this.id = id;
        this.Nombre = Nombre;
        this.Apellidos = Apellidos;
        this.Edad = Edad;
        this.Deporte = Deporte;
    }
    
    /**
     * retorna el id del deprotista
     * @return id del deportista
     */
    public int getId() {
        return id;
    }

    /**
     * Asigna un id al deportista
     * @param id id del deportista a asignar
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * retorna el nombre del deportista
     * @return nombre del objeto deportista
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * Asigna el nombre a un deportista
     * @param Nombre nombre a asignar
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * Retorna los apellidos del objeto deportista
     * @return 
     */
    public String getApellidos() {
        return Apellidos;
    }

    /**
     * Asigna los apellidos del deportista
     * @param Apellidos Apellidos a asignar
     */
    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    /**
     * Retorna la edad del deportista actual
     * @return la edad del objeto deportista
     */
    public int getEdad() {
        return Edad;
    }

    /**
     * Asigna la edad del objeto deportista
     * @param Edad la edad del deportista
     */
    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    /**
     * Retorna ek deporte que hace el deportista
     * @return retorna el deporte que hace el deportista
     */
    public String getDeporte() {
        return Deporte;
    }

    /**
     * Asgina el deporte que hace el deportista
     * @param Deporte El deporte a asignarle al deportista
     */
    public void setDeporte(String Deporte) {
        this.Deporte = Deporte;
    }

}
