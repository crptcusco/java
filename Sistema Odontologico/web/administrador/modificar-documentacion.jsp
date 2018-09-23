<%@page import="modelo.Documentacion"%>
<jsp:include page="cabecera.jsp" />

<%
    Documentacion documentacion = Documentacion.buscarPorCodigo(request.getParameter("codigo"));
%>
<div class="row-fluid">
    <div class="navbar span10 offset1" >
        <form id="formulario" class="form-horizontal" action="../controlador/editar-documentacion.jsp" method="post" enctype="multipart/form-data">
            <fieldset>
                <legend>Modificar Documentacion - Datos de Documentacion</legend>

                <div class="control-group" class="form-horizontal">
                    <label class="control-label" for="codigo">Codigo</label>
                    <div class="controls">
                        <input id="codigo" type="text" name="codigo" readonly value="<%=documentacion.getCodigo()%>">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre" value="<%=documentacion.getNombre()%>">
                    </div>
                </div>

                <div class="control-group">        
                    <label class="control-label" for="file">Nuevo Archivo</label>
                    <div class="controls"><input id="file" type="file" name="file"></div>
                </div> 

                <div class="control-group">        
                    <label class="control-label"  for="ruta">Archivo Actual</label>
                    <div class="controls"><input readonly id="ruta" type="text"  name="ruta" value="<%=documentacion.getRuta()%>"><br>
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input type="submit" class="btn btn-primary" value="Grabar" >
                    </div>
                </div>
            </fieldset>
        </form>
    </div>
</div>

<jsp:include page="pie.jsp" /> 