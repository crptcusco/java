<%@page import="modelo.CampanaPersonal"%>
<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Personal"%>
<%
    String campana = request.getParameter("campana");
    String personal = request.getParameter("personal");

    CampanaPersonal campanaPersonal = new CampanaPersonal(campana, personal);
    campanaPersonal.insertar();
    response.sendRedirect("../secretaria/personal-campana.jsp?campana=" + campana);
%>