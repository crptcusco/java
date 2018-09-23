<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Paciente"%>
<%
    String codigo = request.getParameter("codigo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Paciente paciente = Paciente.buscarPorCodigo(codigo);
    paciente.eliminar();
    response.sendRedirect("../administrador/pacientes.jsp");
%>