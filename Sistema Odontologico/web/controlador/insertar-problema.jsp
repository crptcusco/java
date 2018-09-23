<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Problema"%>
<%
    String nombre = request.getParameter("nombre");   
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Problema problema = new Problema(nombre);
    problema.insertar();
    response.sendRedirect("../administrador/problemas.jsp");
%>