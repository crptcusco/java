<%@page import="java.util.List"%>
<%@page import="modelo.Paciente"%>
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
        <h4>Listado de Pacientes</h4>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Fecha Nacimiento</th>
                    <th>DNI</th>
                    <th>Sexo</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Paciente> listaDePaciente = null;
                    listaDePaciente = Paciente.buscarTodos();
                    for (Paciente paciente : listaDePaciente) {
                %>
            <td><%=paciente.getCodigo()%></td>
            <td><%=paciente.getNombre()%></td>
            <td><%=paciente.getApellido()%></td>
            <td><%=paciente.getFecha() %></td>
            <td><%=paciente.getDni()%></td>
            <td><%=paciente.getSexo()%></td>

            </tr>
            <% }%>
            </tbody>
        </table>
    </div>
</div>
<jsp:include page="pie.jsp" />        


