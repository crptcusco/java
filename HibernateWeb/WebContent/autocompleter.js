
$(document).ready(function() {
        $(function() {
                $("#autor1").autocomplete({     
                source : function(request, response) {
                $.ajax({
                        url : "AutorServlet",
                        type : "GET",
                        data : {
                                term : request.term
                        },
                        dataType : "json",
                        success : function(data) {
                                response(data);
                        }
                });
        }
});
});
});