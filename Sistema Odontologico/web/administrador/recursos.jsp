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
        <%try {
                if (request.getParameter("error").equals("1")) {%>
        <div class=" alert fade in">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>No se puede Eliminar!</strong> Favor verificar el recurso en las campañas
        </div>
        <%}
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Medida</th>
                    <th>Acciones</th>
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
            <td><%=recurso.getMedida()%></td>            
            <td>
                <a href="modificar-recurso.jsp?codigo=<%=recurso.getCodigo()%>"><i class="icon-pencil"></i> Editar</a>
                <a href="../controlador/eliminar-recurso.jsp?codigo=<%=recurso.getCodigo()%>"><i class="icon-trash"></i> Eliminar</a>
            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>
        <a class="btn btn-primary" href="nuevo-recurso.jsp">Nuevo Recurso</a>
    </div>
</div>
<jsp:include page="pie.jsp" />        

