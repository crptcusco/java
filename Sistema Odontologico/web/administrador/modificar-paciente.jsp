<%@page import="modelo.Paciente"%>
<jsp:include page="cabecera.jsp" />

<%
    Paciente paciente = Paciente.buscarPorCodigo(request.getParameter("codigo"));
%>
<div class="row-fluid">
    <div class="navbar span10 offset1" >
<form id="formulario" name="formulario" class="form-horizontal" action="../controlador/editar-paciente.jsp" method="POST">
    <fieldset>
        <legend>Modificar Paciente - Datos de Paciente</legend>

        <div class="control-group" >
            <label class="control-label" for="codigo">Codigo</label>
            <div class="controls">
                <input id="codigo" type="text" name="codigo" readonly value="<%=paciente.getCodigo()%>">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="nombre">Nombres</label>
            <div class="controls">
                <input id="nombre" type="text" name="nombre" value="<%=paciente.getNombre()%>">
            </div>
        </div>
        <div class="control-group">        
            <label class="control-label"  for="apellido">Apellidos</label>
            <div class="controls"><input id="apellido" type="text" name="apellido" value="<%=paciente.getApellido()%>"><br>
            </div>
        </div>    

        <div class="control-group">
            <div class="input-append date" id="dp3" data-date="<%=paciente.getFecha()%>" data-date-format="yy/mm/dd">
                <label class="control-label" for="fecha">Fecha de Nacimiento</label>
                <div class="controls">
                    <input class="span2" size="80" value="<%=paciente.getFecha()%>" readonly="" type="text" id="fecha" name="fecha">
                    <span class="add-on"><i class="icon-calendar"></i></span>
                </div>
            </div>
        </div>  

        <div class="control-group">        
            <label class="control-label" for="dni">DNI</label>
            <div class="controls"><input id="dni" maxlength="8" type="text" name="dni" value="<%=paciente.getDni()%>">
            </div>
        </div>    


        <div class="control-group">  
            <label class="control-label" for="sexo">Sexo</label>
            <div class="controls"><select name="sexo">
                    <option value="M" <% if (paciente.getSexo().equals("M")) {
                            out.print("selected=\"selected\"");
                        } %>>Masculino</option>
                    <option value="F" <% if (paciente.getSexo().equals("F")) {
                            out.print("selected=\"selected\"");
                        }
                            %>>Femenino</option>        
                </select></div>
        </div>

        <div class="control-group">
            <div class="controls">
                <input type="submit" class="btn btn-primary" value="Grabar" >
            </div>
        </div>
    </fieldset>
</form>

<script>
    $(function() {
        window.prettyPrint && prettyPrint();
        $('#dp3').datepicker();
    });
</script>
 </div>
</div>


<jsp:include page="pie.jsp" /> 
