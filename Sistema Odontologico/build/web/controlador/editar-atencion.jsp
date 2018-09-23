<%@page import="modelo.*"%>
<%
    String codigopaciente = request.getParameter("codigopaciente");
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String fecha = request.getParameter("fecha");
    String dni = request.getParameter("dni");
    String sexo = request.getParameter("sexo");

//realizo la consulta usando el DBHelper y el codigo queda simplificado
    Paciente paciente = new Paciente(codigopaciente, nombre, apellido, fecha, dni, sexo);
    paciente.modificar();
//   String codigopaciente=paciente.getCodigo();

    String codigoatencion = request.getParameter("codigoatencion");
    String personal = request.getParameter("personal");
    String campana = request.getParameter("campana");
    String observaciones = request.getParameter("observaciones");
    System.out.println(observaciones);
    Atencion atencion = new Atencion(codigoatencion, codigopaciente, personal, campana, observaciones);
    atencion.modificar();

    //insertando las acciones seleccionadas
    AtencionAccion.eliminar(atencion.getCodigo());
    String selectacciones[] = request.getParameterValues("acciones");
    if (selectacciones != null && selectacciones.length != 0) {
        for (int i = 0; i < selectacciones.length; i++) {
            AtencionAccion atencionAccion = new AtencionAccion(atencion.getCodigo(), selectacciones[i]);
            atencionAccion.insertar();

        }
    }

    //insertando los problemas seleccionados
    AtencionProblema.eliminar(atencion.getCodigo());
    String selectproblemas[] = request.getParameterValues("problemas");
    if (selectproblemas != null && selectproblemas.length != 0) {
        for (int i = 0; i < selectproblemas.length; i++) {
            AtencionProblema atencionProblema = new AtencionProblema(atencion.getCodigo(), selectproblemas[i]);
            atencionProblema.insertar();
        }
    }
    response.sendRedirect("../secretaria/atencion.jsp?campana=" + campana);
%>