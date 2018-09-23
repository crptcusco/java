<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Problema"%>
<%
    String codigo = request.getParameter("codigo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Problema problema = Problema.buscarPorCodigo(codigo);
    problema.eliminar();
    response.sendRedirect("../administrador/problemas.jsp");
%>
