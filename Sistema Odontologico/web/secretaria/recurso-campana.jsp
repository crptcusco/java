
<%@page import="modelo.CampanaRecurso"%>
<%@page import="modelo.Campana"%>
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
        <%
            String codigo = request.getParameter("campana");
            Campana campana = Campana.buscarPorCodigo(codigo);
            double total = 0L;
            List<Recurso> ListaRecursos = Recurso.buscarTodos();
        %>
        <h3>Recursos de la Campaña : <%=campana.getNombre()%></h3>

        <form id="formulario" class="form-horizontal" action="../controlador/insertar-recurso-campana.jsp" method="POST">
            <fieldset>
                <legend>Agregar Recurso</legend>
                <div class="control-group">
                    <label class="control-label" for="recurso">Descripción y Unidad :</label>
                    <div class="controls">
                        <select name = recurso>
                            <%
                                for (Recurso recurso : ListaRecursos) {%>
                            <option value="<%=recurso.getCodigo()%>" > <%=(recurso.getNombre() + " - " + recurso.getMedida())%> </option>
                            <% }
                            %>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="precio">Precio Unitario :</label>
                    <div class="controls">        
                        <input id="precio" type="text" name="precio"><br>
                    </div>
                </div>
                        <div class="control-group">
                    <label class="control-label" for="precio">Cantidad :</label>
                    <div class="controls">
                <input id="cantidad" type="text" name="cantidad">
                    </div>
                </div>

                <input id="campana" name="campana" type="hidden" value="<%=campana.getCodigo()%>">
                <input type="submit" class="btn btn-primary" value="Agregar"> 
            </fieldset>
        </form>
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Recurso</th>
                    <th>Medida</th>
                    <th>Precio Unitario</th>
                    <th>Cantidad</th>
                    <th>Total</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<CampanaRecurso> listaDeRecursos = null;
                    listaDeRecursos = Campana.buscarRecursos(codigo);
                    for (CampanaRecurso campanaRecurso : listaDeRecursos) {
                %>
            <td><%=Recurso.buscarPorCodigo(campanaRecurso.getId_recurso()).getNombre()%></td>
            <td><%=Recurso.buscarPorCodigo(campanaRecurso.getId_recurso()).getMedida()%></td>
            <td><%=campanaRecurso.getC_costo_unitario()%></td>
            <td><%=campanaRecurso.getC_cantidad()%></td>
            <% total = total + (Double.parseDouble(campanaRecurso.getC_costo_unitario())
                        * Double.parseDouble(campanaRecurso.getC_cantidad()));%>
            <td><%= (Double.parseDouble(campanaRecurso.getC_costo_unitario())
                        * Double.parseDouble(campanaRecurso.getC_cantidad()))%></td>
            <td><a href="../controlador/eliminar-recurso-campana.jsp?campana=<%=campanaRecurso.getId_campana()%>&recurso=<%=campanaRecurso.getId_recurso()%>">Eliminar</a></td> 
            </tr>

            <% }%>
            <tr>
                <td></td>
                <td></td>
                <td></td>

                <td>Total</td>
                <td><%=total%></td>
                <td></td>
            </tr>
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

