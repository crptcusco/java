<%@page import="java.util.List"%>
<%@page import="modelo.Personal"%>
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
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Telefono</th>
                    <th>Direccion</th>
                    <th>Cargo</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Personal> listaDePersonal = null;
                    listaDePersonal = Personal.buscarTodos();
                    for (Personal personal : listaDePersonal) {
                        String estado = "";
                        if (personal.getEstado().equals("I")) {
                            out.print("<tr class=\"warning\">");
                            estado = "Inactivo";
                        } else {
                            out.print("<tr class=\"info\">");
                            estado = "Activo";
                        }
                %>
            <td><%=personal.getCodigo()%></td>
            <td><%=personal.getNombre()%></td>
            <td><%=personal.getApellido()%></td>
            <td><%=personal.getDni()%></td>
            <td><%=personal.getTelefono()%></td>
            <td><%=personal.getDireccion()%></td>
            <td><%=personal.getTipo()%></td>
            <td><%=estado%></td>
            <td>
                <p><a href="modificar-personal.jsp?codigo=<%=personal.getCodigo()%>"><i class="icon-pencil"></i> Editar</a>
                <% if (personal.getEstado().equals("A")) {%>
                    <a href="../controlador/inhabilitar-personal.jsp?codigo=<%=personal.getCodigo()%>"><i class="icon-ban-circle"></i>Inhabilitar</a>
                    <%  } else {%>
                    <a href="../controlador/habilitar-personal.jsp?codigo=<%=personal.getCodigo()%>"><i class="icon-ok"></i>Habilitar</a>    
                    <%} %>
            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>
        <a class="btn btn-primary" href="nuevo-personal.jsp">Nuevo Personal</a>
    </div>
</div>
<jsp:include page="pie.jsp" />        

