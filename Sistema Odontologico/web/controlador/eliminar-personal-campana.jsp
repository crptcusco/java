
<%@page import="modelo.CampanaPersonal"%>
<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Personal"%>
<%
    String campana = request.getParameter("campana");
    String personal = request.getParameter("personal"); 
    
    CampanaPersonal campanaPersonal = CampanaPersonal.buscarPorCodigo(campana, personal);
    campanaPersonal.eliminar();

    response.sendRedirect("../secretaria/personal-campana.jsp?campana="+campana);
%>
