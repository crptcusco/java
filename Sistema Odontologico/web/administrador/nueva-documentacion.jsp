<jsp:include page="cabecera.jsp" />

<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario" class="form-horizontal" action="../controlador/insertar-documentacion.jsp" method="POST" enctype="multipart/form-data" >
            <fieldset>
                <legend>Nuevo Documentacion - Datos de Documentacion</legend>
                <div class="control-group" >
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre"></div>
                </div>
                <div class="control-group">        
                    <label class="control-label" for="file">Ruta</label>
                    <div class="controls"><input id="file" type="file" name="file" ></div>
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
        </script>
    </div>
</div>

<jsp:include page="pie.jsp" /> 

