<%@page import="modelo.CampanaRecurso"%>
<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Recurso"%>
<%  
    String campana = request.getParameter("campana");
    String precio = request.getParameter("precio");
    String cantidad = request.getParameter("cantidad");
    String recurso = request.getParameter("recurso");
    
    CampanaRecurso campanaRecurso = new CampanaRecurso(campana, recurso, cantidad, precio);
    campanaRecurso.insertar();
    response.sendRedirect("../secretaria/recurso-campana.jsp?campana=" + campana);
%>
