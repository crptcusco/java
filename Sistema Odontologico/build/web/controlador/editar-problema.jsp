<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Problema"%>
<%
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String medida = request.getParameter("medida");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Problema problema = new Problema(codigo,nombre);
    problema.modificar();
    response.sendRedirect("../administrador/problemas.jsp");
%>