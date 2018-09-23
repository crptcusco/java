<%@page import="modelo.DataBaseHelper"%>
<%@page import="modelo.Paciente"%>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fecha = request.getParameter("fecha");
    String dni = request.getParameter("dni");
    String sexo = request.getParameter("sexo");
    
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Paciente paciente = new Paciente(nombre, apellido, fecha, dni,sexo);
    paciente.insertar();
    response.sendRedirect("../administrador/pacientes.jsp");
%>
