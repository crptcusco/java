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

Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
sessionHibernate.beginTransaction();
Autor oAutor = new Autor();

oAutor.setNombreAutor(nombre);

sessionHibernate.save(oAutor);

sessionHibernate.getTransaction().commit();
System.out.println("Done");
response.sendRedirect("autores.jsp");
%>