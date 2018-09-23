<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>MMG Mantto | Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
     <link rel="icon" href="<c:url value="/static/resources/png/favicon.png"/>" />
    <!-- Bootstrap 3.3.4 -->
    <link href="<c:url value="/static/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="<c:url value="/static/resources/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="<c:url value="/static/resources/css/AdminLTE.min.css"/>" rel="stylesheet" type="text/css" />
    <!-- iCheck -->
    <link href="<c:url value="/static/resources/plugins/iCheck/square/blue.css"/>" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body class="login-page">
    <div class="login-box">
      <div class="login-logo">
        <a href="../../index2.html"><b>MMG</b>Mantto</a>
      </div><!-- /.login-logo -->
      <div class="login-box-body">
        <p class="login-box-msg">Autentificarse para ingresar al sistema</p>
        <form:form commandName="loginUser" id="reg">
          <div class="form-group has-feedback">
            <form:input path="userName" class="form-control" placeholder="Usuario"/>
            <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <form:input path="pass" type="password" class="form-control" placeholder="Password"/>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> Recordarme
                </label>
              </div>                        
            </div><!-- /.col -->
            <div class="col-xs-4">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Ingresar</button>
            </div><!-- /.col -->
          </div>
        </form:form>
        <a href="#">Olvide mi clave</a><br>        
      </div><!-- /.login-box-body -->
    </div><!-- /.login-box -->

    <!-- jQuery 2.1.4 -->
    <script src="<c:url value="/static/resources/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="<c:url value="/static/resources/bootstrap/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <!-- iCheck -->
    <script src="<c:url value="/static/resources/plugins/iCheck/icheck.min.js"/>" type="text/javascript"></script>
    <script>
      $(function () {
        $('input').iCheck({
          checkboxClass: 'icheckbox_square-blue',
          radioClass: 'iradio_square-blue',
          increaseArea: '20%' // optional
        });
      });
    </script>
  </body>
</html>
