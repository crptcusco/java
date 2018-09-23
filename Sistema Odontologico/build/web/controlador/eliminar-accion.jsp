<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Accion"%>
<%
    String codigo = request.getParameter("codigo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Accion accion = Accion.buscarPorCodigo(codigo);
    accion.eliminar();
    response.sendRedirect("../administrador/acciones.jsp");
%>
