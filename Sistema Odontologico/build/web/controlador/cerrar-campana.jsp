<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Campana"%>
<%
    String codigo = request.getParameter("codigo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Campana campana = Campana.buscarPorCodigo(codigo);
    campana.cerrar();
    response.sendRedirect("../administrador/campana.jsp");
%>