oApp={
	init:function(){
		//combos dependientes
		$("#cbFlota").change(function(){
			valFlota=$(this).val()
			if (valflota=="todos"){
				$("#cbEquipo optgroup").show();
			}else if(valflota="todosProceso"){
				$("#cbEquipo optgroup").hide()
				$("#cbEquipo optgroup[data-group-proceso=\""+$(this).attr("data-group-proceso")+"\"]").show();
			}
			else{
				$("#cbEquipo optgroup").hide()
				$("#cbEquipo optgroup[data-group-flota=\""+valFlota+"\"]").show();
			}
		});
		
		$("#tDetalleFlota td .badge").each(function(){
			equipo=$( 'th:first-child', $( this ).parents('tr')).text()
			$(this).popover({title:"PM-"+$(this).text(),content:"<table class=\"table table-striped table-bordered table-condensed\">"+
																"<tr><th>Equipo</th><td>"+equipo+"</td></tr>"+
																"<tr><th>Horometro</th><td>1245</td></tr>"+
																"<tr><th>Tiempo</th><td>6 hrs.</td></tr></table>"+
																"<i class=\"fa fa-fw fa-arrow-left\"></i><i class=\"fa fa-fw fa-arrow-right\"></i>"

							, html:true})
		});
		$("#tDetalleTodos td").each(function(){
			$(this).popover({title:"Palas: "+$(this).text()+" Parada(s)",content:"<table class=\"table table-striped table-bordered table-condensed\"><tr><th>Equipo</th><th>Tipo</th><th>Tiempo</th><th>Horometro</th></tr>"+
																		"<tr><th>SH001</th><td><span class=\"badge bg-blue\">PRE</span></td><td>6 hrs.</td><td>254.2 hrs.</td></tr>"+
																		"<tr><th>SH002</th><td><span class=\"badge bg-orange\">2000</span></td><td>6 hrs.</td><td>254.2 hrs.</td></tr></table>", html:true,container: "body"})
		});
		
		$("#tResumenFlota td").each(function(){
			equipo=$( 'th:first-child', $( this ).parents('tr')).text()
			$(this).popover({title:"<b>SH001</b> <i class=\"fa fa-long-arrow-right\"></i> <span class=\"badge bg-blue\">PRE</span>",content:"<table class=\"table table-striped table-bordered table-condensed\">"+
																"<tr><th>Fecha</th><th>Tiempo</th></tr>"+
																"<tr><td>12/07/2015</td><td>2 hrs.</td></tr>"+
																"<tr><td>19/07/2015</td><td>2 hrs.</td></tr></table>"

							, html:true,container: "body"})
		});
		$("#tResumenTodos td").each(function(){
			equipo=$( 'th:first-child', $( this ).parents('tr')).text()
			$(this).popover({title:"<b>Palas</b> <i class=\"fa fa-long-arrow-right\"></i> <span class=\"badge bg-blue\">PRE</span>",content:"<table class=\"table table-striped table-bordered table-condensed\">"+
																"<tr><th>Equipo</th><th>Fecha</th><th>Tiempo</th></tr>"+
																"<tr><th>SH001</th><td>12/07/2015</td><td>2 hrs.</td></tr>"+
																"<tr><th>SH002</th><td>19/07/2015</td><td>2 hrs.</td></tr></table>"

							, html:true,container: "body"})
		});
		$('#reportrange span').html(moment().endOf('week').add(1,'day').format('DD MMM, YYYY') + ' - ' + moment().endOf('week').add(1,'day').endOf('week').format('DD MMM, YYYY'));
	    $('#reportrange').daterangepicker({
	        format: 'DD/MM/YYYY',
	        startDate:moment().endOf('week').add(1,'day'),
	        endDate: moment().endOf('week').add(1,'day').endOf('week'),
	        minDate: moment(),
	        showDropdowns: true,
	        showWeekNumbers: true,
	        timePicker: false,
	        timePickerIncrement: 1,
	        timePicker12Hour: true,
	        ranges: {
	           'Sgte Semana': [moment().endOf('week').add(1,'days'), moment().endOf('week').add(1,'days').endOf('week')],
	           'Sgte Més': [moment().endOf('month').add(1,'days'), moment().endOf('month').add(1,'days').endOf('month')],
	           'Proximos 7 dias ': [moment().add(1,'days'), moment().add(7,'days')],
	           'Proximos 30 dias': [moment().add(1,'days'), moment().add(30,'days')],
	           'Resto Semana': [moment(), moment().endOf('week')],
	           'Resto Més': [moment(), moment().endOf('month')]
	        },
	        opens: 'left',
	        drops: 'down',
	        buttonClasses: ['btn', 'btn-sm'],
	        applyClass: 'btn-primary',
	        cancelClass: 'btn-default',
	        separator: ' á ',
	        locale: {
	            applyLabel: 'Seleccionar',
	            cancelLabel: 'Cancelar',
	            fromLabel: 'Desde',
	            toLabel: 'Hasta',
	            customRangeLabel: 'Personalizado',
	            daysOfWeek: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi','Sa'],
	            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	            firstDay: 1
	        }
	    }, function(start, end, label) {
	        console.log(start.toISOString(), end.toISOString(), label);
	        $('#reportrange span').html(start.format('DD MMM, YYYY') + ' - ' + end.format('DD MMM, YYYY'));
	    });
		
		// evento detalles
		$('#controls input[type="radio"]').each(function(){
			$(this).click(function(){
				showTable(this.value)
			});
		})
		$('#cbFlota,#cbEquipo').change(function(){
				equipo=$("#cbEquipo").val();
				if (equipo=="Todos")
					showTable($('input[name=tipoResumen]:checked', '#controls').val())				
				else
					showTable()
		});
		
		function showTable(tipo){
			$("#divtables > table,#divtables > span").hide()
				if (tipo == "Resumen"){
					flot=$("#cbFlota").val()
					if($("#cbFlota").val()=="Todos")			
						$("#tResumenTodos").show()
					else
						$("#tResumenFlota").show()
				}else if(tipo=="Detalle"){ //tipo="Detalle"
					if($("#cbFlota").val()=="Todos")			
						$("#tDetalleTodos").show()
					else
						$("#tDetalleFlota").show()
				}else{
					$("#tDetalleEquipo").show()
					$("#divTables > span").show()						
				}
		}
	},
	showAlert:function(msg){
					alert (msg);
	}	
}
