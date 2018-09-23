<%
    HttpSession sesionOk = request.getSession();
    if (sesionOk.getAttribute("nombre") == null) {
%>
<jsp:forward page="../error.jsp">
    <jsp:param name="error" value="Es
               obligatorio identificarsne"/>
</jsp:forward>
<%
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="http://localhost:8080/Sistema_Odontologico/css/bootstrap-responsive.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="http://localhost:8080/Sistema_Odontologico/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="http://localhost:8080/Sistema_Odontologico/css/datepicker.css" rel="stylesheet">
        <link href="http://localhost:8080/Sistema_Odontologico/css/estilo.css" rel="stylesheet">
        <link href="http://localhost:8080/Sistema_Odontologico/css/style.css" rel="stylesheet" media="screen">
        <title>Sistema de Gestión de Campañas Odotologicas - A.C. Kaypi Kashianchis</title>
    </head>
    <body>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="http://localhost:8080/Sistema_Odontologico/js/jquery-1.9.1.min.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/bootstrap.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/bootstrap-datepicker.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/jquery.validate.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/formulario.js"></script>
        
        <div class="row-fluid navbar-inner">           
            <div class="span10 offset1 ">
                <div class="span6">
                    <h1> Sistema de Gestión de <br/>Campañas Odontologicas</h1>
                    <h4><em>Asociación Civil Kaypi Kashianchis</em></h4>
                    <p>Bienvenido Sr(a): <i class="icon-user"></i> <%= session.getAttribute("nombre")%>
                        <a href="../controlador/controlador-salida.jsp"> Cerrar Sesion</a></p>
                </div>

                <div class="span6 ">
                    <img class="pull-right" src="../ico/logo.png" height="150" width="150">
                </div>       


            </div>
                        </div>
        <div class="row-fluid">
            <div class="navbar span10 offset1 " >
                <br>
                <div class="navbar-inner  ">
                    <a class="brand" href="principal.jsp">Administrador</a>
                    <ul class="nav ">
                        <li><a href="campana.jsp">Campañas</a></li>
                        <li><a href="pacientes.jsp">Pacientes</a></li>
                        <li><a href="personal.jsp">Personal</a></li>
                        <li><a href="recursos.jsp">Recursos</a></li>
                        <li><a href="reportes.jsp">Reportes</a></li>
                        <li><a href="documentacion.jsp">Documentación</a></li>
                    </ul>
                </div> 
            </div>

        </div>        

               
