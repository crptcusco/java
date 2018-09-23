<%@page import="java.util.List"%>
<%@page import="modelo.CampanaRecurso"%>
<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Recurso"%>
<%
    String codigo = request.getParameter("codigo");

    List<CampanaRecurso> campanaRecurso = CampanaRecurso.buscarCampanas(codigo);
    if (campanaRecurso.isEmpty()) {
//realizo la consulta usando el DBHelper y el codigo queda simplificado
        Recurso recurso = Recurso.buscarPorCodigo(codigo);
        recurso.eliminar();
        response.sendRedirect("../administrador/recursos.jsp");
    }
    else {
        response.sendRedirect("../administrador/recursos.jsp?error=1");
    }
%>
