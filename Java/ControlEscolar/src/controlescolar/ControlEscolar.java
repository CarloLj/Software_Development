/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlescolar;

import Clases.Alumno;
import Clases.Materia;
import Clases.Profesor;

/**
 *
 * @author fabio
 */
public class ControlEscolar {
    public static Alumno[] alumnos = new Alumno[100];
    public static Materia[] materias = new Materia[100];
    public static Profesor[] profesores = new Profesor[100];
    public static int tamanoprof = 0;
    public static int tamanomat = 0;
    public static int tamanoalumn = 0;
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        PantallaPrincipal  pantallita = new PantallaPrincipal();
        pantallita.setVisible(true);
    }
    
}
