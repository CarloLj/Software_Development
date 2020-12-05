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
public class Alumno {
    private
    String registro;
    String nombre;
    String domicilio;
    String telefono;
    String email;
    String grado;
    boolean sexo;
    int calificacion;
    
    public Alumno(){
        registro = "sin registro";
        nombre = "sin nombre";
        domicilio = "sin domicilio";
        telefono = "sin telefono";
        email = "sin correo";
        grado = "sin grado";
        sexo = false;
        calificacion = 0;
    }
    
    public Alumno(String _registro,String _nombre, String _domicilio, String _telefono, String _email, String _grado, boolean _sexo, int _calificacion){
        registro = _registro;
        nombre = _nombre;
        domicilio = _domicilio;
        telefono = _telefono;
        email = _email;
        grado = _grado;
        sexo = _sexo;
        calificacion = _calificacion;
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

    public String getGrado() {
        return grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    public boolean isSexo() {
        return sexo;
    }

    public void setSexo(boolean sexo) {
        this.sexo = sexo;
    }

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }
}

