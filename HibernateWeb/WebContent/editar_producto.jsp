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
<%
int id = Integer.parseInt(request.getParameter("id"));

Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
sessionHibernate.beginTransaction();
Producto oProducto = (Producto)sessionHibernate.get(Producto.class, id);
%>
<form action="modificar_producto.jsp">
Codigo : 
<input name="id" type="text" value="<%=oProducto.getIdProducto()%>" ><br />
Nombre:
<input name="nombre" type="text" value="<%=oProducto.getNombreProducto()%>"><br />
Precio:
<input name="precio" type="text" value="<%=oProducto.getPrecioProducto()%>"><br />
<input type="submit">

</form>
</body>
</html>