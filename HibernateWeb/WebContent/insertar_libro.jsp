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
String autor1 = request.getParameter("autor1");
String autor2 = request.getParameter("autor2");
String autor3 = request.getParameter("autor3");

Session sessionHibernate = HibernateUtil.getSessionFactory().openSession();
sessionHibernate.beginTransaction();
Libro oLibro = new Libro();
oLibro.setNombreLibro(nombre);

Autor oAutor1= new Autor(autor1);
Autor oAutor2= new Autor(autor2);
Autor oAutor3= new Autor(autor3);
Set<Autor> autores = new HashSet<Autor>();
autores.add(oAutor1);
autores.add(oAutor2);
autores.add(oAutor3);

oLibro.setAutores(autores);
sessionHibernate.save(oLibro);

sessionHibernate.getTransaction().commit();
System.out.println("Done");
response.sendRedirect("libros.jsp");
%>
