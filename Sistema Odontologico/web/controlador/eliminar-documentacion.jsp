<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Documentacion"%>
<%
    String codigo = request.getParameter("codigo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Documentacion documentacion = Documentacion.buscarPorCodigo(codigo);
    documentacion.eliminar();
    response.sendRedirect("../administrador/documentacion.jsp");
%>
