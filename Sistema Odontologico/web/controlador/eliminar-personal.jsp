<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Personal"%>
<%
    String codigo = request.getParameter("codigo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Personal personal = Personal.buscarPorCodigo(codigo);
    personal.eliminar();
    response.sendRedirect("../administrador/personal.jsp");
%>