/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Web;

/**
 * Esta clase se encarga de inicializar el servlet que no servira de controlador para nuestra pagina web y bd
 * @author carlo
 */
import Dao.DeportistaDao;
import Modelo.Deportista;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * .java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @email Ramesh Fadatare
 */

@WebServlet("/")
/**
 * Clase deportista servlet que extiende al httpservlet
 */
public class DeportistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DeportistaDao userDAO;
	
        /**
         * Inicializacion del deportista dao
         */
	public void init() {
		userDAO = new DeportistaDao();
	}

        /**
         * Do post para nuestro servlet
         * @param request request
         * @param response respuesta
         * @throws ServletException excepcion de parte del servlet
         * @throws IOException Excepcion IO
         */
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
        /**
         * Metodo importante para getear, con este partimos las distintas peticiones que nos lleguen para usar en la base de datos 
         * @param request request
         * @param response respuesta
         * @throws ServletException excepcion del servlet
         * @throws IOException excepcion de IO
         */
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertUser(request, response);
				break;
			case "/delete":
				deleteUser(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateUser(request, response);
				break;
			default:
				listUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

        /**
         * Lista de usuarios a mostrar en la pagina principal
         * @param request request
         * @param response respuesta
         * @throws SQLException excepcion de la base de datos
         * @throws IOException Excepcion IO 
         * @throws ServletException Excepcion en el servlet
         */
	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Deportista> listUser = userDAO.selectAllDeportistas();
		request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("deportista-list.jsp");
		dispatcher.forward(request, response);
	}

        /**
         * Funcion encargada de mostrar la form del deportista al momento de intentar crear uno nuevo
         * @param request peticion
         * @param response respuesta
         * @throws ServletException excepcion del servlet
         * @throws IOException Excepcion IO
         */
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("deportista-form.jsp");
		dispatcher.forward(request, response);
	}

        /**
         * Funcion encargada de mostar la form para editar los parametros del deportista
         * @param request peticion
         * @param response respuesta
         * @throws SQLException excepcion sql
         * @throws ServletException excpecion del servlet
         * @throws IOException Excepcion IO
         */
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Deportista existingUser = userDAO.selectDeportista(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("deportista-form.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);
	}

        /**
         * Funcion encargada de insertar un usuario a la base de datos
         * @param request peticion
         * @param response respuesta 
         * @throws SQLException Excpecion de parte de la conexion a la base de datos
         * @throws IOException Excepcion de IO
         */
	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String Nombre = request.getParameter("Nombre");
		String Apellidos = request.getParameter("Apellidos");
		int Edad = Integer.parseInt(request.getParameter("Edad"));
                String Deporte = request.getParameter("Deporte");
		Deportista newUser = new Deportista(Nombre, Apellidos, Edad, Deporte);
		userDAO.insertDeportista(newUser);
		response.sendRedirect("list");
	}

        /**
         * Funcion encargada de hacer un update a nuestro usuario
         * @param request peticion
         * @param response respuesta
         * @throws SQLException excepcion de parte de la base de  datos
         * @throws IOException excpecion IO
         */
	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String Nombre = request.getParameter("Nombre");
		String Apellidos = request.getParameter("Apellidos");
		int Edad = Integer.parseInt(request.getParameter("Edad"));
                String Deporte = request.getParameter("Deporte");
		Deportista book = new Deportista(id, Nombre, Apellidos, Edad, Deporte);
		userDAO.updateDeportista(book);
		response.sendRedirect("list");
	}

        /**
         * Funcion encargada de eliminar a un usuario por medio del servlet
         * @param request peticion
         * @param response respuesta
         * @throws SQLException excepcion de sql almomento de usar la base de datos
         * @throws IOException Excepcion de IO
         */
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteDeportista(id);
		response.sendRedirect("list");

	}

}
