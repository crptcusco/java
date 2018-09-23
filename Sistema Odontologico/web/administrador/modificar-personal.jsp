<%@page import="modelo.Personal"%>
<jsp:include page="cabecera.jsp" />

<%
    Personal personal = Personal.buscarPorCodigo(request.getParameter("codigo"));
%>
<div class="row-fluid">
    <div class="navbar span10 offset1" >
<form id="formulario" name="formulario" class="form-horizontal" action="../controlador/editar-personal.jsp" method="POST">
    <fieldset>
        <legend>Modificar Personal - Datos de Personal</legend>

        <div class="control-group" >
            <label class="control-label" for="codigo">Codigo</label>
            <div class="controls">
                <input id="codigo" type="text" name="codigo" readonly value="<%=personal.getCodigo()%>">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="nombre">Nombres</label>
            <div class="controls">
                <input id="nombre" type="text" name="nombre" value="<%=personal.getNombre()%>">
            </div>
        </div>
        <div class="control-group">        
            <label class="control-label"  for="apellido">Apellidos</label>
            <div class="controls"><input id="apellido" type="text" name="apellido" value="<%=personal.getApellido()%>"><br>
            </div>
        </div>    

        <div class="control-group">
            <div class="input-append date" id="dp3" data-date="<%=personal.getFecha()%>" data-date-format="yy/mm/dd">
                <label class="control-label" for="fecha">Fecha de Nacimiento</label>
                <div class="controls">
                    <input class="span2" size="80" value="<%=personal.getFecha()%>" readonly="" type="text" id="fecha" name="fecha">
                    <span class="add-on"><i class="icon-calendar"></i></span>
                </div>
            </div>
        </div>  

        <div class="control-group">        
            <label class="control-label" for="dni">DNI</label>
            <div class="controls"><input id="dni" type="text" name="dni" value="<%=personal.getDni()%>">
            </div>
        </div>    
        <div class="control-group">  
            <label class="control-label" for="telefono">Telefono</label>
            <div class="controls"><input id="telefono" type="text" name="telefono" value="<%=personal.getTelefono()%>">
            </div>
        </div>                        
        <div class="control-group">  
            <label class="control-label" for="direccion">direccion</label>
            <div class="controls"><input id="direccion" type="text" name="direccion" value="<%=personal.getDireccion()%>">
            </div>
        </div>

        <div class="control-group">  
            <label class="control-label" for="tipo">Tipo de Usuario</label>
            <div class="controls"><select name="tipo" id="tipo">
                    <option value="Administrador" <% if (personal.getTipo().equals("Administrador")) {
                            out.print("selected=\"selected\"");
                        } %>>Administrador</option>
                    <option value="Operador" <% if (personal.getTipo().equals("Operador")) {
                            out.print("selected=\"selected\"");
                        } %>>Operador</option>
                    <option value="Odontologo" <% if (personal.getTipo().equals("Odontologo")) {
                            out.print("selected=\"selected\"");
                        } %>>Odontologo</option>
                    <option value="Practicante" <% if (personal.getTipo().equals("Practicante")) {
                            out.print("selected=\"selected\"");
                        } %>>Practicante</option>
                    <option value="Colaborador" <% if (personal.getTipo().equals("Colaborador")) {
                            out.print("selected=\"selected\"");
                        } %>>Colaborador</option>
                </select></div>
        </div>

        <div class="control-group">  
            <label class="control-label" for="estado">Estado del Usuario</label>
            <div class="controls"><select name="estado">
                    <option value="A" <% if (personal.getEstado().equals("A")) {
                            out.print("selected=\"selected\"");
                        } %>>Activo</option>
                    <option value="I" <% if (personal.getEstado().equals("I")) {
                            out.print("selected=\"selected\"");
                        }
                            %>>Inactivo</option>        
                </select></div>
        </div>

        <div class="control-group">  
            <label class="control-label" for="contrasena1">Contraseña</label>
            <div class="controls"><input id="contrasena1" type="text" name="contrasena1" value="<%=personal.getContrasena()%>">
            </div>
        </div>
        <div class="control-group">  
            <label class="control-label" for="contrasena2">Repetir Contraseña</label>
            <div class="controls"><input id="contrasena2" type="text" name="contrasena1" value="<%=personal.getContrasena()%>">
            </div>
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
                $('#formulario').validate();
            });
            $(function() {
                window.prettyPrint && prettyPrint();
                $('#dp3').datepicker();
            });

            $("#tipo").change(function() {
                if ($(this).val() === "Odontologo" || $(this).val() === "Practicante" || $(this).val() === "Colaborador") {
                    $("#contrasena1").prop('disabled', true);
                    $("#contrasena2").prop('disabled', true);
                }
                else {
                    $("#contrasena1").prop('disabled', false);
                    $("#contrasena2").prop('disabled', false);
                }
            });
</script>
 </div>
</div>


<jsp:include page="pie.jsp" /> 
