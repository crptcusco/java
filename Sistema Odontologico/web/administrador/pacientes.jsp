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
        <form action="pacientes.jsp">
            <div class="input-append">
                <input name="busqueda" class="input-large" id="appendedInputButtons" type="text">
                <button class="btn" type="submit">Buscar</button>
            </div>
        </form>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>

                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>Fecha Nacimiento</th>
                    <th>DNI</th>
                    <th>Sexo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Paciente> listaDePaciente = null;
                    listaDePaciente = Paciente.buscarTodos();

                    try {
                        if (request.getParameter("busqueda").isEmpty()) {
                            System.out.println("No existe una Busqueda");
                        }
                        listaDePaciente = Paciente.buscarPorNombre(request.getParameter("busqueda"));
                    } catch (Exception e) {
                    }
                    for (Paciente paciente : listaDePaciente) {
                %>

            <td><%=paciente.getNombre()%></td>
            <td><%=paciente.getApellido()%></td>
            <td><%=paciente.getFecha()%></td>
            <td><%=paciente.getDni()%></td>
            <td><%=paciente.getSexo()%></td>
            <td>
                <a href="modificar-paciente.jsp?codigo=<%=paciente.getCodigo()%>"><i class="icon-pencil"></i> Editar</a>


            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>

    </div>
</div>
<jsp:include page="pie.jsp" />        


