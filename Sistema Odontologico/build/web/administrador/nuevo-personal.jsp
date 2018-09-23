<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario" class="form-horizontal" action="../controlador/insertar-personal.jsp" method="POST">
            <fieldset>
                <legend>Nuevo Personal - Datos de Personal</legend>

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
                            <input class="span2" size="80" value="12/02/16" readonly="" type="text" id="fecha" name="fecha">
                            <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="dni">DNI</label>
                    <div class="controls"><input id="dni" type="text" name="dni"></div>
                </div>
                <div class="control-group">  
                    <label class="control-label" for="telefono">Telefono</label>
                    <div class="controls"><input id="telefono" type="text" name="telefono">
                    </div>
                </div>
                <div class="control-group">  
                    <label class="control-label" for="direccion">direccion</label>
                    <div class="controls"><input id="direccion" type="text" name="direccion">
                    </div>
                </div>
                <div class="control-group">  
                    <label class="control-label" for="tipo">Tipo de Usuario</label>
                    <div class="controls"><select id="tipo" name="tipo" >
                            <option>Administrador</option>
                            <option>Operador</option>
                            <option>Odontologo</option>
                            <option>Practicante</option>
                            <option>Colaborador</option>
                        </select></div>
                </div>
                <div class="control-group">  
                    <label class="control-label" for="estado">Estado del Usuario</label>
                    <div class="controls"><select name="estado">
                            <option value="A">Activo</option>
                            <option value="I">Inactivo</option>
                        </select></div>
                </div>
                <div class="control-group">  
                    <label class="control-label" for="contrasena1">Contraseña</label>
                    <div class="controls"><input id="contrasena1" type="password" name="contrasena1"></div>
                </div>
                <div class="control-group">  
                    <label class="control-label" for="contrasena2">Repetir Contraseña</label>
                    <div class="controls"><input id="contrasena2" type="password" name="contrasena2"></div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input type="submit" class="btn btn-primary" value="Grabar" >
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
