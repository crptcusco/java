<%@page import="modelo.Problema"%>
<jsp:include page="cabecera.jsp" />

<%
    Problema problema = Problema.buscarPorCodigo(request.getParameter("codigo"));
%>
<div class="row-fluid">
    <div class="navbar span10 offset1" >
<form class="form-horizontal" action="../controlador/editar-problema.jsp" method="POST">
            <fieldset>
                <legend>Modificar Problema - Datos de Problema</legend>

                <div class="control-group" class="form-horizontal">
                    <label class="control-label" for="codigo">Codigo</label>
                    <div class="controls">
                        <input id="codigo" type="text" name="codigo" readonly="true" value="<%=problema.getCodigo()%>">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input id="nombre" type="text" name="nombre" value="<%=problema.getNombre()%>">
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
