<%@page import="modelo.Accion"%>
<%@page import="modelo.Problema"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Personal"%>
<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario" class="form-horizontal" action="../controlador/insertar-atencion.jsp" method="POST">
            <fieldset>
                <legend>Nueva Atención </legend>
                <div class="row-fluid">
                    <div class="span6">
                        <h3>Datos del Paciente</h3>
                        <div class="control-group">
                            <label class="control-label" for="nombre">Nombres</label>
                            <div class="controls">
                                <input id="nombre" type="text" name="nombre"><br></div>
                        </div>

                        <div class="control-group">        
                            <label class="control-label"  for="apellido">Apellidos</label>
                            <div class="controls"><input id="apellido" type="text" name="apellido"></div>  
                        </div>

                        <div class="control-group">
                            <div class="input-append date" id="dp3" data-date="12/02/16" data-date-format="yy/mm/dd">
                                <label class="control-label" for="fecha">Fecha de Nacimiento</label>
                                <div class="controls">
                                    <input class="span2" size="160" value="12/02/16" readonly="" type="text" id="fecha" name="fecha">
                                    <span class="add-on"><i class="icon-calendar"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="dni">DNI</label>
                            <div class="controls"><input maxlength="8" id="dni" type="text" name="dni"></div>
                        </div>

                        <div class="control-group">  
                            <label class="control-label" for="sexo">Sexo</label>
                            <div class="controls"><select name="sexo">
                                    <option value="M">Masculino</option>
                                    <option value="F">Femenino</option>
                                </select></div>
                        </div>
                    </div>  

                    <div class="span6">
                        <h3>Datos de la Atención</h3>
                        <div class="control-group">  
                            <label class="control-label" for="personal">Odontologo que realizo la Atención</label>
                            <div class="controls"><select name="personal">
                                    <%
                                        List<Personal> listaDePersonal = Personal.buscarTodos();
                                        for (Personal personal : listaDePersonal) {
                                            if (personal.getTipo().equals("Odontologo")) {
                                    %>
                                    <option value="<%=personal.getCodigo()%>"><%=personal.getNombre() + " " + personal.getApellido()%> </option>
                                    <%}
                                        }%> 
                                </select></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="observacion">Observaciones</label>
                            <div class="controls"><textarea name="observaciones" rows="5" ></textarea></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="campana"></label>
                            <div class="controls"><input type="hidden" value="<%=request.getParameter("campana")%>" name="campana"></div>
                        </div>

                    </div>
                </div>
                <div class="row-fluid">
                    <div class="span6">
                        <h3>Curaciones Realizadas</h3>
                        <%
                            List<Accion> listaDeAccion = Accion.buscarTodos();
                            for (Accion accion : listaDeAccion) {

                        %>
                        <p><input name="acciones" value="<%=accion.getCodigo()%>" type="checkbox"> <%=accion.getNombre()%></p>
                            <%}%> 
                    </div>
                    <div class="span6">
                        <h3>Problemas Dentales Encontrados</h3>
                        <%
                            List<Problema> listaDeProblema = Problema.buscarTodos();
                            for (Problema problema : listaDeProblema) {
                        %>
                        <p><input name="problemas" value="<%=problema.getCodigo()%>" type="checkbox"> <%=problema.getNombre()%></p>
                            <%}%>
                        <div class="control-group">
                            <div class="controls">
                                <input type="submit" class="btn btn-primary" value="Grabar" >
                            </div>
                        </div>
                    </div>
                </div>        
            </fieldset>
        </form>

        <script>
            $(function() {
                window.prettyPrint && prettyPrint();
                $('#dp3').datepicker();
            });
          
            $(function() {
                $('#formulario').validate();
            });
        </script>
    </div>
</div>
<jsp:include page="pie.jsp" /> 


