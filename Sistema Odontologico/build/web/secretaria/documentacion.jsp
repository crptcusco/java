<%@page import="java.util.List"%>
<%@page import="modelo.Documentacion"%>
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
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Link</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    List<Documentacion> listaDeDocumentacion = null;
                    listaDeDocumentacion = Documentacion.buscarTodos();
                    for (Documentacion documentacion : listaDeDocumentacion) {    
                %>
            <td><%=documentacion.getCodigo()%></td>
            <td><%=documentacion.getNombre()%></td>
            <td><a href="<%=documentacion.getRuta()%>"> Link </a></td>             
            </tr>
            <% }%>
            </tbody>
        </table>
        
    </div>
</div>
<jsp:include page="pie.jsp" />        
