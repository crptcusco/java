<%@page import="java.util.List"%>
<%@page import="modelo.Problema"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DataBaseHelper"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1">
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Problema> listaDeProblema = null;
                    listaDeProblema = Problema.buscarTodos();
                    for (Problema problema : listaDeProblema) {
                        
                %>
            <td><%=problema.getCodigo()%></td>
            <td><%=problema.getNombre()%></td>            
            <td>
                <a href="modificar-problema.jsp?codigo=<%=problema.getCodigo()%>"><i class="icon-pencil"></i> Editar</a>
                <a href="../controlador/eliminar-problema.jsp?codigo=<%=problema.getCodigo()%>"><i class="icon-trash"></i> Eliminar</a>
            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>
        <a class="btn btn-primary" href="nuevo-problema.jsp">Nuevo Problema</a>
    </div>
</div>
<jsp:include page="pie.jsp" />        

