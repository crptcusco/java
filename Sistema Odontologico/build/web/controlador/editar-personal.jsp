<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Personal"%>
<%
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fecha = request.getParameter("fecha");
    String dni = request.getParameter("dni");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String tipo = request.getParameter("tipo");
    String estado = request.getParameter("estado");
    String contrasena = request.getParameter("contrasena1");
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Personal personal = new Personal(codigo,nombre, apellido, fecha, dni, telefono, direccion, tipo, estado, contrasena);
    personal.modificar();
    response.sendRedirect("../administrador/personal.jsp");
%>