<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.modelo.bo.*"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.List"%>
    
<%
//Recibiendo los datos enviados
String nombre = request.getParameter("nombre");
Double precio = Double.parseDouble(request.getParameter("precio"));


Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
sessionHibernate.beginTransaction();
Producto oProducto = new Producto();

oProducto.setNombreProducto(nombre);
oProducto.setPrecioProducto(precio);

sessionHibernate.save(oProducto);

sessionHibernate.getTransaction().commit();
System.out.println("Done");
response.sendRedirect("productos.jsp");
%>
