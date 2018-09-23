<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Campana"%>
<%
    String nombre = request.getParameter("nombre");
    String contacto = request.getParameter("contacto");
    String fecha = request.getParameter("fecha");
    String lugar = request.getParameter("lugar");
    String estado = request.getParameter("estado");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Campana campana = new Campana(nombre, contacto,fecha,lugar,estado);
    campana.insertar();
    response.sendRedirect("../administrador/campana.jsp");
%>
