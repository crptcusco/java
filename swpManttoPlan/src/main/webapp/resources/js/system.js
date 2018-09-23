var oApp;
$(function(){
	$('span[data-app]').each(function(){
		$(this).click(function(){
			$this=$(this)
			$("section.content-header h1").html($this.text()+"<small>"+$this.data("descripcion")+"</small>");
			$("li.active").html($this.text());
			$(".sidebar-menu li").removeClass("active");
			$this.parent().parent().className= "active";
			oApp={};
			callApp($this.data("app"))			
		});
	})
	function callApp(appName){
		$("#cssApp").load("static/resources/cssApp/"+appName+".css",function(){
			$(".content").load(appName, function (){
				//$.getScript("js/"+appName,function(){
					oApp.init();
				//});			
			});
		});
	}
	
});
