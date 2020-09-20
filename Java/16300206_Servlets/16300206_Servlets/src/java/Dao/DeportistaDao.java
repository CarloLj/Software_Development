/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import Modelo.Deportista;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.SQLException; 


/**
 * Esta clase se encarga de realizar la conexion con la base de datos, y de guardar las consultas que se haran a la base de datos de igual forma
 * contiene los metodos necesarios para realizar las tareas basicas de un crud en mysql
 * @author carlo
 */
public class DeportistaDao{
    private String jdbcURL = "jdbc:mysql://localhost:3306/16300206_servlets?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";
    private static final String INSERT_DEPORTISTAS_SQL = "insert into deportistas" +  " (Nombre, Apellidos,Edad,Deporte) VALUES " + " (?,?,?,?);";
    private static final String SELECT_DEPORTISTAS_BY_ID = "select Nombre, Apellidos, Edad, Deporte from deportistas where id =?;";
    private static final String SELECT_ALL_DEPORTISTAS = "select * from deportistas;";
    private static final String DELETE_DEPORTISTAS_SQL = "delete from deportistas where id = ?;";
    private static final String UPDATE_DEPORTISTAS_SQL = "update deportistas set Nombre = ?, Apellidos = ?, Edad = ? , Deporte = ? where id = ?;";
    
    /**
     * Conexion a la base de datos que retorna la conexion correcta o inorrecta
     * @return Conexion correcta o con error
     */
    protected Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
            System.out.println("Conexion con la base de datos exitosa");
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error al conectar" + e);
        }
        return connection;
    }
    
    /**
     *   Inserta un deportista a la base de datos por medio de la conexion 
     * @param deportista un Objeto clase deportista
     * @throws SQLException Excepcion en caso de instertar con error
     */
    public void insertDeportista(Deportista deportista) throws SQLException{
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(INSERT_DEPORTISTAS_SQL);){
                preparedStatement.setString(1, deportista.getNombre());
                preparedStatement.setString(2, deportista.getApellidos());
                preparedStatement.setInt(3, deportista.getEdad());
                preparedStatement.setString(4, deportista.getDeporte());
                preparedStatement.executeUpdate();
        }catch(Exception e){
            System.out.println(e);
        }          
    }
    
    /**
     * Actualiza un deportista en la vase de datos por medio de una conexion
     * @param deportista objeto deportista que sera modificado
     * @return retorna un valor booleano en true o false de acuerdo si se ejecuto correctaente
     * @throws SQLException Error en caso de haber un problema con la base de datos
     */
    public boolean updateDeportista(Deportista deportista) throws SQLException{
        boolean seActualizo = false;
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_DEPORTISTAS_SQL);){
                preparedStatement.setString(1, deportista.getNombre());
                preparedStatement.setString(2, deportista.getApellidos());
                preparedStatement.setInt(3, deportista.getEdad());
                preparedStatement.setString(4, deportista.getDeporte());
                preparedStatement.setInt(5, deportista.getId());
                
                seActualizo = preparedStatement.executeUpdate() > 0;
        }catch(Exception e){
            System.out.println(e);
        }
        return seActualizo;
    }
    
    /**
     * Selecciona un deportista por medio del id
     * @param id id del depoertista a seleccionar
     * @return  retorna un objeto deportista con sus parametros
     */
    public Deportista selectDeportista(int id){
        Deportista deportista = null;
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_DEPORTISTAS_BY_ID);){
                preparedStatement.setInt(1, id);
                System.out.println(preparedStatement);
                
                ResultSet rs = preparedStatement.executeQuery();
                
                while(rs.next()){
                    String Nombre = rs.getString("Nombre");
                    String Apellidos = rs.getString("Apellidos");
                    int Edad = rs.getInt("Edad");
                    String Deporte = rs.getString("Deporte");
                    deportista = new Deportista(id,Nombre,Apellidos,Edad,Deporte);
                }
        }catch(Exception e){
            System.out.println(e);
        }
        return deportista;
        //return deportista;
    }
    
    /**
     * Funcion que se encarga de seleccionar a todos los deportistas que estan en la base de datos 
     * @return retorna la lista completa de todos los deportistas
     */
    public List<Deportista> selectAllDeportistas(){
        List<Deportista> deportistas = new ArrayList<>();
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DEPORTISTAS);){
                System.out.println(preparedStatement);
                
                ResultSet rs = preparedStatement.executeQuery();
                
                while(rs.next()){
                    int id = rs.getInt("id");
                    String Nombre = rs.getString("Nombre");
                    String Apellidos = rs.getString("Apellidos");
                    int Edad = rs.getInt("Edad");
                    String Deporte = rs.getString("Deporte");
                    deportistas.add(new Deportista(id,Nombre,Apellidos,Edad,Deporte));
                }
        }catch(Exception e){
            System.out.println(e);
        }
        return deportistas;
    }
    
    /**
     * Funcion que se encarga de eliminar a un deportista de la base de datos
     * @param id id del deportista a eliminar
     * @return retorna un valor booleano si se inserto o no
     * @throws SQLException Excepcion en caso de un problema con la base de datos
     */
    public boolean deleteDeportista(int id) throws SQLException{
        boolean seElimino;
        try(Connection connection = getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(DELETE_DEPORTISTAS_SQL);){
                preparedStatement.setInt(1, id);
                seElimino = preparedStatement.executeUpdate() > 0;
        }
        return seElimino;
    }
}
