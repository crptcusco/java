<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.modelo.bo.*"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.List"%>
    
<%
//Recibiendo los datos enviados
int id = Integer.parseInt(request.getParameter("id"));

Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
sessionHibernate.beginTransaction();
Producto oProducto = (Producto)sessionHibernate.get(Producto.class, id);
sessionHibernate.delete(oProducto);
sessionHibernate.getTransaction().commit();

System.out.println("Done");
response.sendRedirect("productos.jsp");
%>