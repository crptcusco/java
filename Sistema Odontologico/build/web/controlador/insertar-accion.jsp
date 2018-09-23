<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Accion"%>
<%
    String nombre = request.getParameter("nombre");   
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Accion accion = new Accion(nombre);
    accion.insertar();
    response.sendRedirect("../administrador/acciones.jsp");
%>