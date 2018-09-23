<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Recurso"%>
<%
    String nombre = request.getParameter("nombre");
   
    String medida = request.getParameter("medida");
   
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Recurso recurso = new Recurso(nombre,medida);
    recurso.insertar();
    response.sendRedirect("../administrador/recursos.jsp");
%>