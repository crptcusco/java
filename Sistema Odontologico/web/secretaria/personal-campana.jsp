
<%@page import="modelo.Campana"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Personal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.DataBaseHelper"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>
<%@page import="modelo.CampanaPersonal"%>

<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <%
            String codigo = request.getParameter("campana");
            Campana campana = Campana.buscarPorCodigo(codigo);
            List<Personal> ListaPersonal = Personal.buscarTodos();
        %>
        <h3>Personal de la Campaña : <%=campana.getNombre()%></h3>

        <form id="formulario" class="form-inline" action="../controlador/insertar-personal-campana.jsp" method="POST">
            <fieldset>
                <legend>Agregar Personal</legend>
                <input id="campana" name="campana" type="hidden" value="<%=campana.getCodigo()%>">
                <label  for="personal">Descripción y Unidad :
                <select class="input-xxlarge" name = "personal">
                    <%
                            for (Personal personal : ListaPersonal) {%>
                    <option value="<%=personal.getCodigo()%>" > <%=(personal.getNombre() + " " + personal.getApellido()) + " - " + personal.getTipo()%> </option>
                    <% }%>
                </select></label>
                <input type="submit" class="btn btn-primary" value="Incluir en la Campaña"> 

            </fieldset>
        </form>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Cargo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CampanaPersonal> listaDePersonal = null;
                    listaDePersonal = Campana.buscarPersonal(codigo);
                    for (CampanaPersonal campanaPersonal : listaDePersonal) {
                        Personal personal = Personal.buscarPorCodigo(campanaPersonal.getId_personal());
                %>
            <td><%=personal.getNombre()%></td>    
            <td><%=personal.getApellido()%></td>
            <td><%=personal.getTipo()%></td>
            <td><a href="../controlador/eliminar-personal-campana.jsp?campana=<%=campanaPersonal.getId_campana()%>&personal=<%=campanaPersonal.getId_personal()%>">Retirar</a></td> 
            </tr>
            <% }%>
            </tbody>
        </table>
        <script>
            $(function() {
                $('#formulario').validate();
            });
        </script>
    </div>
</div>
<jsp:include page="pie.jsp" />
