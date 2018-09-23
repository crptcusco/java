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
        <h4>Listado de Personal</h4>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DNI</th>
                    <th>Telefono</th>
                    <th>Direccion</th>
                    <th>Tipo de Usuario</th>
                    <th>Estado de Usuario</th>

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

            </tr>
            <% }%>
            </tbody>
        </table>
        
    </div>
</div>
<jsp:include page="pie.jsp" />        

