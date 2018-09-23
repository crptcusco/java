<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Recurso"%>
<%
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String medida = request.getParameter("medida");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Recurso recurso = new Recurso(codigo,nombre,medida);
    recurso.modificar();
    response.sendRedirect("../administrador/recursos.jsp");
%>