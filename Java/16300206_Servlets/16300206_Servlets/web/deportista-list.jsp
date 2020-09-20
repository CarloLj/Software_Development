<%-- 
    Document   : deportista-list
    Created on : 14/06/2020, 09:29:07 PM
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
				<li><a href="<%=request.getContextPath()%>/list-zapatos.jsp/list"
					class="nav-link">Deportistas</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

		<div class="container">
			<h3 class="text-center">Lista de deportistas</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/list-zapatos.jsp/new" class="btn btn-success">Add
					Nuevo Deportista</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Apellidos</th>
						<th>Edad</th>
                                                <th>Deporte</th>
						<th>Actions</th>
                                        </tr>
                                </thead>
                                <tbody>
                                    <!--   for (Todo todo: todos) {  -->
                                    <c:forEach var="deportista" items="${listUser}">
                                        <tr>
                                            <td><c:out value="${deportista.id}" /></td>
                                            <td><c:out value="${deportista.nombre}" /></td>
                                            <td><c:out value="${deportista.apellidos}" /></td>
                                            <td><c:out value="${deportista.edad}" /></td>
                                            <td><c:out value="${deportista.deporte}" /></td>
                                            <td><a href="<%=request.getContextPath()%>/list-zapatos.jsp/edit?id=<c:out value='${deportista.id}' />">Editar</a>
                                                &nbsp;&nbsp;&nbsp;&nbsp; <a
                                                    href="<%=request.getContextPath()%>/list-zapatos.jsp/delete?id=<c:out value='${deportista.id}' />">Eliminar</a></td>
                                        </tr>
                                    </c:forEach>
                                    <!-- } -->
                                </tbody>

                        </table>
                </div>
        </div>
</body>
</html>