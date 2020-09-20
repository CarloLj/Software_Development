<%-- 
    Document   : deportista-form
    Created on : 14/06/2020, 09:28:31 PM
    Author     : carlo
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>DeportistApp v1.0 Servlets</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: tomato">
			<div>
				<a href="https://www.google.com.mx" class="navbar-brand"> Google </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Deportistas</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${user != null}">
					<form action="update" method="post">
				</c:if>
				<c:if test="${user == null}">
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test="${user != null}">
            			Editar deportista
            		</c:if>
						<c:if test="${user == null}">
            			Añadir nuevo deportista
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Nombre deportista</label> <input type="text"
						value="<c:out value='${user.nombre}' />" class="form-control"
						name="Nombre" required="required">
				</fieldset>
                                
                                <fieldset class="form-group">
					<label>Apellidos deportista</label> <input type="text"
						value="<c:out value='${user.apellidos}' />" class="form-control"
						name="Apellidos">
				</fieldset>

				<fieldset class="form-group">
					<label>Edad</label> <input type="text"
						value="<c:out value='${user.edad}' />" class="form-control"
						name="Edad">
				</fieldset>

				<fieldset class="form-group">
					<label>Deporte</label> <input type="text"
						value="<c:out value='${user.deporte}' />" class="form-control"
						name="Deporte">
				</fieldset>

				<button type="submit" class="btn btn-success">Guardar</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>