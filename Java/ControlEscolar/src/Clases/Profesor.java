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
public class Profesor {
    private 
    String registro;
    String nombre;
    String domicilio;
    String telefono;
    String email;
    boolean sexo;
    int gradoestudio;
   
    public Profesor(){
        registro = "sin registro";
        nombre = "sin nombre";
        domicilio = "sin domicilio";
        telefono = "sin telefono";
        email = "sin correo";
        gradoestudio = 0;
    }
    
    public Profesor(String _registro, String _nombre, String _domicilio, String _telefono, String _email, boolean _sexo, int _gradoestudio){
        registro = _registro;
        nombre = _nombre;
        domicilio = _domicilio;
        telefono = _telefono;
        email = _email;
        sexo = _sexo;
        gradoestudio = _gradoestudio;
    }
    
    public String getRegistro() {
        return registro;
    }

    public void setRegistro(String registro) {
        this.registro = registro;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDomicilio() {
        return domicilio;
    }

    public void setDomicilio(String domicilio) {
        this.domicilio = domicilio;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public boolean isSexo() {
        return sexo;
    }

    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }

    public int getGradoestudio() {
        return gradoestudio;
    }

    public void setGradoestudio(int gradoestudio) {
        this.gradoestudio = gradoestudio;
    }

}
