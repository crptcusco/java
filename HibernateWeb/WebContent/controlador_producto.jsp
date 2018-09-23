<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Formulario nuevo Producto</h1>
<form method="POST" action="controlador_producto.jsp" >
<fieldset>
<legend>Formulario nuevo Producto</legend>
Nombre
<input type="text" name="nombre"><br>
Precio
<input type="text" name="precio"><br>
<input type="submit" value="Insertar" >
</fieldset>
</form>

</body>
</html>