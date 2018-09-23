<%-- 
    Document   : index
    Created on : 27/10/2013, 11:43:59 AM
    Author     : Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sistema de Gestión de Campañas Odotologicas - A.C. Kaypi Kashianchis</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="http://localhost:8080/Sistema_Odontologico/css/bootstrap.min.css" rel="stylesheet" media="screen">
        <link href="http://localhost:8080/Sistema_Odontologico/css/estilo.css" rel="stylesheet" media="screen">
    </head>
    <body>
        <script src="http://localhost:8080/Sistema_Odontologico/js/jquery-1.9.1.min.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/bootstrap.min.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/formulario.js"></script>
        <script src="http://localhost:8080/Sistema_Odontologico/js/jquery.validate.js"></script>
        
        <div class="row-fluid navbar-inner">           
            <div class="span10 offset1">
                <div class="span6">
                    <h1> Sistema de Gestión de <br/>Campañas Odontologicas</h1>
                    <h4><em>Asociación Civil Kaypi Kashianchis</em></h4>
                    <p>Aun no has iniciado session</p>
                    
                </div>

                <div class="span6 ">
                    <img class="pull-right" src="ico/logo.png" height="150" width="150">
                </div>
                
            </div>
           
        </div>  
        
        <div class="row-fluid ">
            <div class="span4 offset4"><br>
                
            <%try{
            if(request.getParameter("error").equals("1")){%>
                <div class=" alert fade in">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Credenciales Incorrectas!</strong> El usuario no existe 
          </div>
            <%}
            }catch(Exception e){
            System.out.println(e);
            }
            %>
            
            <%try{
            if(request.getParameter("error").equals("2")){%>
                <div class=" alert fade in">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>Contraseña Incorrecta!</strong> Favor verificar 
          </div>
            <%}
            }catch(Exception e){
            System.out.println(e);
            }
            %>
            </div>
        </div>

        <div class="row-fluid">
            
            <div class=" span4 offset4 ">
                <form id="formulario" class="form-horizontal " action="controlador/controlador-ingreso.jsp">

                    <fieldset>
                        <legend>Inicio de sesion</legend>
                        <div class="control-group">
                            <label class="control-label" for="usuario">Codigo :</label>
                            <div class="controls">
                                <input  id="usuario" type="text" name="usuario">
                            </div>
                        </div>
                        <div class="control-group">
                            <label class="control-label" for="contrasena">Contrasena :</label>
                            <div class="controls">
                                <input id="contrasena" type="password" name="contrasena">
                            </div>
                        </div>
                        <div class="control-group">
                            <div class="controls">
                                <button type="submit" class="btn btn-primary" value="Ingresar">Ingresar</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div><br></div>
        <div class="row-fluid pie">
            <div class="offset1 span10">
                <div class="span6 ">
                    <h4>Asociacion Civil Kaypi Kashianchis</h4> 
                    Urb Mariscal Gamarra A1-3 dept. 103 <br>
                    Wanchaq - Cusco<br>
                    Numero Telefonico (123) 456-7890<br>
                    E-mail : artrabe@hotmail.com<br>
                </div>

                <div class="span6 pull-right">
                    <p class="pull-right">
                        Desarrollado y diseñado por:<br><img src="ico/logo2.png" height="150" width="350" class="">
                    </p>    
                </div>

            </div>
        </div>
    </body>
</html>

