/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_crudbd;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 

/**
 * Esta clase inicializa la conexion con la base de datos
 * @author carlo
 */
public class ClaseBD {
    public static Connection con;
    
    /**
     * Esta funcion se encarga de hacer la conexion con el driver de mysql con la base de datos cruddb
     */
    public ClaseBD() 
    { 
        try  
        { 
            Class.forName("com.mysql.jdbc.Driver"); 
            con = DriverManager.getConnection("jdbc:mysql://localhost/crudbd","root",""); 
            System.out.println("Conexion a la base de datos con exito");
        }  
        catch (ClassNotFoundException | SQLException ex )  
        { 
            System.out.println("Error al cargar el driver, cualquier operacion dara NullPointerException " + ex.getMessage()); 
        } 
    } 
}
