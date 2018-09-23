<%@page import="com.modelo.dao.AutorDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.modelo.bo.*"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Codigo</th>
				<th>Nombre</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<%
			List<Autor> listaAutors = AutorDAO.buscarTodos();
			for (Autor oAutor : listaAutors) {
		%>
		<tr>
			<td><%=oAutor.getIdAutor()%></td>
			<td><%=oAutor.getNombreAutor()%></td>
			<td><a href="editar_autor.jsp?id=<%=oAutor.getIdAutor()%>">Modificar</a></td>
			<td><a href="eliminar_autor.jsp?id=<%=oAutor.getIdAutor()%>">Eliminar</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<a href="nuevo_autor.jsp">Nuevo Autor</a>
</body>
</html>