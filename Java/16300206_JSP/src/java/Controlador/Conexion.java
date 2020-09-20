/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Esta clase se encarga de una sola cosa y es de establecer la conexion a la base de datos solamente cuando se manda a llamar la funcion de validate, unicamente sirve para el index.jsp
 * @author carlo
 */
public class Conexion {
    
    /**
     * La funcion validar es la encargada de validar los datos ingresados en la pagina web con los datos de la base de datos
     * @param loginBean es un Usuario con nombre y password que se busque verificr
     * @return verdader o falso, si encontro al usuario entonces sera verdadero, si no lo enconro sela en falso
     * @throws ClassNotFoundException Exceocion de no encontrar la clase
     */
        public boolean validate(Usuario loginBean) throws ClassNotFoundException {
		boolean status = false;

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/16300206_jsp?useSSL=false", "root", "");

				// Step 2:Create a statement using connection object
		PreparedStatement preparedStatement = connection.
                        prepareStatement("select * from usuarios where nombre = ? and password = ? ")) {
			
                        preparedStatement.setString(1, loginBean.getNombre());
			preparedStatement.setString(2, loginBean.getPassword());

			System.out.println(preparedStatement);
			ResultSet rs = preparedStatement.executeQuery();
			status = rs.next();

		} catch (SQLException e) {
			// process sql exception
			printSQLException(e);
		}
		return status;
	}

        /**
         * Funcion encargada de imprimir la excepcion sql
         * @param ex excepcion recibida de parte de sql
         */
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}
