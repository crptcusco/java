<%@page import="com.modelo.dao.ProductoDAO"%>
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
				<th>Nombre</th>
				<th>Precio</th>
				<th>Modificar</th>
				<th>Eliminar</th>
			</tr>
		</thead>
		<%
			List<Producto> listaProductos = ProductoDAO.buscarTodos();
			for (Producto oProducto : listaProductos) {
		%>
		<tr>
			<td><%=oProducto.getNombreProducto()%></td>
			<td><%=oProducto.getPrecioProducto()%></td>
			<td><a href="editar_producto.jsp?id=<%=oProducto.getIdProducto()%>">Modificar</a></td>
			<td><a
				href="eliminar_producto.jsp?id=<%=oProducto.getIdProducto()%>">Eliminar</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<a href="nuevo_producto.jsp">Nuevo Producto</a>
</body>
</html>