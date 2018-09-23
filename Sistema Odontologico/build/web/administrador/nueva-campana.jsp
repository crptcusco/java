<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario" class="form-horizontal" action="../controlador/insertar-campana.jsp" method="POST">
            <fieldset>
                <legend>Nueva Campaña - Datos de Campaña</legend>

                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre"><br></div>
                </div>

                <div class="control-group">        
                    <label class="control-label"  for="contacto">Contacto</label>
                    <div class="controls"><textarea rows="3" id="contacto" name="contacto"></textarea></div>  
                </div>

                <div class="control-group">
                    <div class="input-append date" id="dp3" data-date="12/02/16" data-date-format="yy/mm/dd">
                        <label class="control-label" for="fecha">Fecha</label>
                        <div class="controls">
                            <input class="span2" size="80" value="12/02/16" readonly="" type="text" id="fecha" name="fecha">
                            <span class="add-on"><i class="icon-calendar"></i></span>
                        </div>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="lugar">Lugar</label>
                    <div class="controls"><input id="lugar" type="text" name="lugar"></div>
                </div>

                <div class="control-group">  
                    <label class="control-label" for="estado">Estado</label>
                    <div class="controls"><select name="estado">
                            <option value="P">Pendiente</option>
                            <option value="F">Finalizado</option>
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

            $(function() {
                $('#formulario').validate();
            });

        </script>
    </div>
</div>
<jsp:include page="pie.jsp" /> 


