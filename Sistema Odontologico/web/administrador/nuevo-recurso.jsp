<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario" class="form-horizontal" action="../controlador/insertar-recurso.jsp" method="POST">
            <fieldset>
                <legend>Nuevo Recurso - Datos de Recurso</legend>

                <div class="control-group" >
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre"><br></div>
                </div>

                <div class="control-group">        
                    <label class="control-label"  for="medida">Medida</label>
                    <div class="controls"><input id="medida" type="text" name="medida"></div>  
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
