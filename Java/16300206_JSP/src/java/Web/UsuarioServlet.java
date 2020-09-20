/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Web;

import Controlador.Conexion;
import Modelo.Usuario;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Clase que funiciona como servlet para la pagina de index
 */
@WebServlet("/login")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Conexion loginDao;

	public void init() {
		loginDao = new Conexion();
	}

        /**
         * Al momento de hacer un post por medio del boton submit en la pagina de index, se ejecutara el doPost que hara la comprobacion con la base de datos por medio de nuestro objeto conexion y el metodo verificar, enviando como dato un usuario con las credenciales puestas en nuestra pagina de inicio de sesion
         * @param request peticion
         * @param response respuesta
         * @throws ServletException Excepcion de servlet
         * @throws IOException Excepcion de IO
         */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Usuario loginBean = new Usuario();
		loginBean.setNombre(username);
		loginBean.setPassword(password);

		try {
			if (loginDao.validate(loginBean)) {
				//HttpSession session = request.getSession();
				// session.setAttribute("username",username);
				response.sendRedirect("loginsuccess.jsp");
			} else {
				HttpSession session = request.getSession();
				//session.setAttribute("user", username);
				response.sendRedirect("error.jsp");
			}
		} catch (ClassNotFoundException e) {
			response.sendRedirect("error.jsp");
		}
	}
}
