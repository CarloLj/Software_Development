/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pkg16300206_crudbd;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import pkg16300206_crudbd.ClaseBD;

/**
 *Esta clase se encarga de hacer lo necesario para ser un crud a una base de datos en mysql
 * @author carlo
 */
public class DeportistaBDSolution {
    
    public static ClaseBD inicio = new ClaseBD();
    public static Scanner teclado = new Scanner( System. in);
    
    /**
     * Esta funcion se encarga de darle una pantalla al usuario para poder interactuar con el crud
     * @param args the command line arguments
     * @throws pkg16300206_crudbd.CarloException
     */
    public static void main(String[] args) throws CarloException, CarloRuntimeException{
        boolean restart = true;
        do{
            System.out.println("-----DEPORTISTAPP BD MANAGER V1.0-----");
            System.out.println("");
            System.out.println("[1] INSERTAR NUEVO DEPORTISTA");
            System.out.println("[2] CONSULTAR DEPORTISTA");
            System.out.println("[3] MODIFICAR DEPORTISTA");
            System.out.println("[4] ELIMINAR DEPORTISTA");
            System.out.println("[5] MOSTRAR TODOS LOS DEPORTISTAS");
            System.out.println("-----------------------------------");
            System.out.println("              [6]                 ");
            System.out.println("SALIR DE DEPORTISTAPP MANAGER V1.0");
            System.out.println("-----------------------------------");
            String opc = teclado.nextLine();    
            switch(opc){
                case "1":
                    if(crearDeportista()){
                        System.out.println("Deportista insertado con exito");
                        WaitingLine();
                    }else{
                        //System.out.println("Ocurrio un error al insertar"); Nuestro programa ya manejaba muuchas de las excepciones, incluso es mejor que se pueda seguir ejecutando, pero nuestro carloexception mejor para el programa
                        throw new CarloException("Ocurrio un error al insertar");
                    }
                    break;
                    
                case "2":
                    String cual = cualCampo(seleccionDeCampo());
                    teclado.nextLine();
                    if(consultaDeportista(datoABuscar(cual),cual)){
                        System.out.println("Query Ejecutada con exito, si no salio nada no existe en la base de datos");
                        WaitingLine();
                    }else{
                        //System.out.println("Ocurrio un error al consultar"); Nuestro programa ya manejaba muuchas de las excepciones, incluso es mejor que se pueda seguir ejecutando, pero nuestro carloexception mejor para el programa
                        throw new CarloException("Ocurrio un error al consultar en la base de datos");
                    }
                    break;
                    
                case "3":
                    int seleccion;
                    String campo = "";
                    System.out.println("Ingrese el ID del deportista a modificar");
                    teclado.nextLine();
                    int id = teclado.nextInt();
                    do{
                        System.out.println("Que campo desea modificar");
                        System.out.println("[1]Nombre");
                        System.out.println("[2]Apellido");
                        System.out.println("[3]Edad");
                        seleccion = teclado.nextInt();
                    }while(seleccion <0 && seleccion >3);
                    if(seleccion == 1){
                        campo = "Nombre";
                    }else{
                        if(seleccion ==2){
                            campo = "Apellido";
                        }else{
                            if(seleccion == 3){
                                campo = "Edad";
                            }
                        }
                    }
                    modificarDeportista(id,campo);
                    break;
                    
                case "4":
                    String cual2 = cualCampo(seleccionDeCampo());
                    teclado.nextLine();
                    if(eliminarDeportista(datoABuscar(cual2),cual2)){
                        WaitingLine();
                    }else{
                        //System.out.println("Ocurrio un error al eliminar"); Nuestro programa ya manejaba muuchas de las excepciones, incluso es mejor que se pueda seguir ejecutando, pero nuestro carloexception mejor para el programa
                        throw new CarloException("Ocurrio un error al eliminar");
                    }
                    break;
                    
                case "5":
                    obtenerTodo();
                    WaitingLine();
                    break;
                    
                case "6":
                    restart = false;
                    break;
                    
                default:
                    System.out.println("No existe tal opcion");
                    break;   
            }
            teclado.nextLine();
        }while(restart);    
        Desconectar();
    }
    
    /**
     * Esta funcion se encarga de crear un nuevo deportista para despues mandarlo a insertar
     * @return retorna un bool true o false si se pudo o no crear un nuevo deportista y agregarlo a la base de datos
     */
    public static boolean crearDeportista(){
        String nombre,apellido;
        int edad;
        System.out.print("Ingrese el/los nombre/s del deportista ");
        nombre = teclado.nextLine();
        System.out.print("Ingrese los apellidos del deportista ");
        apellido = teclado.nextLine();
        System.out.print("Ingrese la edad ");
        edad = teclado.nextInt();
        Deportista deportista = new Deportista(nombre,apellido,edad);
        return insertaDeportista(deportista);
    }
    
    /**
     * Esta funcion se encarga de ejecutar una query de insercion de un nuevo deportista en mysql
     * @param deportista Es un objeto deportista que contiene los valores previamente precargados en la funcion creardeportista()
     * @return retorna un true o false de acuerdo si se pudo crear o no el deportista en la base de datos
     */
    public static boolean insertaDeportista(Deportista deportista){ 
        try { 
            String sql = "INSERT INTO deportista(ID, Nombre, Apellido, Edad) VALUES (NULL, ? , ? , ? )";               
            PreparedStatement stmt = ClaseBD.con.prepareStatement(sql); 
            stmt.setString(1, deportista.Nombre); 
            stmt.setString(2, deportista.Apellido);
            stmt.setInt(3, deportista.Edad); 
            stmt.executeUpdate(); 
        } catch (SQLException ex) { 
            System.out.println("Error insertando");
            return false; 
        } 
        return true; 
    } 
    
    /**
     * Esta funcion se encarga de consultar un deportista de acuerdo a su campo especifico, podría ser cualquiera de los parametros de la tabla para ejecutar la consulta
     * @param id es el objeto que se usara como busqueda de acuerdo al campo
     * @param campo el campo es un string que hara que la query en mysql seleccione el campo de la tabla a consultar de acuerdo al dato que se desea ingresar
     * @return retorna un true o un false para saber si se pudo hacer la consulta o no
     */
    public static boolean consultaDeportista(Object id, String campo){ 
        try{               
            String sql = "SELECT * FROM deportista WHERE " + campo + " = ?";
            PreparedStatement stmt = inicio.con.prepareStatement(sql); 
            stmt.setObject(1, id);
            ResultSet rs = stmt.executeQuery();
            while (rs.next())
            {
                int idd = rs.getInt("ID");
                String nombre = rs.getString("Nombre");
                String apellido = rs.getString("Apellido");
                int edad = rs.getInt("Edad");
                System.out.format("%s, %s, %s, %s\n", idd, nombre , apellido, edad);
            }
        } catch(SQLException ex){
            System.err.println(ex.getMessage());
            return false; 
        }
        return true; 
    } 
    
    /**
     * Esta funcion se encarga de eliminar un deportista de acuerdo a algun parametro en especifico dentro de la tabla, ya sea su nombre su id, su edad, o apellidos
     * @param id el id es el objeto que se buscara dentro de el campo seleccionado de la tabla deportista
     * @param campo el campo es el string de campo de la tabla deportista en el cual se buscara el objeto id
     * @return retorna un true o false de acuerdo a si pudo ejecutar la eliminacion o no
     */
    public static boolean eliminarDeportista(Object id, String campo){ 
        try{               
            String sql = "DELETE FROM Deportista WHERE "+ campo + " = ?";
            PreparedStatement stmt = inicio.con.prepareStatement(sql); 
            stmt.setObject(1, id);
            if(stmt.executeUpdate()>0){
                System.out.println("El registro ha sido eliminado exitosamente: Operación Exitosa");
            }else{
                System.out.println("No se encontro alguien con tal preferencia de busqueda, eliminacion cancelada");
            }
        }catch(SQLException ex){
            System.err.println(ex.getMessage());
            return false; 
        }
        return true; 
    } 
    
    /**
     * Esta funcion se encarga de modificar un campo en especifico de un deportista en base a su id
     * @param id el id del deportista que se busca modificar
     * @param campo el campo que se desea modificar del deportista especifico con su id
     * @return retorna un true o false para saber si se pudo ejecutar o no
     */
    public static boolean modificarDeportista(int id,String campo){ 
        Object dato;
        try{               
            String sql = "UPDATE deportista SET "+campo+"=? WHERE ID=?";
            PreparedStatement stmt = inicio.con.prepareStatement(sql); 
            teclado.nextLine();
            System.out.println("Ingrese nuevo dato");
            if(campo.equals("Edad")){
                dato = teclado.nextInt();
                stmt.setObject(1, dato);
            }else{
                dato = teclado.nextLine();
                stmt.setObject(1, dato);
            }
            stmt.setObject(2, id);
            if(stmt.executeUpdate()>0){
                System.out.println("El registro ha sido modificado exitosamente: Operación Exitosa");
            }else{
                System.out.println("No se encontro alguien con tal preferencia de busqueda, actualizacion cancelada");
            }
        }catch(SQLException ex){
            System.err.println(ex.getMessage());
            return false; 
        }
        return true; 
    } 
    
    /**
     * Esta funcion se encraga de imprimir todos los deportistas de la tabla deportista con cada uno de sus campos es una funcion que no retorna ningun valor ya que es solo de lectura
     */
    public static void obtenerTodo(){            
        ResultSet result; 
        try  
        { 
            PreparedStatement stmt = inicio.con.prepareStatement("SELECT * FROM deportista"); 
            result = stmt.executeQuery(); 
            while (result.next()) 
            { 
                System.out.println("ID: "+result.getString("ID")  + "\nNombre/s: "+ result.getString("nombre") + "\nApellido/s: "+ result.getString("apellido") +"\nEdad: "+ result.getInt("edad") + "\n----------------------------");
            }           
        }  
        catch (SQLException ex)  
        { 
            System.out.println("Error en la consulta"); 
        } 
    } 
    
    /**
     * Esta funcion se encarga de hacer que el usuario presione una tecla para continuar
     */
    public static void WaitingLine(){
        System.out.println("Presione una tecla para continuar...");
        new java.util.Scanner(System.in).nextLine();
    }
    
    /**
     * Esta funcion se encarga de verificar un campo de la tabla deportista que se busca buscar, esta funcion debe ir acompañada de la funcion seleccion de campo
     * @param n recibe el numero especifico de campo
     * @return retorna un string para poder ser interpretado por una query en mysql con los valores de cada campo de la tabla deportista
     * @throws pkg16300206_crudbd.CarloRuntException
     */
    public static String cualCampo(int n) throws CarloRuntimeException{
        String campo = "";
        switch(n){
            case 1:
                campo = "ID";
                break;
            case 2:
                campo = "Nombre";
                break;    
            case 3:
                campo = "Apellido";
                break;
            case 4:
                campo = "Edad";
                break;
        }
        if(n > 4 || n < 0){
            throw new CarloRuntimeException("Nisiquiera se puede llegar aqui pero si llegaste tronaste el programa, que bien que tenemos esta excepcion"); 
        }
        return campo;
    }
    
    /**
     * Esta funcion se encarga de retornar una seleccion de usuario del campo de la tabla deportista que desee, esta funcion debe ir dentro de la funcion cualCampo() para que retorne el campo en forma de string
     * @return retorna un numero de identificador para ser interpretado por la funcion cualCampo()
     * @throws pkg16300206_crudbd.CarloException
     */
    public static int seleccionDeCampo() throws CarloException{
        int seleccion;
        do{
        System.out.println("Como desea Buscar");
        System.out.println("[1]ID");
        System.out.println("[2]Nombre");
        System.out.println("[3]Apellido");
        System.out.println("[4]Edad");
        seleccion = teclado.nextInt();
        }while(seleccion <0 && seleccion >4);
        if(seleccion<0 || seleccion >4){
            throw new CarloException("No deberias poder llegar aqui, esa opcion no esta aqui");
        }
        return seleccion;
    }
    
    /**
     * Esta funcion se encarga de saber que tipo de dato sera el que se ira a buscar y retorna un id que sera el dato de busqueda para ejecutar en la consulta
     * @param cual es el campo de la tabla deportista que se quiere consultar
     * @return retorna el dato que se quiere disponer para hacer un WHERE en mysql
     */
    public static Object datoABuscar(String cual){
        Object id;
        System.out.print("Ingrese " + cual + ": ");
            if(cual.equals("ID") || cual.equals("Edad")){
                id = teclado.nextInt();
            }else{
                id = teclado.nextLine();
            }        
        return id;
    }

    /**
     * Desconecta la base de datos
     */
    public static void Desconectar(){
        try{
            inicio.con.close();
            System.out.println("\n************************************************************\n");
            System.out.println("La conexion a la base de datos se ha terminado");
            System.out.println("\n************************************************************");
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
