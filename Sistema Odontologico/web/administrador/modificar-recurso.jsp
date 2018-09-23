<%@page import="modelo.Recurso"%>
<jsp:include page="cabecera.jsp" />

<%
    Recurso recurso = Recurso.buscarPorCodigo(request.getParameter("codigo"));
%>
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario"  class="form-horizontal" action="../controlador/editar-recurso.jsp" method="POST">
            <fieldset>
                <legend>Modificar Recurso - Datos de Recurso</legend>

                <div class="control-group" class="form-horizontal">
                    <label class="control-label" for="codigo">Codigo</label>
                    <div class="controls">
                        <input id="codigo" type="text" name="codigo" readonly="true" value="<%=recurso.getCodigo()%>">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre" value="<%=recurso.getNombre()%>">
                    </div>
                </div>
                <div class="control-group">        
                    <label class="control-label"  for="medida">Medida</label>
                    <div class="controls"><input id="medida" type="text" name="medida" value="<%=recurso.getMedida()%>"><br>
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
