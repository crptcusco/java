<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="box box-default">
	<div class="nav-tabs-custom">
		<ul id="cnt_vista" class="nav nav-tabs pull-right">
		  <li class="active"><a data-vista-cntrl="configPlan" aria-expanded="true" href="#tab_config" data-toggle="tab"><i class="fa fa-gear"></i></a></li>
		  <li><a data-vista-cntrl="viewPlan" aria-expanded="false" href="#tab_view" data-toggle="tab"><i class="fa fa-table"></i></a></li>
		  <li class="pull-left header">
		  <form class="form-inline" role="form">
		  	 <label for="cbPlan" data-vista="viewPlan"><i class="fa fa-th"></i>Plan:</label>
			 <label for="cbPlan" data-vista="configPlan"><i class="fa fa-th"></i>Configurar Plan</label>
			 <select class="form-control" name="cbPlan" id="cbPlan" data-vista="viewPlan">
				<c:forEach items="${listPlan}" var="plan">
					<option value=${plan.id}>${plan.nombre}</option>
				</c:forEach>	
			 </select>
		  </form>
		  </li>
		</ul>
		<div class="tab-content controls">
			<div class="tab-pane active clearfix" id="tab_config">
				<div class="pull-left">
					<label for="txtPlan">Plan:</label>
					<input type="text" id="txtPlan" class="form-control" />
				</div>
				<div class="pull-left">
					<label>Periodo:</label>
					<div id="reportrange"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i><span></span><b class="caret"></b></div>					
				</div>
				<div class="pull-left">
					<label for="txtHist"># Hist.:</label>
					<div>
					<input id="txtHist" size="4" type="number" class="form-control" min="7" max="365" value="20" />
					<button type="button" class="btn box-tool" data-savedate="true" id="savePlan" ><i class="fa fa-play"></i>Run</button>
					</div>
				</div>
			</div><!-- /.tab-pane -->
            <div class="tab-pane" id="tab_view">
				<div class="clearfix">
					<div class="pull-left">
						<label for="cbFlota">Flota:</label>
						<select class="form-control" id="cbFlota">
							<option value="todos">Todos</option>
							<c:set var="Proceso" value="-1" />
							<c:set var="Flota" />
							<c:forEach items="${listFlota}" var="itemflotas">
								<c:if test ="${Proceso !=itemflotas.proceso_id}" >
									<c:if test ="${Proceso !=-1}" >
									</optgroup>
									</c:if>
									<optgroup label="${itemflotas.proceso}">
									<option value="todosProceso" data-proceso="${itemflotas.proceso_id}">Todos ${itemflotas.proceso}</option>							
									<c:set var="Proceso" value="${itemflotas.proceso_id}"/>
								</c:if>
								<c:if test ="${Flota !=itemflotas.flota_modelo_id}" >							
									<option value="${itemflotas.flota_modelo_id}">${itemflotas.flota}</option>
									<c:set var="Flota" value="${itemflotas.flota_modelo_id}"/>
								</c:if>											
							</c:forEach>					
						</select>
					</div>
					<div class="pull-left">
						<label for="cbEquipo">Equipo:</label>
						<select class="form-control" name="files" id="cbEquipo">					
							<option value="todos" data-flota="0">Todos</option>	
							<c:set var="Flota" value="NN" />
							<c:forEach items="${listFlota}" var="itemflotas">
								<c:if test ="${Flota !=itemflotas.flota_modelo_id}" >
									<c:if test ="${Flota !=\"NN\"}" >
									</optgroup>
									</c:if>
									<optgroup data-proceso="${itemflotas.proceso_id}" data-flota="${itemflotas.flota_modelo_id}" label="${itemflotas.flota}">
									<option value="todos" data-flota="${itemflotas.flota_modelo_id}">Todos ${itemflotas.flota}</option>				
									<c:set var="Flota" value="${itemflotas.flota_modelo_id}"/>
								</c:if>							
									<option value="${itemflotas.equipo_id}">${itemflotas.equipo}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="clearfix">
					<div class="pull-left">
						<input type="radio" value="pm" name="dataView" id="viewEventos" checked="checked" /><label	for="viewEventos">Eventos</label>
						<input type="radio" value="durPM" name="dataView" id="viewTiempos" /><label for="viewTiempos">Tiempos</label>
						<input type="radio" value="disp" name="dataView" id="viewDispo" /><label for="viewDispo">Disponibilidad</label>
					</div>
				</div>
				<div class="clearfix">
					<div class="pull-left">
						<input type="radio" name="tipoResumen" value="Equipo" id="viewEquipo" checked="checked" /><label for="viewEquipo">Equipo</label>
						<input type="radio" name="tipoResumen" value="Flota" id="viewFlota" /><label for="viewFlota">Flota</label>						
					</div>
				</div>
            </div><!-- /.tab-pane -->
        </div><!-- /.tab-content -->
    </div><!-- nav-tabs-custom -->
</div>
          
<!-- /.box -->
<div class="box" data-vista="configPlan">
	<div class="nav-tabs-custom">
        <ul class="nav nav-tabs">
            <li class="active"><a aria-expanded="true" href="#tab_horometros" data-toggle="tab">Horometros</a></li>
            <li class=""><a aria-expanded="false" href="#tab_ultimosPMs" data-toggle="tab">Ultimos PMs</a></li>
        </ul>
		<div class="tab-content">
			<div class="tab-pane active" id="tab_horometros">
				<form id="formH" method="post" action="/planEquipos/loadHorometro" enctype="multipart/form-data">
					<input id="fileupload" class="btn box-tool" type="file" />
					<button id="uploadHorometro" class="btn box-tool" type="button">
						<i class="fa fa-upload"> Cargar datos</i>
					</button>
				</form>			
					
				<div class="box-body no-padding table-responsive">
					<table id ="tHorometros" class="table table-bordered table-striped dataTable" role="grid">
					<thead>
					<tr>
						<th>Proceso</th>
						<th>Flota</th>
						<th>Equipo</th>
						<th>Fecha</th>
						<th>Hor.Ini</th>
						<th>Hor.Fin</th>
						<th>Horas</th>
					</tr>		
					</thead>
					<tfoot>
					<tr>
						<th>Proceso</th>
						<th>Flota</th>
						<th>Equipo</th>
						<th>Fecha</th>
						<th>Hor.Ini</th>
						<th>Hor.Fin</th>
						<th>Horas</th>
					</tr>		
					</tfoot>
					</table>
				</div>
			</div><!-- /.tab-pane -->
			<div class="tab-pane" id="tab_ultimosPMs">
				<button class="btn box-tool" type="button">
					<i class="fa fa-upload"> Cargar datos</i>
				</button>
				<div class="box-body no-padding table-responsive">
					<table id ="tultimosPMs" class="table table-striped table-bordered table-hover table-condensed">
					<thead>
					<tr>
						<th>Proceso</th>
						<th>Flota</th>
						<th>Equipo</th>						
						<th>Horometro PM</th>
						<th>Fecha</th>
					</tr>		
					</thead>
					<tfoot>
					<tr>
						<th>Proceso</th>
						<th>Flota</th>
						<th>Equipo</th>					
						<th>Horometro PM</th>
						<th>Fecha</th>
					</tr>		
					</tfoot>
					</table>
				</div>
			</div><!-- /.tab-pane -->
		</div><!-- /.tab-content -->
	</div>
</div>
<div class="box" data-vista="viewPlan">
	<div class="box-header">
		<h3 class="box-title" id="titleBoxRs"></h3>
		<div class="box-tools">
			<ul class="pagination pagination-sm no-margin pull-right">
				<li><a href="#">Excel</a></li>
				<li><a href="#">Csv</a></li>
				<li><a href="#">Pdf</a></li>
			</ul>
		</div>
	</div>
	<!-- /.box-header -->
	<div id="divtables" class="box-body no-padding table-responsive">
	<table id="alldetalleEquipo" class="table table-striped table-bordered table-hover table-condensed">
	<thead>
		<tr>
		<th>Modelo</th>
		<th>Equipo</th>
		</tr>
	</thead>
	<c:set var="Flota" value="NN" />
		<c:forEach items="${listFlota}" var="itemflotas">
			<c:if test ="${Flota !=itemflotas.flota_modelo_id}" >
				<c:if test ="${Flota !=\"NN\"}" >
					</tbody>
				</c:if>
				<tbody data-proceso="${itemflotas.proceso_id}" data-flota="${itemflotas.flota_modelo_id}">
				<c:set var="Flota" value="${itemflotas.flota_modelo_id}"/>
			</c:if>
			<tr data-equipo="${itemflotas.equipo_id}">
				<th>${itemflotas.codModelo}</th>
				<th>${itemflotas.equipo}</th>
			</tr>
		</c:forEach>
	</table>
	<table id="alldetalleFlota" class="table table-striped table-bordered table-hover table-condensed">
	<thead>
		<tr>
		<th>Proceso</th>
		<th>Modelo</th>
		</tr>
	</thead>
	<c:set var="Flota" value="NN" />
		<c:forEach items="${listFlota}" var="itemflotas">
			<c:if test ="${Flota != itemflotas.flota_modelo_id}" >
				<tbody data-proceso="${itemflotas.proceso_id}" data-flota="${itemflotas.flota_modelo_id}">
				<tr data-flota="${itemflotas.flota_modelo_id}">
					<th>${itemflotas.proceso}</th>
					<th>${itemflotas.codModelo}</th>
				</tr>
				</tbody>
				<c:set var="Flota" value="${itemflotas.flota_modelo_id}"/>
			</c:if>
		</c:forEach>
	</table>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->
<script type="text/javascript">
<%@include file="js/js_planEquipos.jsp" %>
</script>
<div id="popsEquipo"></div>