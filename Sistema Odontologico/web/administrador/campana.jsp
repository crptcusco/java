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
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>

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

            <td><%=campana.getNombre()%></td>
            <td><%=campana.getContacto()%></td>
            <td><%=campana.getFecha()%></td>
            <td><%=campana.getLugar()%></td>
            <td><%=estado%></td>
            <td>
                <p><a href="modificar-campana.jsp?codigo=<%=campana.getCodigo()%>"><i class="icon-edit"></i> Editar</a>
                    <% if (campana.getEstado().equals("P")) {%>
                    <a href="../controlador/cerrar-campana.jsp?codigo=<%=campana.getCodigo()%>"><i class="icon-briefcase"></i> Cerrar</a>
                    <%  } else {%>
                    <a href="../controlador/abrir-campana.jsp?codigo=<%=campana.getCodigo()%>"><i class="icon-folder-open"></i> Abrir</a>    
                    <%} %>
                </p>              
            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>
            
        <a class="btn btn-primary" href="nueva-campana.jsp">Nueva Campaña</a>
    </div>
</div>
<jsp:include page="pie.jsp" />        


