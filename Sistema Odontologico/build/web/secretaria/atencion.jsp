<%@page import="modelo.*"%>

<%@page import="java.util.List"%>
<%@page import="modelo.Campana"%>
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
        
        <% Campana campana = Campana.buscarPorCodigo(request.getParameter("campana"));%>
        <h4>Listado de Atenciones - Campaña <%=campana.getNombre() %></h4>
        
        <table class="table table-condensed table-hover table-bordered">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Paciente</th>
                    <th>Personal</th>
                    <th>Atenciones</th>
                    <th>Problemas</th>
                    <th>Observaciones</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<AtencionAccion> listaAtencionAccion = null;
                    List<AtencionProblema> listaAtencionProblema = null;
                
                    String codigo = request.getParameter("campana");
                    List<Atencion> listaDeAtencion = null;
                    listaDeAtencion = Campana.buscarAtenciones(codigo);
                    for (Atencion atencion : listaDeAtencion) {
                        Paciente paciente = Paciente.buscarPorCodigo(atencion.getPaciente());
                        Personal personal = Personal.buscarPorCodigo(atencion.getPersonal());
                        
                %>
            <td><%=atencion.getCodigo() %></td>
            <td><%=paciente.getNombre()+" "+ paciente.getApellido() %></td>
            <td><%=personal.getNombre() +" "+ personal.getApellido() %></td>
            <td>
           
            <%
            listaAtencionAccion = Atencion.buscarAcciones(atencion.getCodigo());
            for(AtencionAccion atencionAccion :listaAtencionAccion ){%>
            <%=Accion.buscarPorCodigo(atencionAccion.getCodigoAccion()).getNombre()%>
            <%}        
            %>
            </td>
            
            <td>
           
            <%
            listaAtencionProblema = Atencion.buscarProblemas(atencion.getCodigo());
            for(AtencionProblema atencionProblema :listaAtencionProblema ){%>
            <%=Problema.buscarPorCodigo(atencionProblema.getCodigoProblema()).getNombre()%><br>
            <%}        
            %>
            </td>
            
            <td><%=atencion.getObservaciones() %></td>
            <td>
                <p><a href="modificar-atencion.jsp?codigo=<%=atencion.getCodigo()%>&campana=<%=request.getParameter("campana")%>"><i class="icon-edit"></i>Editar</a></p>
                <p><a href="../controlador/eliminar-atencion.jsp?codigo=<%=atencion.getCodigo()%>&campana=<%=request.getParameter("campana")%>"><i class="icon-remove"></i>Eliminar</a></p>              
            </td> 
            </tr>
            <% }%>
            </tbody>
        </table>
            <a class="btn btn-primary" href="nueva-atencion.jsp?campana=<%=request.getParameter("campana")%>">Nueva Atención</a>
    </div>
</div>
<jsp:include page="pie.jsp" />        
