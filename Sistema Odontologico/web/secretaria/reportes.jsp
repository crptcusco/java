<%@page import="java.util.List"%>
<%@page import="modelo.Campana"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DataBaseHelper"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="span10 offset1" >
       <h4>Campañas</h4>
        <ul>    
            <li><a href="../controlador/controlador-reportes.jsp?item=1">Reporte 1 - Reporte General de Campañas</a></li>
            <li><a href="../controlador/controlador-reportes.jsp?item=2">Reporte 2 - Reporte de Costos Anuales</a></li>
        </ul>
        <h4>Recursos</h4>
        <ul>
            <li><a href="../controlador/controlador-reportes.jsp?item=3">Reporte 3 - Reporte Costos de Recursos por Campaña</a></li>
        </ul>
        <h4>Personal</h4>
        <ul>
            <li><a href="../controlador/controlador-reportes.jsp?item=4">Reporte 4 - Listado de Personal</a></li>
        </ul>
        <h4>Atenciones</h4>
        <ul>
            <li><a href="../controlador/controlador-reportes.jsp?item=5">Reporte 5 - Listado de Atenciones mas realizadas </a></li>
            <li><a href="../controlador/controlador-reportes.jsp?item=6">Reporte 6 - Reporte de Problemas Dentales mas encontrados</a></li>
    </div>
</div>
<jsp:include page="pie.jsp" />        
