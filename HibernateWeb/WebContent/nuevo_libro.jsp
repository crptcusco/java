<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- User defied css -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="autocompleter.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js" ></script>

</head>
<body>
	<form action="insertar_libro.jsp">
		Nombre: <input name="nombre" type="text"><br /> 
		<div class="search-container">
        <div class="ui-widget">
                <input type="text" id="autor1" name="autor1" class="search" />
        </div>
</div><br>
		Autor : <input name="autor2" type="text"><br /> Autor : <input
			name="autor3" type="text"><br /> <a href="nuevo_autor">Agregar
			Autor</a> <input type="submit">
	</form>
</body>
</html>