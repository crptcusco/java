<%@page import="java.util.List"%>
<%@page import="modelo.Recurso"%>
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
        <h4>Listado de Recursos</h4>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Medida</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    List<Recurso> listaDeRecurso = null;
                    listaDeRecurso = Recurso.buscarTodos();
                    for (Recurso recurso : listaDeRecurso) {
                        
                %>
            <td><%=recurso.getCodigo()%></td>
            <td><%=recurso.getNombre()%></td>
            <td><%=recurso.getMedida() %></td>            
           
            </tr>
            <% }%>
            </tbody>
        </table>
        
    </div>
</div>
<jsp:include page="pie.jsp" />        

