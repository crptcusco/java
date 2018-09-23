<%@page import="modelo.Campana"%>
<jsp:include page="cabecera.jsp" />

<%
    Campana campana = Campana.buscarPorCodigo(request.getParameter("codigo"));
%>
<div class="row-fluid">
    <div class="navbar span10 offset1" >
<form id="formulario" name="formulario" class="form-horizontal" action="../controlador/editar-campana.jsp" method="POST">
    <fieldset>
        <legend>Modificar Campaña - Datos de Campaña</legend>

        <div class="control-group" >
            <label class="control-label" for="codigo">Codigo</label>
            <div class="controls">
                <input id="codigo" type="text" name="codigo" readonly value="<%=campana.getCodigo()%>">
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="nombre">Nombre</label>
            <div class="controls">
                <input id="nombre" type="text" name="nombre" value="<%=campana.getNombre()%>">
            </div>
        </div>
        <div class="control-group">        
            <label class="control-label"  for="contacto">Contacto</label>
            <div class="controls"><textarea rows="3" id="contacto" name="contacto" ><%=campana.getContacto()%></textarea><br>
            </div>
        </div>    

        <div class="control-group">
            <div class="input-append date" id="dp3" data-date="<%=campana.getFecha()%>" data-date-format="yy/mm/dd">
                <label class="control-label" for="fecha">Fecha</label>
                <div class="controls">
                    <input class="span2" size="80" value="<%=campana.getFecha()%>" readonly="" type="text" id="fecha" name="fecha">
                    <span class="add-on"><i class="icon-calendar"></i></span>
                </div>
            </div>
        </div>  

        <div class="control-group">        
            <label class="control-label" for="lugar">Lugar</label>
            <div class="controls"><input id="lugar" type="text" name="lugar" value="<%=campana.getLugar()%>">
            </div>
        </div>    
        <div class="control-group">  
            <label class="control-label" for="estado">Estado</label>
            <div class="controls"><select name="estado">
                    <option value="P" <% if (campana.getEstado().equals("P")) {
                            out.print("selected=\"selected\"");
                        } %>>Pendiente</option>
                    <option value="F" <% if (campana.getEstado().equals("F")) {
                            out.print("selected=\"selected\"");
                        }
                            %>>Finalizado</option>        
                </select></div>
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
</script>
 </div>
</div>


<jsp:include page="pie.jsp" /> 

