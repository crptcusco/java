<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form class="form-horizontal" action="../controlador/insertar-paciente.jsp" method="POST">
            <fieldset>
                <legend>Nuevo Paciente - Datos de Paciente</legend>

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
                    <label class="control-label" for="sexo">Sexo</label>
                <div class="controls"><select name="sexo">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select></div>
                </div>
                
                <div class="control-group">
                            <div class="controls">
                <input type="submit" class="btn btn-primary" value="Grabar" >
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
