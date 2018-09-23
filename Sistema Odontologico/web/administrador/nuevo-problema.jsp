<jsp:include page="cabecera.jsp" />
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form class="form-horizontal" action="../controlador/insertar-problema.jsp" method="POST">
            <fieldset>
                <legend>Nuevo Problema - Datos de Problema</legend>

                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre"><br></div>
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
