<%@page import="modelo.*"%>
<%
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fecha = request.getParameter("fecha");
    String dni = request.getParameter("dni");
    String sexo = request.getParameter("sexo");
    
//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Paciente paciente = new Paciente(nombre, apellido, fecha, dni,sexo);
    paciente.insertar();
    String codigopaciente=paciente.getCodigo();
    
    String personal = request.getParameter("personal");
    String campana = request.getParameter("campana");
    String observaciones = request.getParameter("observaciones");
    
    Atencion atencion = new Atencion(codigopaciente, personal, campana, observaciones);
    atencion.insertar();
    
    //insertando las acciones seleccionadas
    String selectacciones[] = request.getParameterValues("acciones"); 
if (selectacciones != null && selectacciones.length != 0) {
for (int i = 0; i < selectacciones.length; i++) {
        AtencionAccion atencionAccion =new AtencionAccion( atencion.getUltimoCodigo() , selectacciones[i]);
        atencionAccion.insertar();
}
}

    //insertando los problemas seleccionados
    String selectproblemas[] = request.getParameterValues("problemas"); 
if (selectproblemas != null && selectproblemas.length != 0) {
for (int i = 0; i < selectproblemas.length; i++) {
        AtencionProblema atencionProblema =new AtencionProblema( atencion.getUltimoCodigo() , selectproblemas[i]);
        atencionProblema.insertar();
}
}
    response.sendRedirect("../secretaria/atencion.jsp?campana=" + campana );
%>