<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Accion"%>
<%
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String medida = request.getParameter("medida");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Accion accion = new Accion(codigo,nombre);
    accion.modificar();
    response.sendRedirect("../administrador/acciones.jsp");
%>
