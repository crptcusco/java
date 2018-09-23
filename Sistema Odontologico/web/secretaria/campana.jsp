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
    <div class="navbar span10 offset1" >
        <h4>Listado de Campañas</h4>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Contacto</th>
                    <th>Fecha</th>
                    <th>Lugar</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Campana> listaDeCampana = null;
                    listaDeCampana = Campana.buscarTodos();
                    for (Campana campana : listaDeCampana) {
                        String estado = "";
                        if (campana.getEstado().equals("P")) {
                            out.print("<tr class=\"warning\">");
                            estado = "Pendiente";
                        } else {
                            out.print("<tr class=\"info\">");
                            estado = "Concluida";
                        }
                %>
            <td><%=campana.getCodigo()%></td>
            <td><%=campana.getNombre()%></td>
            <td><%=campana.getContacto()%></td>
            <td><%=campana.getFecha()%></td>
            <td><%=campana.getLugar()%></td>
            <td><%=estado%></td>
            <td>
                <%if(campana.getEstado().equals("P")){%>
                <p><a href="atencion.jsp?campana=<%=campana.getCodigo()%>"><i class="icon-list"></i>Atenciones</a>
                <a href="recurso-campana.jsp?campana=<%=campana.getCodigo()%>"><i class="icon-wrench"></i>Recursos</a></p>
                <a href="personal-campana.jsp?campana=<%=campana.getCodigo()%>"><i class="icon-user"></i>Agregar Personal</a></p>
                <%}%>
            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>
       
    </div>
</div>
<jsp:include page="pie.jsp" />        



