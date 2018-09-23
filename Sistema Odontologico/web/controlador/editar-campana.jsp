<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Campana"%>
<%
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String contacto = request.getParameter("contacto");
    String fecha = request.getParameter("fecha");
    String lugar = request.getParameter("lugar");
    String estado = request.getParameter("estado");

//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Campana campana = new Campana(codigo,nombre,contacto,fecha,lugar,estado );
    campana.modificar();
    response.sendRedirect("../administrador/campana.jsp");
    
%>