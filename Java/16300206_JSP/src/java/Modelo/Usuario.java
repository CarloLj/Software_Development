/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 * Esta clase representa a un usuario en la base de datos
 * @author carlo
 */
public class Usuario {
    
    public int id;
    public String nombre;
    public String password;
    
    /**
     * Constructor de un Usuario vacio
     */
    public Usuario(){
        
    }
    
    /**
     * COnstructor de un usario con todos sus parametros
     * @param id id del usuario 
     * @param nombre nombre del usuario
     * @param password contraseña del usuario  
     */
    public Usuario(int id, String nombre, String password) {
        this.id = id;
        this.nombre = nombre;
        this.password = password;
    }
    
    /**
     * cONSTRUCTOR DE UN USUARIO EXCLUYENDO SU ID Y QUE EN LA BD ES AUTOINCREMENTABLE
     * @param nombre nombre del usuario
     * @param password password del usuario
     */
    public Usuario(String nombre, String password) {
        this.nombre = nombre;
        this.password = password;
    }
    
    /**
     * Metodo para retornar el id del objeto
     * @return retorna un id entero
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo para poner el id del usuario
     * @param id id a poner
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo para retornar un nombre del objeto
     * @return retorna el nombre del objeto usuario
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * Metodo que fermite poner el nombre al objeto
     * @param nombre nombre que queremos ponerle al objeto usuario
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * Metodo que permite el retorno del password del objeto usuario
     * @return retorna el password del usuario
     */
    public String getPassword() {
        return password;
    }

    /**
     * Metodo que permite ponerle la contraseña al objeto usuario
     * @param password recibe un string contraseña
     */
    public void setPassword(String password) {
        this.password = password;
    }
        
}
