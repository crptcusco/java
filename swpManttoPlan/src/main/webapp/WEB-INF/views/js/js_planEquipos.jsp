<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"%>
(function($) {
    // Attrs
    $.fn.getAttrs = function() {
        var t = $(this);
        // Get attributes
		var a = {},
			r = t.get(0);
		if (r) {
			r = r.attributes;
			for (var i in r) {
				var p = r[i];
				if (typeof p.nodeValue !== 'undefined') a[p.nodeName] = p.nodeValue;
			}
		}
		return a;
    };
})(jQuery);
oApp={
	plan:{},
	refreshData:{},
    init:function(){
        //vista de config
        //$('.content [data-vista="planConfig"]').show();
        $("#cnt_vista [data-vista-cntrl]").click(function(){
            $('.content [data-vista]').hide();
            $('.content [data-vista="'+$(this).attr("data-vista-cntrl")+'"]').show();
        })
        $('#cnt_vista [data-vista-cntrl="planConfig"]').click();
        //config functions
        oApp.config_calendar();
		$("#savePlan").click(function(){
            var plan={nombre:$("#txtPlan").val(),
                      fechaIni:oApp.startDate,
                      fechaFin:oApp.endDate,
                      nroDias:$('#txtHist').val()}
            $.post("planEquipos/save",
                    plan,
                    function(json){
                        if (json.rsta=="ok") {
                            $("#cbPlan").append('<option value="'+json.planConfig.plan.id+'">'+json.planConfig.plan.nombre+'</option>');
                            $('#cbPlan option[value="'+json.planConfig.plan.id+'"]').attr('selected', 'selected');
                            $('#cnt_vista [data-vista-cntrl="viewPlan"]').click();
							oApp.plan=json.planConfig.plan;
							oApp.config_plan(json.planConfig);
							oApp.fill_planData(json.planData);                            
                        }
                    },
                    "json");            
        });
		//*tablas de configuracion
		$("#tHorometros").DataTable({
			"processing": true,
			"serverSide": true,
			"ajax": "planEquipos/thorometros",
			"searching": false,
			"columns": [
					{ "data": "proceso" },
					{ "data": "flota",
					"orderable": false },
					{ "data": "equipo",
					"orderable": false },
					{ "data": "fecha" },
					{ "data": "horoIni",
					"orderable": false },
					{ "data": "horoFin",
					"orderable": false },
					{ "data": "horas",
					"orderable": false }
			]
		});
		//*/
        //combos dependientes
        $("#cbFlota").change(function(){
            var $option = $(this.options[this.selectedIndex]);
            oApp.optionFlota_change($option);
        });
		$("#cbPlan").change(function(){
			oApp.cbPLan_change($(this.options[this.selectedIndex]).val())
		});
		$('input:radio[name="dataView"]').change(function(){
			if ($(this).is(':checked')) {
				oApp.radioDataView_change($(this))
			}
		});
		$('input:radio[name="tipoResumen"]').change(function(){
			if ($(this).is(':checked')) {
				oApp.radioTipoResumen_change($(this))
			}
		});
	},
	loadHorometro:function(){
		
	},
	cbPLan_change:function(val){
		$.post("planEquipos/getPlan",
                    {plan_id:val},
                    function(json){
                        if (json.rsta=="ok") {
							oApp.plan=json.planConfig.plan;
							oApp.config_plan(json.planConfig);
							oApp.fill_planData(json.planData);
							$('input:radio[name="dataView"]').change();
							$('input:radio[name="tipoResumen"]').change();
                        }
                    },
                    "json");
	},
	config_plan:function(oPlan){
		var idt=moment(oPlan.plan.fechaIni);
        var fdt=moment(oPlan.plan.fechaFin);
        $("#alldetalleEquipo thead tr").html("<th>Flota</th><th>Equipo</th>");
		$("#alldetalleFlota thead tr").html("<th>Proceso</th><th>Flota</th>");
		$("#alldetalleEquipo td, #alldetalleFlota td").remove();		
		for (var i=0;i<oPlan.idsMap.length;i++) {
			with (oPlan.idsMap[i]){
				$('tr[data-equipo="'+equipo_id+'"]').attr({"data-planeid":planEquipo_id,"data-disp":Math.round(dispo*10000)/100});
			}
		}
		for (;idt<=fdt;idt.add(1, 'd')) {
			var fd=idt.format("MM - DD");
			var fdf=idt.format("YYYY-MM-DD");
			$("#alldetalleEquipo thead tr,#alldetalleFlota thead tr").append('<th data-valdate="'+fdf+'">'+fd+"</th>");
			$('tr[data-equipo]').append('<td data-valdate="'+fdf+'" ></td>');
		}
	},
	refresh_plan:function(){
		if (!$.isEmptyObject(oApp.refreshData)) {
			oApp.clear_data();
			oApp.fill_planData(oApp.refreshData);
			$('input:radio[name="dataView"]').change();
			oApp.refreshData={};
		}
	},
	clear_data:function(){
        var fdt=moment(this.plan.fechaFin);
		var pe_id=0;
		for (var i=0;i<this.refreshData.sourceEquipo.length;i++) {
			with (this.refreshData.sourceEquipo[i]){
				if (pe_id != planEquipo_id) {
					var $tr=$('tr[data-planeid="'+planEquipo_id+'"]')
					$('td',$tr).remove();
					var idt=moment(this.plan.fechaIni);
					for (;idt<=fdt;idt.add(1, 'd')) {
						$tr.append('<td data-valdate="'+idt.format("YYYY-MM-DD")+'" ></td>');
					}
					pe_id=planEquipo_id;
				}
			}
		}
		pe_id=""
		for (var i=0;i<this.refreshData.sourceFlota.length;i++) {
			with (this.refreshData.sourceFlota[i]){
				if (pe_id!=flota_modelo_id) {
					$('tr[data-flota="'+flota_modelo_id+'"] td').remove();
					pe_id=flota_modelo_id;
				}
			}
		}
	},
	fill_planData:function(oPlanData){
		var pe_id=0;
		var $tr;
		for (var i=0;i<oPlanData.sourceEquipo.length;i++) {
			var idt=moment(this.plan.fechaIni);
			var fdt=moment(this.plan.fechaFin);
			with (oPlanData.sourceEquipo[i]){
				if (planEquipo_id!=pe_id) {
					if ($tr!==undefined) oApp.popover_config($('td',$tr));
					$tr=$('tr[data-planeid="'+planEquipo_id+'"]')
					pe_id=planEquipo_id;
				}				
				if (moment(fecha)>=idt && moment(fecha)<=fdt) {
					var $td=$('td[data-valdate="'+fecha+'"]',$tr);
					var dat={};
					if (typeof frecuencia!=='undefined'){
						dat["data-pm"]=(nivel==0)?"Pre-PM":("PM-"+frecuencia);
						dat["data-durpm"]=durPM;
						dat["data-planpm_id"]=planPM_id;
						dat["data-estFecha"]=estFecha;
						if(typeof durComp === 'undefined') $td.addClass("bg-"+nivel);
					}
					if (typeof durADD !== 'undefined'){
						dat["data-duradd"]=durADD;
						dat["data-planadd_id"]=planAdicional_id;
					}
					if (typeof durComp !== 'undefined'){
						dat["data-durcomp"]=durComp;
						dat["data-equipocomp_ids"]=equipoComp_ids;
						$td.addClass("bg-c");
					}
					dat["data-disp"]=disp					
					$td.attr($.extend($td.getAttrs(),dat));
				}
			}
		}
		if ($tr!==undefined) oApp.popover_config($('td',$tr));
		
		for (var i=0;i<oPlanData.sourceFlota.length;i++) {
			with (oPlanData.sourceFlota[i]){
				var $row=$('tr[data-flota="'+flota_modelo_id+'"]')
				var dat= ((nPMs!=0)?'data-pm="'+nPMs+'" ':"")+
						 ((nADDs!=0)?'data-add="'+nADDs+'" ':"")+
						 ((typeof durPM!=='undefined')?'data-durpm="'+durPM+'" ':"")+
						 ((typeof durADD!=='undefined')?'data-duradd="'+durADD+'" ':"")+
						 'data-disp="'+disp+'" '
						 //console.log(dat)
				$row.append('<td '+dat+'></td>');
			}
		}
		//oApp.popover_config();
		$('#uploadHorometro').click(function(){
			oApp.loadHorometro();
		});
	},
    config_calendar:function(){
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
            oApp.startDate=start.format('YYYY-MM-DD');
            oApp.endDate=end.format('YYYY-MM-DD');
            $('#reportrange span').html(start.format('DD MMM, YYYY') + ' - ' + end.format('DD MMM, YYYY'));
        });
        oApp.startDate=moment().endOf('week').add(1,'day').format('YYYY-MM-DD');
        oApp.endDate=moment().endOf('week').add(1,'day').endOf('week').format('YYYY-MM-DD');
    },
    optionFlota_change:function($option){
        var paramview;
        var elemVista="#cbEquipo optgroup"+
                  ",#alldetalleEquipo tbody"+
                  ",#alldetalleFlota tbody";
        switch ($option.val()) {
            case "todos":
                $(elemVista).show();
                break;
            case "todosProceso":
                paramview='data-proceso="'+$option.attr("data-proceso")+'"'
                $(elemVista).hide();
                $("#cbEquipo optgroup["+paramview+"]"+
                  ",#alldetalleEquipo tbody["+paramview+"]"+
                  ",#alldetalleFlota tbody["+paramview+"]").show(); 
                break;
            default:
                paramview='data-flota="'+$option.val()+'"'
                $(elemVista).hide()
                $("#cbEquipo optgroup["+paramview+"]"+
                  ",#alldetalleEquipo tbody["+paramview+"]"+
                  ",#alldetalleFlota tbody["+paramview+"]").show(); 
                break;
        }   
    },
    radioDataView_change:function($radio){
        var vista=$radio.val();
        $("#titleBoxRs").html($('label[for="'+$radio.attr('id')+'"]').text()+" -> "+$("#cbFlota :selected").text());
		var $contex=$("#divtables");
		if (vista=="pm"){
			$('td',$contex).empty();
			$("#alldetalleEquipo td[data-disp], #alldetalleFlota td[data-durpm]").each(function(i){
				var val=$(this).data("pm");
				if (val==undefined && $(this).data('durcomp')>0 ) val="Comp."
				this.innerHTML=(val==undefined)?"Add":val
			})
			$("#alldetalleFlota td[data-duradd]").each(function(i){
				var add=$(this).data("add");
				this.innerHTML=this.innerHTML+"+"+add+"ads.";
			})
		}
		else if (vista=="durPM") {
			$('td',$contex).empty();
			$("#alldetalleEquipo td[data-disp], #alldetalleFlota td[data-durpm]").each(function(i){
				var val=$(this).data("durpm");
				var add=$(this).data("duradd");				
				this.innerHTML=((val==undefined)?"":val)+((add==undefined)?"hrs.":"");
			})
			$("#alldetalleEquipo td[data-duradd], #alldetalleFlota td[data-duradd]").each(function(i){
				var add=$(this).data("duradd");	
				this.innerHTML=this.innerHTML+"+"+add+"hrs.";
			})
		}
		else if (vista=="disp") {
			$("td",$contex).each(function(i){
				var val=$(this).data("disp");
				this.innerHTML=((val==undefined)?$(this.parentNode).data("disp"):val)+"%";
			})
		}
    },
    radioTipoResumen_change:function($radio){
        $("#divtables table").hide();
        $("#alldetalle"+$radio.val()).show();
    },
    popover_config:function($tds){
		if ($tds==undefined) $tds=$("#alldetalleEquipo td");
        $tds.click(function() {
            var $e=$(this);
            if ($e.data("pop-config") == undefined){
				if($e.data("durcomp")){
					var planEquipo_id=$($e.parent()).data("planeid");
					$.get("planEquipos/planComp="+planEquipo_id,function(d) {
						$e.popover({html:true,
								   container: '#popsEquipo',
								   title:'Detalle PM <div class="box-tools pull-right">'+
										  '<button type="button" class="btn btn-box-tool" data-closepop="true"><i class="fa fa-times"></i></button></div>',
								   trigger:'manual',
								   template:'<div data-idplanComp="'+planEquipo_id+'" class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
								   placement:'auto right',
								   content:d
								}).popover('show');
						oApp.popover_postconfigComp($e);
					});
				}
				else if($e.data("planpm_id")){
					$.get("planEquipos/planPM="+$e.data("planpm_id"),function(d) {
						$e.popover({html:true,
								   container: '#popsEquipo',
								   title:'Detalle PM <div class="box-tools pull-right">'+
										  '<button type="button" class="btn btn-box-tool" data-closepop="true"><i class="fa fa-times"></i></button></div>',
								   trigger:'manual',
								   template:'<div data-idplan="'+$e.data("planpm_id")+'" class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
								   placement:'auto right',
								   content:d
								}).popover('show');
						oApp.popover_postconfigPM($e);
					});
				}else{//popup de trabajo adicional
					if ($e.data("planadd_id")==undefined) {
					$e.popover({html:true,
			     				container: '#popsEquipo',
								title:'Plan Adicional <div class="box-tools pull-right">'+
										'<button type="button" class="btn btn-box-tool" data-closepop="true"><i class="fa fa-times"></i></button></div>',
								trigger:'manual',
								placement:'auto right',
								template:'<div data-planadd_id="0" class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
								content:'<%@include file="../popoverPlanAdd.jsp" %>'
							}).popover('show');
							oApp.popover_postconfigAdd($e);
					}
					else{
						$.get("planEquipos/planAdd="+$e.data("planadd_id"),function(d) {
							$e.popover({html:true,
										container: '#popsEquipo',
										title:'Detalle PM <div class="box-tools pull-right">'+
											   '<button type="button" class="btn btn-box-tool" data-closepop="true"><i class="fa fa-times"></i></button></div>',
										trigger:'manual',
										placement:'auto right',
										template:'<div data-planadd_id="'+$e.data("planadd_id")+'" class="popover" role="tooltip"><div class="arrow"></div><h3 class="popover-title"></h3><div class="popover-content"></div></div>',
										content:d
									 }).popover('show');
							oApp.popover_postconfigAdd($e);
						});
					}					
				}
				$e.data("pop-config",true);
            }else if($e.data("planpm_id")){
                $e.popover('show');
				oApp.popover_postconfigPM($e);
            }else {
				$e.popover('show');
				oApp.popover_postconfigAdd($e);
			}
        });
    },
	popover_postconfigComp:function($e){
		
	},
    popover_postconfigPM:function($e){
        var $cont=$('#popsEquipo [data-idplan="'+$e.data("planpm_id")+'"]')
		$('[data-disp="0"]',$cont).html($e.data("disp"));
		$("button[data-movday]",$cont).click(function(){
			$f=$('input[data-fnc="fe"]',$cont)
			$f.val(moment($f.val()).add($(this).data("movday"),'d').format("YYYY-MM-DD"));
			$f.change();
		});
		$('input',$cont).change(function(){
			$("button[data-savedate] .glyphicon").removeClass("glyphicon-ok").addClass("glyphicon-floppy-disk");
			$('button[data-savedate]',$cont).data("savedate",false);
		});
		$('button[data-closepop="true"]',$cont).click(function(){
			$e.popover('hide');
			oApp.refresh_plan();
		});
		$('button[data-savedate]',$cont).click(function(){
			var $t=$(this)
			if($t.data("savedate")==false){
				$.post("planEquipos/updatePlanPM",
					   {planPM_id:$e.data("planpm_id"),
					   planAdd_id:($e.data("planadd_id")==undefined)?0:$e.data("planadd_id"),
					   fechaEst:$('input[data-fnc="fe"]',$cont).val(),
					   addRazon:$('#padd_').val(),
					   addDur:$('#padd_dur_').val()
					   },
					   function(o){
							if (o.rest="ok") {
								$(".glyphicon",$t).removeClass("glyphicon-floppy-disk").addClass("glyphicon-ok");
								$t.data("savedate",true);
								oApp.refreshData=o.planData;								
							}
						},
					   'json');
			}
		});
    },
	popover_postconfigAdd:function($e){
		var id=($e.data("planadd_id")==undefined)?0:$e.data("planadd_id")
		var $cont=$('#popsEquipo [data-planadd_id="'+id+'"]')
		$('input',$cont).change(function(){
			$("button[data-savedate] .glyphicon").removeClass("glyphicon-ok").addClass("glyphicon-floppy-disk");
			$('button[data-savedate]',$cont).data("savedate",false);
		});
		$('button[data-closepop="true"]',$cont).click(function(){
			$e.popover('hide');
			oApp.refresh_plan();
		});
		$('button[data-savedate]',$cont).click(function(){
			var $t=$(this)
			if($t.data("savedate")==false){
				if ($e.data("planadd_id")) {//actualizar
					$.post("planEquipos/updatePlanAdd",
						   {planadd_id:id,
						   addRazon:$('#padd_').val(),
						   addDur:$('#padd_dur_').val()
						   },
						   function(o){
								if (o.rest="ok") {
									$(".glyphicon",$t).removeClass("glyphicon-floppy-disk").addClass("glyphicon-ok");
									$t.data("savedate",true);
									oApp.refreshData=o.planData;
								}
							},
						   'json');
				}else{//nuevo
					var date=$($("thead th",$e.parents("table")).get($e.index())).data("valdate");
					$.post("planEquipos/registerPlanAdd",
						   {planequipo_id:$e.parent().data("planeid"),
						   fecha:date,
						   addRazon:$('#padd_').val(),
						   addDur:$('#padd_dur_').val()
						   },
						   function(o){
								if (o.rest="ok") {
									$(".glyphicon",$t).removeClass("glyphicon-floppy-disk").addClass("glyphicon-ok");
									$t.data("savedate",true);
									oApp.refreshData=o.planData;
								}
							},
						   'json');
				}
			}
		});
	}
}