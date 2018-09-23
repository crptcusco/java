
<%@page import="modelo.CampanaRecurso"%>
<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Recurso"%>
<%
    String campana = request.getParameter("campana");
    String recurso = request.getParameter("recurso"); 
    
    CampanaRecurso campanaRecurso = CampanaRecurso.buscarPorCodigo(campana, recurso);
    campanaRecurso.eliminar();

    response.sendRedirect("../secretaria/recurso-campana.jsp?campana="+campana);
%>
