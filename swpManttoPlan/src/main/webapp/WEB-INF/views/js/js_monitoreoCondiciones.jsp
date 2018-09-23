<%@ page language="java" contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"%>
oApp={
    init:function(){
        //vista de config
        //$('.content [data-vista="planConfig"]').show();
        //$("#cnt_vista [data-vista-cntrl]").click(function(){
        //    $('.content [data-vista]').hide();
        //    $('.content [data-vista="'+$(this).attr("data-vista-cntrl")+'"]').show();
        //})
        //$('#cnt_vista [data-vista-cntrl="planConfig"]').click();
        //config functions
		//*tablas de configuracion
		//$("#tHorometros").DataTable({
		//	"processing": true,
		//	"serverSide": true,
		//	"ajax": "planEquipos/thorometros",
		//	"searching": false,
		//	"columns": [
		//			{ "data": "proceso" },
		//			{ "data": "flota",
		//			"orderable": false },
		//			{ "data": "equipo",
		//			"orderable": false },
		//			{ "data": "fecha" },
		//			{ "data": "horoIni",
		//			"orderable": false },
		//			{ "data": "horoFin",
		//			"orderable": false },
		//			{ "data": "horas",
		//			"orderable": false }
		//	]
		//});
		//*/
        //combos dependientes
        $("#cbFlota").change(function(){
            var $option = $(this.options[this.selectedIndex]);
            oApp.optionFlota_change($option);
        });

		//$('input:radio[name="dataView"]').change(function(){
		//	if ($(this).is(':checked')) {
		//		oApp.radioDataView_change($(this))
		//	}
		//});
		//$('input:radio[name="tipoResumen"]').change(function(){
		//	if ($(this).is(':checked')) {
		//		oApp.radioTipoResumen_change($(this))
		//	}
		//});
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
    }
}